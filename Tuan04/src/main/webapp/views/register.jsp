<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .error {
            color: #d32f2f;
            font-size: 14px;
            margin-top: 5px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            margin-top: 10px;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng ký tài khoản</h1>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="name">Họ và tên:</label>
                <input type="text" id="name" name="name" value="${user.name}" required>
                <c:forEach var="violation" items="${errors}">
                    <c:if test="${violation.propertyPath == 'name'}">
                        <div class="error">${violation.message}</div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
                <c:forEach var="violation" items="${errors}">
                    <c:if test="${violation.propertyPath == 'email'}">
                        <div class="error">${violation.message}</div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>
                <c:forEach var="violation" items="${errors}">
                    <c:if test="${violation.propertyPath == 'password'}">
                        <div class="error">${violation.message}</div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="country">Quốc gia:</label>
                <select id="country" name="country">
                    <option value="">-- Chọn quốc gia --</option>
                    <option value="Vietnam" ${user.country == 'Vietnam' ? 'selected' : ''}>Việt Nam</option>
                    <option value="USA" ${user.country == 'USA' ? 'selected' : ''}>Hoa Kỳ</option>
                    <option value="Japan" ${user.country == 'Japan' ? 'selected' : ''}>Nhật Bản</option>
                    <option value="Korea" ${user.country == 'Korea' ? 'selected' : ''}>Hàn Quốc</option>
                    <option value="China" ${user.country == 'China' ? 'selected' : ''}>Trung Quốc</option>
                </select>
            </div>

            <button type="submit" class="btn">Đăng ký</button>
        </form>

        <a href="${pageContext.request.contextPath}/users">
            <button type="button" class="btn btn-secondary">Xem danh sách người dùng</button>
        </a>
    </div>
</body>
</html>
