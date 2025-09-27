<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách người dùng</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
      }
      .container {
        max-width: 1000px;
        margin: 0 auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
      }
      .btn {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        text-decoration: none;
        display: inline-block;
        margin-bottom: 20px;
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
      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      th,
      td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
      }
      th {
        background-color: #f8f9fa;
        font-weight: bold;
        color: #333;
      }
      tr:nth-child(even) {
        background-color: #f9f9f9;
      }
      tr:hover {
        background-color: #f5f5f5;
      }
      .no-data {
        text-align: center;
        color: #666;
        font-style: italic;
        padding: 40px;
      }
      .actions {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Danh sách người dùng</h1>

      <a href="${pageContext.request.contextPath}/register" class="btn"
        >Đăng ký người dùng mới</a
      >

      <c:choose>
        <c:when test="${empty users}">
          <div class="no-data">
            <p>Chưa có người dùng nào được đăng ký.</p>
          </div>
        </c:when>
        <c:otherwise>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Họ và tên</th>
                <th>Email</th>
                <th>Quốc gia</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="user" items="${users}">
                <tr>
                  <td>${user.id}</td>
                  <td>${user.name}</td>
                  <td>${user.email}</td>
                  <td>${user.country}</td>
                  <td class="actions">
                    <a
                      href="${pageContext.request.contextPath}/delete-user?id=${user.id}"
                      class="btn btn-danger"
                      onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')"
                    >
                      Xóa
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:otherwise>
      </c:choose>
    </div>
  </body>
</html>
