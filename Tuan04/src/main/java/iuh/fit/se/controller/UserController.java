package iuh.fit.se.controller;

import iuh.fit.se.dao.UserDAO;
import iuh.fit.se.dao.UserDAOImpl;
import iuh.fit.se.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Set;

@WebServlet(name = "userController", urlPatterns = {"/register", "/users", "/delete-user"})
public class UserController extends HttpServlet {

    @Resource(name = "jdbc/userdb")
    private DataSource dataSource;
    private UserDAO userDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.userDAO = new UserDAOImpl(this.dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        switch (path) {
            case "/register":
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
                break;
            case "/users":
                req.setAttribute("users", userDAO.findAll());
                req.getRequestDispatcher("/views/userlist.jsp").forward(req, resp);
                break;
            case "/delete-user":
                int userId = Integer.parseInt(req.getParameter("id"));
                userDAO.delete(userId);
                resp.sendRedirect(req.getContextPath() + "/users");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if ("/register".equals(path)) {
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            Validator validator = factory.getValidator();

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String country = req.getParameter("country");

            User user = new User(name, email, password, country);
            Set<ConstraintViolation<User>> violations = validator.validate(user);

            if (!violations.isEmpty()) {
                req.setAttribute("errors", violations);
                req.setAttribute("user", user);
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            } else {
                boolean success = userDAO.save(user);
                if (success) {
                    req.setAttribute("message", "Đăng ký thành công!");
                    req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Có lỗi xảy ra khi đăng ký!");
                    req.setAttribute("user", user);
                    req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
                }
            }
        }
    }
}
