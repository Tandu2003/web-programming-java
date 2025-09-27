<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuh.fit.se.connect_jpa.entity.User" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .user-card {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #007bff;
        }
        .field {
            margin-bottom: 15px;
            padding: 10px;
            background-color: white;
            border-radius: 4px;
            border: 1px solid #e9ecef;
        }
        .field-label {
            font-weight: bold;
            color: #495057;
            margin-bottom: 5px;
        }
        .field-value {
            color: #212529;
            font-size: 16px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 10px;
            display: inline-block;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .actions {
            text-align: center;
            margin-top: 30px;
        }
        .not-found {
            text-align: center;
            color: #dc3545;
            font-size: 18px;
            padding: 40px;
        }
        .user-avatar {
            text-align: center;
            margin-bottom: 20px;
        }
        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #007bff;
            color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>👤 Chi tiết User</h1>
        
        <%
            User user = (User) request.getAttribute("user");
            if (user != null) {
        %>
        <div class="user-card">
            <div class="user-avatar">
                <div class="avatar">
                    <%= user.getName().charAt(0) %>
                </div>
            </div>
            
            <div class="field">
                <div class="field-label">🆔 ID:</div>
                <div class="field-value"><%= user.getId() %></div>
            </div>
            
            <div class="field">
                <div class="field-label">👤 Tên:</div>
                <div class="field-value"><%= user.getName() %></div>
            </div>
            
            <div class="field">
                <div class="field-label">📧 Email:</div>
                <div class="field-value"><%= user.getEmail() %></div>
            </div>
            
            <div class="field">
                <div class="field-label">🔒 Mật khẩu:</div>
                <div class="field-value">••••••••</div>
            </div>
            
            <div class="field">
                <div class="field-label">🌍 Quốc gia:</div>
                <div class="field-value"><%= user.getCountry() %></div>
            </div>
        </div>
        
        <div class="actions">
            <a href="user-form?id=<%= user.getId() %>" class="btn btn-success">✏️ Sửa</a>
            <a href="user-delete?id=<%= user.getId() %>" class="btn btn-danger" 
               onclick="return confirm('Bạn có chắc muốn xóa user này?')">🗑️ Xóa</a>
            <a href="user-list" class="btn">📋 Danh sách</a>
            <a href="index.jsp" class="btn">🏠 Trang chủ</a>
        </div>
        
        <%
            } else {
        %>
        <div class="not-found">
            <h3>❌ Không tìm thấy user</h3>
            <p>User với ID này không tồn tại hoặc đã bị xóa.</p>
            <a href="user-list" class="btn">📋 Quay lại danh sách</a>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>