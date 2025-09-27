<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuh.fit.se.connect_jpa.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        .actions {
            white-space: nowrap;
        }
        .actions a {
            margin-right: 5px;
        }
        .no-data {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Danh sách Users</h1>
        
        <a href="user-form" class="btn btn-success">➕ Thêm User mới</a>
        <a href="index.jsp" class="btn">🏠 Trang chủ</a>
        
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Quốc gia</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getCountry() %></td>
                    <td class="actions">
                        <a href="user-detail?id=<%= user.getId() %>" class="btn">👁️ Xem</a>
                        <a href="user-form?id=<%= user.getId() %>" class="btn">✏️ Sửa</a>
                        <a href="user-delete?id=<%= user.getId() %>" class="btn btn-danger" 
                           onclick="return confirm('Bạn có chắc muốn xóa user này?')">🗑️ Xóa</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <div class="no-data">
            <h3>📭 Chưa có user nào</h3>
            <p>Hãy thêm user đầu tiên để bắt đầu!</p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>