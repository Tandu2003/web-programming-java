package iuh.fit.se.tuan01;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "registerServlet", value = "/register-servlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Không hiển thị
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String bio = request.getParameter("bio");

        out.println("<html><body>");
        out.println("<h1>Registration Details</h1>");
        out.println("<p>Username: " + username + "</p>");
        out.println("<p>Email: " + email + "</p>");
        out.println("<p>Country: " + country + "</p>");
        out.println("<p>Bio: " + bio + "</p>");
        out.println("</body></html>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }
}