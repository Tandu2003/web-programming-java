<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bệnh nhân theo Khoa</title>
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
        
        .filter-section {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
        }
        
        .form-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        
        .form-group select {
            flex: 1;
            padding: 8px;
        }
        
        .form-group button {
            padding: 8px 15px;
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
        
        .selected-khoa {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Bệnh nhân theo Khoa</h1>
            <a href="${pageContext.request.contextPath}/" class="btn">Trang chủ</a>
        </div>
        
        <div class="filter-section">
            <h3>Chọn khoa để xem danh sách bệnh nhân</h3>
            <form action="${pageContext.request.contextPath}/benhnhan" method="get">
                <input type="hidden" name="action" value="listByKhoa">
                <div class="form-group">
                    <select name="maKhoa" required>
                        <option value="">-- Chọn khoa --</option>
                        <c:forEach var="khoa" items="${khoaList}">
                            <option value="${khoa.maKhoa}" 
                                    ${khoa.maKhoa == selectedKhoa ? 'selected' : ''}>
                                ${khoa.tenKhoa}
                            </option>
                        </c:forEach>
                    </select>
                    <button type="submit">Xem danh sách</button>
                </div>
            </form>
        </div>
        
        <c:if test="${not empty selectedKhoaName}">
            <div class="selected-khoa">
                <strong>Đang xem bệnh nhân của: ${selectedKhoaName}</strong>
                <c:if test="${not empty benhNhanList}">
                    <span style="float: right; font-size: 0.9em;">
                        Tổng số bệnh nhân: ${benhNhanList.size()}
                    </span>
                </c:if>
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div style="padding: 15px; margin-bottom: 20px; border: 1px solid #ccc;">
                <strong>Lỗi:</strong> ${error}
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
                                        <div class="khoa-info">
                                            <strong>${benhNhan.khoa.tenKhoa}</strong><br>
                                            <small>Trưởng khoa: ${benhNhan.khoa.truongKhoa}</small>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-data">
                        <c:choose>
                            <c:when test="${not empty selectedKhoaName}">
                                <p>Không có bệnh nhân nào trong khoa <strong>${selectedKhoaName}</strong></p>
                            </c:when>
                            <c:otherwise>
                                <p>Vui lòng chọn khoa để xem danh sách bệnh nhân</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>