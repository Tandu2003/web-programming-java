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

@WebServlet(name = "userFormServlet", value = "/user-form")
public class UserFormServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            // Lấy ID từ parameter (nếu có - cho edit mode)
            String idStr = request.getParameter("id");
            
            if (idStr != null && !idStr.trim().isEmpty()) {
                // Edit mode - tìm user để hiển thị trong form
                Long id = Long.parseLong(idStr);
                
                em = EntityManagerFactoryUtil.getEntityManager();
                UserDAO userDAO = new UserDAOImpl(em);
                
                User user = userDAO.findById(id);
                if (user != null) {
                    request.setAttribute("user", user);
                } else {
                    request.setAttribute("error", "Không tìm thấy user với ID: " + id);
                }
            }
            // Nếu không có ID, form sẽ ở chế độ thêm mới
            
            request.getRequestDispatcher("user-form.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID user không hợp lệ!");
            request.getRequestDispatcher("user-form.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi tải form: " + e.getMessage());
            request.getRequestDispatcher("user-form.jsp").forward(request, response);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}