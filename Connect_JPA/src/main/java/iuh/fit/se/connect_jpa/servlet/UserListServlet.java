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
import java.util.List;

@WebServlet(name = "userListServlet", value = "/user-list")
public class UserListServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            List<User> users = userDAO.findAll();
            
            request.setAttribute("users", users);
            request.getRequestDispatcher("user-list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi tải danh sách users: " + e.getMessage());
            request.getRequestDispatcher("user-list.jsp").forward(request, response);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}