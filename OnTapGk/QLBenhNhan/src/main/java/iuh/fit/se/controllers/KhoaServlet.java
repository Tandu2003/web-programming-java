package iuh.fit.se.controllers;

import iuh.fit.se.daos.KhoaDAO;
import iuh.fit.se.daos.impl.KhoaDAOImpl;
import iuh.fit.se.entities.Khoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/khoa")
public class KhoaServlet extends HttpServlet {
    private KhoaDAO khoaDAO = new KhoaDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Khoa> list = khoaDAO.getList();
        request.setAttribute("khoaList", list);
        request.getRequestDispatcher("/WEB-INF/views/danh-sach-khoa.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
