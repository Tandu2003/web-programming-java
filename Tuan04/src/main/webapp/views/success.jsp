<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký thành công</title>
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
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
      }
      h1 {
        color: #28a745;
        margin-bottom: 20px;
      }
      .success-icon {
        font-size: 60px;
        color: #28a745;
        margin-bottom: 20px;
      }
      .message {
        font-size: 18px;
        color: #333;
        margin-bottom: 30px;
      }
      .btn {
        background-color: #007bff;
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
        display: inline-block;
        margin: 5px;
      }
      .btn:hover {
        background-color: #0056b3;
      }
      .btn-secondary {
        background-color: #6c757d;
      }
      .btn-secondary:hover {
        background-color: #545b62;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="success-icon">✓</div>
      <h1>Thành công!</h1>
      <div class="message">${message}</div>

      <a href="${pageContext.request.contextPath}/register" class="btn"
        >Đăng ký thêm</a
      >
      <a
        href="${pageContext.request.contextPath}/users"
        class="btn btn-secondary"
        >Xem danh sách người dùng</a
      >
    </div>
  </body>
</html>
