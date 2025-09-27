-- =====================================================
-- Connect JPA - Database Setup Script
-- =====================================================
-- Mô tả: Script để tạo database và cấu hình cho ứng dụng Connect JPA
-- Sử dụng: mysql -u root -p < database_setup.sql
-- =====================================================

-- Tạo database
CREATE DATABASE IF NOT EXISTS userdb 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Sử dụng database
USE userdb;

-- Tạo user (thay đổi password theo ý muốn)
-- Lưu ý: Thay '1234567890' bằng password mong muốn
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '1234567890';

-- Cấp quyền cho user
GRANT ALL PRIVILEGES ON userdb.* TO 'root'@'localhost';

-- Áp dụng thay đổi quyền
FLUSH PRIVILEGES;

-- Tạo bảng users (JPA sẽ tự động tạo, nhưng có thể tạo thủ công)
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tạo index để tối ưu performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_country ON users(country);

-- Thêm dữ liệu mẫu (optional)
INSERT INTO users (name, email, password, country) VALUES
('Nguyễn Văn A', 'nguyenvana@email.com', 'password123', 'Việt Nam'),
('Trần Thị B', 'tranthib@email.com', 'password123', 'Việt Nam'),
('John Smith', 'johnsmith@email.com', 'password123', 'Mỹ'),
('Maria Garcia', 'mariagarcia@email.com', 'password123', 'Tây Ban Nha'),
('田中太郎', 'tanaka@email.com', 'password123', 'Nhật Bản')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- Hiển thị thông tin database
SELECT 'Database setup completed successfully!' as Status;
SELECT 'Database:' as Info, DATABASE() as Value;
SELECT 'Charset:' as Info, @@character_set_database as Value;
SELECT 'Collation:' as Info, @@collation_database as Value;

-- Hiển thị danh sách tables
SHOW TABLES;

-- Hiển thị cấu trúc bảng users
DESCRIBE users;

-- Hiển thị dữ liệu mẫu
SELECT 'Sample data:' as Info;
SELECT * FROM users LIMIT 5;

-- =====================================================
-- Hướng dẫn sử dụng:
-- =====================================================
-- 1. Đăng nhập MySQL/MariaDB:
--    mysql -u root -p
--
-- 2. Chạy script này:
--    source database_setup.sql
--    hoặc
--    mysql -u root -p < database_setup.sql
--
-- 3. Kiểm tra kết quả:
--    USE userdb;
--    SHOW TABLES;
--    SELECT * FROM users;
--
-- 4. Cấu hình trong persistence.xml:
--    - Database: userdb
--    - User: root
--    - Password: 1234567890 (hoặc password bạn đã đặt)
--    - URL: jdbc:mariadb://localhost:3306/userdb
-- =====================================================