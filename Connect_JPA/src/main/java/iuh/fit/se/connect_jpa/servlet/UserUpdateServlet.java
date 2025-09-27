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

@WebServlet(name = "userUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            // Lấy dữ liệu từ form
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String country = request.getParameter("country");
            
            // Validation
            if (idStr == null || idStr.trim().isEmpty()) {
                request.setAttribute("error", "ID user không hợp lệ!");
                response.sendRedirect("user-list");
                return;
            }
            
            if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                country == null || country.trim().isEmpty()) {
                
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                response.sendRedirect("user-list");
                return;
            }
            
            Long id = Long.parseLong(idStr);
            
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            // Tìm user hiện tại
            User existingUser = userDAO.findById(id);
            if (existingUser == null) {
                request.setAttribute("error", "Không tìm thấy user với ID: " + id);
                response.sendRedirect("user-list");
                return;
            }
            
            // Cập nhật thông tin
            existingUser.setName(name.trim());
            existingUser.setEmail(email.trim());
            existingUser.setPassword(password.trim());
            existingUser.setCountry(country.trim());
            
            // Lưu thay đổi
            userDAO.update(existingUser);
            
            // Redirect về danh sách users
            response.sendRedirect("user-list");
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID user không hợp lệ!");
            response.sendRedirect("user-list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật user: " + e.getMessage());
            response.sendRedirect("user-list");
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}