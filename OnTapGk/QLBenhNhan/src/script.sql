USE QLBenhnhan;

-- Tạo bảng KHOA
CREATE TABLE KHOA (
    MAKHOA INT PRIMARY KEY AUTO_INCREMENT,
    TENKHOA VARCHAR(100) NOT NULL,
    TRUONGKHOA VARCHAR(100) NOT NULL,
    MOTA TEXT
);

-- Tạo bảng BENHNHAN
CREATE TABLE BENHNHAN (
    MABN INT PRIMARY KEY AUTO_INCREMENT,
    HOTEN VARCHAR(100) NOT NULL,
    NGAYNHAPVIEN DATE NOT NULL,
    CHUANDOAN VARCHAR(200) NOT NULL,
    MAKHOA INT NOT NULL,
    FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
);

-- Thêm dữ liệu mẫu cho bảng KHOA
INSERT INTO KHOA (TENKHOA, TRUONGKHOA, MOTA) VALUES
('Khoa Tim Mạch', 'BS. Nguyễn Văn A', 'Chuyên điều trị các bệnh về tim mạch'),
('Khoa Nội Tổng Hợp', 'BS. Trần Thị B', 'Khoa nội tổng hợp điều trị các bệnh nội khoa'),
('Khoa Ngoại Tổng Hợp', 'BS. Lê Văn C', 'Chuyên phẫu thuật và điều trị ngoại khoa'),
('Khoa Sản Phụ Khoa', 'BS. Phạm Thị D', 'Chuyên điều trị sản phụ khoa'),
('Khoa Nhi', 'BS. Hoàng Văn E', 'Chuyên điều trị bệnh nhi');

-- Thêm dữ liệu mẫu cho bảng BENHNHAN
INSERT INTO BENHNHAN (HOTEN, NGAYNHAPVIEN, CHUANDOAN, MAKHOA) VALUES
('Nguyễn Văn An', '2024-01-15', 'Suy tim cấp', 1),
('Trần Thị Bình', '2024-01-16', 'Viêm phổi', 2),
('Lê Văn Cường', '2024-01-17', 'Viêm ruột thừa', 3),
('Phạm Thị Dung', '2024-01-18', 'Thai kỳ bình thường', 4),
('Hoàng Văn Em', '2024-01-19', 'Sốt xuất huyết', 5),
('Nguyễn Thị Phương', '2024-01-20', 'Rối loạn nhịp tim', 1),
('Trần Văn Giang', '2024-01-21', 'Viêm dạ dày', 2),
('Lê Thị Hoa', '2024-01-22', 'Sỏi thận', 3);