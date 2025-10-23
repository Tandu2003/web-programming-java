package iuh.fit.se.controllers;

import iuh.fit.se.daos.BenhNhanDAO;
import iuh.fit.se.daos.KhoaDAO;
import iuh.fit.se.daos.impl.BenhNhanDAOImpl;
import iuh.fit.se.daos.impl.KhoaDAOImpl;
import iuh.fit.se.entities.BenhNhan;
import iuh.fit.se.entities.Khoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/benhnhan")
public class BenhNhanServlet extends HttpServlet {
    private BenhNhanDAO benhNhanDAO = new BenhNhanDAOImpl();
    private KhoaDAO khoaDAO = new KhoaDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "list":
                listBenhNhan(request, response);
                break;
            case "search":
                searchBenhNhan(request, response);
                break;
            case "listByKhoa":
                listBenhNhanByKhoa(request, response);
                break;
            case "addForm":
                showAddForm(request, response);
                break;
            default:
                listBenhNhan(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addBenhNhan(request, response);
        } else {
            doGet(request, response);
        }
    }
    
    private void listBenhNhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BenhNhan> list = benhNhanDAO.getList();
        request.setAttribute("benhNhanList", list);
        request.getRequestDispatcher("/WEB-INF/views/danh-sach-benh-nhan.jsp").forward(request, response);
    }
    
    private void searchBenhNhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        List<BenhNhan> list = benhNhanDAO.getBenhNhanhByName(hoTen);
        request.setAttribute("benhNhanList", list);
        request.setAttribute("searchTerm", hoTen);
        request.getRequestDispatcher("/WEB-INF/views/tim-kiem-benh-nhan.jsp").forward(request, response);
    }
    
    private void listBenhNhanByKhoa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String maKhoaParam = request.getParameter("maKhoa");
            List<Khoa> khoaList = khoaDAO.getList();
            request.setAttribute("khoaList", khoaList);
            
            if (maKhoaParam != null && !maKhoaParam.trim().isEmpty()) {
                int maKhoa = Integer.parseInt(maKhoaParam);
                List<BenhNhan> list = benhNhanDAO.getListByKhoa(maKhoa);
                
                request.setAttribute("benhNhanList", list);
                request.setAttribute("selectedKhoa", maKhoa);
                
                // Find the selected department name for display
                String selectedKhoaName = "";
                for (Khoa khoa : khoaList) {
                    if (khoa.getMaKhoa() == maKhoa) {
                        selectedKhoaName = khoa.getTenKhoa();
                        break;
                    }
                }
                request.setAttribute("selectedKhoaName", selectedKhoaName);
            } else {
                // No department selected, show empty list
                request.setAttribute("benhNhanList", new ArrayList<>());
                request.setAttribute("selectedKhoa", null);
                request.setAttribute("selectedKhoaName", "");
            }
            
            request.getRequestDispatcher("/WEB-INF/views/benh-nhan-theo-khoa.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Mã khoa không hợp lệ!");
            List<Khoa> khoaList = khoaDAO.getList();
            request.setAttribute("khoaList", khoaList);
            request.setAttribute("benhNhanList", new ArrayList<>());
            request.getRequestDispatcher("/WEB-INF/views/benh-nhan-theo-khoa.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            List<Khoa> khoaList = khoaDAO.getList();
            request.setAttribute("khoaList", khoaList);
            request.setAttribute("benhNhanList", new ArrayList<>());
            request.getRequestDispatcher("/WEB-INF/views/benh-nhan-theo-khoa.jsp").forward(request, response);
        }
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Khoa> khoaList = khoaDAO.getList();
        request.setAttribute("khoaList", khoaList);
        request.getRequestDispatcher("/WEB-INF/views/them-benh-nhan.jsp").forward(request, response);
    }
    
    private void addBenhNhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String hoTen = request.getParameter("hoTen");
            String ngayNhapVienStr = request.getParameter("ngayNhapVien");
            String chuanDoan = request.getParameter("chuanDoan");
            int maKhoa = Integer.parseInt(request.getParameter("maKhoa"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date ngayNhapVien = sdf.parse(ngayNhapVienStr);
            Khoa khoa = new Khoa(maKhoa);
            
            BenhNhan benhNhan = new BenhNhan(hoTen, ngayNhapVien, chuanDoan, khoa);
            
            boolean success = benhNhanDAO.addBenhNhanByMaKhoa(benhNhan);
            
            if (success) {
                request.setAttribute("message", "Thêm bệnh nhân thành công!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Có lỗi xảy ra khi thêm bệnh nhân!");
                request.setAttribute("messageType", "error");
            }
            
            showAddForm(request, response);
            
        } catch (Exception e) {
            request.setAttribute("message", "Có lỗi xảy ra: " + e.getMessage());
            request.setAttribute("messageType", "error");
            showAddForm(request, response);
        }
    }
}
