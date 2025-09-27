package iuh.fit.se.connect_jpa.servlet;

import iuh.fit.se.connect_jpa.dao.UserDAO;
import iuh.fit.se.connect_jpa.dao.UserDAOImpl;
import iuh.fit.se.connect_jpa.entity.User;
import iuh.fit.se.connect_jpa.util.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "userSaveServlet", value = "/user-save")
public class UserSaveServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            // Lấy dữ liệu từ form
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String country = request.getParameter("country");
            
            // Validation
            if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                country == null || country.trim().isEmpty()) {
                
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("user-form.jsp").forward(request, response);
                return;
            }
            
            // Tạo user mới
            User user = new User(name.trim(), email.trim(), password.trim(), country.trim());
            
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            // Lưu user
            userDAO.save(user);
            
            // Redirect về danh sách users
            response.sendRedirect("user-list");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi lưu user: " + e.getMessage());
            request.getRequestDispatcher("user-form.jsp").forward(request, response);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}