-- Tạo database userdb
CREATE DATABASE IF NOT EXISTS userdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sử dụng database userdb
USE userdb;

-- Tạo bảng users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Thêm một số dữ liệu mẫu
INSERT INTO users (name, email, password, country) VALUES
('Nguyễn Văn A', 'nguyenvana@email.com', 'password123', 'Vietnam'),
('Trần Thị B', 'tranthib@email.com', 'password123', 'Vietnam'),
('John Smith', 'johnsmith@email.com', 'password123', 'USA'),
('Yamada Taro', 'yamada@email.com', 'password123', 'Japan');

-- Kiểm tra dữ liệu
SELECT * FROM users;
