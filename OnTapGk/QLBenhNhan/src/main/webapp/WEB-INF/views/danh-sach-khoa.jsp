<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Khoa</title>
    <style>
        body {
            margin: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }
        
        .btn {
            padding: 8px 15px;
            text-decoration: none;
            border: 1px solid #ccc;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }
        
        .no-data {
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Danh sách Khoa</h1>
            <a href="${pageContext.request.contextPath}/" class="btn">Trang chủ</a>
        </div>
        
        <c:choose>
            <c:when test="${not empty khoaList}">
                <table>
                    <thead>
                        <tr>
                            <th>Mã Khoa</th>
                            <th>Tên Khoa</th>
                            <th>Trưởng Khoa</th>
                            <th>Mô tả</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="khoa" items="${khoaList}">
                            <tr>
                                <td>${khoa.maKhoa}</td>
                                <td>${khoa.tenKhoa}</td>
                                <td>${khoa.truongKhoa}</td>
                                <td>${khoa.moTa}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-data">
                    <p>Không có dữ liệu khoa</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>