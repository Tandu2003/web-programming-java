<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Bệnh nhân</title>
    <style>
        body {
            margin: 20px;
        }
        
        .container {
            max-width: 800px;
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
        
        .form-container {
            padding: 20px;
            border: 1px solid #ccc;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 8px;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }
        
        .btn-submit {
            padding: 10px 20px;
        }
        
        .btn-reset {
            padding: 10px 20px;
        }
        
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
        }
        
        .required {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thêm Bệnh nhân</h1>
            <a href="${pageContext.request.contextPath}/" class="btn">Trang chủ</a>
        </div>
        
        <c:if test="${not empty message}">
            <div class="message ${messageType}">
                ${message}
            </div>
        </c:if>
        
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/benhnhan" method="post">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group">
                    <label for="hoTen">Họ và tên <span class="required">*</span></label>
                    <input type="text" id="hoTen" name="hoTen" required 
                           placeholder="Nhập họ và tên bệnh nhân">
                </div>
                
                <div class="form-group">
                    <label for="ngayNhapVien">Ngày nhập viện <span class="required">*</span></label>
                    <input type="date" id="ngayNhapVien" name="ngayNhapVien" required>
                </div>
                
                <div class="form-group">
                    <label for="chuanDoan">Chuẩn đoán <span class="required">*</span></label>
                    <textarea id="chuanDoan" name="chuanDoan" required 
                              placeholder="Nhập chuẩn đoán bệnh"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="maKhoa">Khoa điều trị <span class="required">*</span></label>
                    <select id="maKhoa" name="maKhoa" required>
                        <option value="">-- Chọn khoa điều trị --</option>
                        <c:forEach var="khoa" items="${khoaList}">
                            <option value="${khoa.maKhoa}">
                                ${khoa.tenKhoa} - ${khoa.truongKhoa}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn-submit">Lưu bệnh nhân</button>
                    <button type="reset" class="btn-reset">Làm mới</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // Set today's date as default
        document.getElementById('ngayNhapVien').valueAsDate = new Date();
    </script>
</body>
</html>