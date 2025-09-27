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

@WebServlet(name = "userDeleteServlet", value = "/user-delete")
public class UserDeleteServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            // Lấy ID từ parameter
            String idStr = request.getParameter("id");
            
            // Validation
            if (idStr == null || idStr.trim().isEmpty()) {
                request.setAttribute("error", "ID user không hợp lệ!");
                response.sendRedirect("user-list");
                return;
            }
            
            Long id = Long.parseLong(idStr);
            
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            // Kiểm tra user có tồn tại không
            User user = userDAO.findById(id);
            if (user == null) {
                request.setAttribute("error", "Không tìm thấy user với ID: " + id);
                response.sendRedirect("user-list");
                return;
            }
            
            // Xóa user
            userDAO.delete(id);
            
            // Redirect về danh sách users
            response.sendRedirect("user-list");
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID user không hợp lệ!");
            response.sendRedirect("user-list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi xóa user: " + e.getMessage());
            response.sendRedirect("user-list");
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}