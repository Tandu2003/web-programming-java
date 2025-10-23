<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống Quản lý Bệnh nhân</title>
    <style>
        body {
            margin: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .menu-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin: 20px 0;
        }
        
        .menu-item {
            padding: 15px;
            text-decoration: none;
            text-align: center;
            flex: 1;
            min-width: 180px;
            border: 1px solid #ccc;
        }
        
        .search-form {
            padding: 15px;
            margin: 20px 0;
            border: 1px solid #ccc;
        }
        
        .form-group {
            display: flex;
            gap: 10px;
        }
        
        .form-group input {
            flex: 1;
            padding: 8px;
        }
        
        .form-group button {
            padding: 8px 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Hệ thống Quản lý Bệnh nhân</h1>
            <p>Quản lý thông tin bệnh nhân và khoa điều trị</p>
        </div>
        
        <div class="menu-grid">
            <a href="${pageContext.request.contextPath}/benhnhan?action=list" class="menu-item">
                <h3>Danh sách Bệnh nhân</h3>
                <p>Xem tất cả bệnh nhân trong hệ thống</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/khoa" class="menu-item">
                <h3>Danh sách Khoa</h3>
                <p>Xem thông tin các khoa điều trị</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/benhnhan?action=listByKhoa" class="menu-item">
                <h3>Bệnh nhân theo Khoa</h3>
                <p>Xem danh sách bệnh nhân theo khoa điều trị</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/benhnhan?action=addForm" class="menu-item">
                <h3>Thêm Bệnh nhân</h3>
                <p>Thêm bệnh nhân mới vào hệ thống</p>
            </a>
        </div>
        
        <div class="search-form">
            <h4>Tìm kiếm Bệnh nhân</h4>
            <form action="${pageContext.request.contextPath}/benhnhan" method="get">
                <input type="hidden" name="action" value="search">
                <div class="form-group">
                    <input type="text" name="hoTen" placeholder="Nhập tên bệnh nhân..." required>
                    <button type="submit">Tìm kiếm</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>