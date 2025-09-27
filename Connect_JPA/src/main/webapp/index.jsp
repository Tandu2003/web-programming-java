<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connect JPA - Trang chủ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 40px;
            font-size: 1.2em;
        }
        .nav-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .nav-card {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
        }
        .nav-card:hover {
            border-color: #007bff;
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .nav-icon {
            font-size: 3em;
            margin-bottom: 15px;
        }
        .nav-title {
            font-size: 1.3em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .nav-desc {
            color: #666;
            font-size: 0.9em;
        }
        .welcome {
            background-color: #e3f2fd;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #2196f3;
        }
        .tech-stack {
            background-color: #f3e5f5;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
            border-left: 4px solid #9c27b0;
        }
        .tech-item {
            display: inline-block;
            background-color: #9c27b0;
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            margin: 5px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Connect JPA</h1>
        <p class="subtitle">Hệ thống quản lý User với Jakarta Persistence API</p>
        
        <div class="welcome">
            <h3>👋 Chào mừng!</h3>
            <p>Đây là ứng dụng demo sử dụng Jakarta Persistence API (JPA) với Hibernate để quản lý dữ liệu User. 
               Bạn có thể thực hiện các thao tác CRUD cơ bản.</p>
        </div>
        
        <div class="nav-grid">
            <a href="user-list" class="nav-card">
                <div class="nav-icon">📋</div>
                <div class="nav-title">Danh sách Users</div>
                <div class="nav-desc">Xem tất cả users trong hệ thống</div>
            </a>
            
            <a href="user-form" class="nav-card">
                <div class="nav-icon">➕</div>
                <div class="nav-title">Thêm User</div>
                <div class="nav-desc">Tạo user mới vào hệ thống</div>
            </a>
            
        </div>
        
        <div class="tech-stack">
            <h3>🛠️ Công nghệ sử dụng:</h3>
            <span class="tech-item">Jakarta Persistence API</span>
            <span class="tech-item">Hibernate</span>
            <span class="tech-item">MariaDB</span>
            <span class="tech-item">JSP</span>
            <span class="tech-item">Servlet</span>
            <span class="tech-item">Maven</span>
            <span class="tech-item">Lombok</span>
        </div>
    </div>
</body>
</html>