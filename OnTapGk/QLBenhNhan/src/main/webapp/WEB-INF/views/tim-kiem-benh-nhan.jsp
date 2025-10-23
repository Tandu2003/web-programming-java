<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm Bệnh nhân</title>
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
        
        .search-form {
            padding: 15px;
            margin-bottom: 20px;
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
        
        .search-result {
            padding: 10px;
            margin-bottom: 15px;
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
            <h1>Tìm kiếm Bệnh nhân</h1>
            <a href="${pageContext.request.contextPath}/" class="btn">Trang chủ</a>
        </div>
        
        <div class="search-form">
            <h3>Tìm kiếm theo tên</h3>
            <form action="${pageContext.request.contextPath}/benhnhan" method="get">
                <input type="hidden" name="action" value="search">
                <div class="form-group">
                    <input type="text" name="hoTen" placeholder="Nhập tên bệnh nhân..." 
                           value="${searchTerm}" required>
                    <button type="submit">Tìm kiếm</button>
                </div>
            </form>
        </div>
        
        <c:if test="${not empty searchTerm}">
            <div class="search-result">
                <strong>Kết quả tìm kiếm cho: "${searchTerm}"</strong>
            </div>
        </c:if>
        
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty benhNhanList}">
                    <table>
                        <thead>
                            <tr>
                                <th>Mã BN</th>
                                <th>Họ tên</th>
                                <th>Ngày nhập viện</th>
                                <th>Chuẩn đoán</th>
                                <th>Khoa điều trị</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="benhNhan" items="${benhNhanList}">
                                <tr>
                                    <td>${benhNhan.maBN}</td>
                                    <td>${benhNhan.hoTen}</td>
                                    <td>
                                        <fmt:formatDate value="${benhNhan.ngayNhapVien}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td>${benhNhan.chuanDoan}</td>
                                    <td>
                                        <span class="khoa-info">
                                            Khoa ${benhNhan.khoa.maKhoa}
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-data">
                        <p>Không tìm thấy bệnh nhân nào với từ khóa "${searchTerm}"</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>