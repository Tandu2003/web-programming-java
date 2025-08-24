package iuh.fit.se.tuan01;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "jsonServlet", value = "/json-servlet")
public class JsonServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello, this is a JSON response!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("\"message\": \"" + message + "\"");
        out.println("}");
    }

    public void destroy() {
    }
}
