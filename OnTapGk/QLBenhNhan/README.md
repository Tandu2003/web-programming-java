# Hệ thống Quản lý Bệnh nhân

Ứng dụng web quản lý bệnh nhân trong bệnh viện sử dụng Servlet/JSP với mô hình MVC.

## Công nghệ sử dụng
- **Backend**: Java Servlet, JSP
- **Database**: MariaDB/MySQL
- **Web Server**: Apache Tomcat 11
- **JDK**: 21
- **View**: JSP + JSTL + Expression Language (EL)
- **Build Tool**: Maven

## Cấu trúc dự án

```
src/
├── main/
│   ├── java/iuh/fit/se/
│   │   ├── controllers/          # Servlet Controllers
│   │   │   ├── BenhNhanServlet.java
│   │   │   └── KhoaServlet.java
│   │   ├── daos/                 # Data Access Objects
│   │   │   ├── BenhNhanDAO.java
│   │   │   ├── KhoaDAO.java
│   │   │   └── impl/
│   │   │       ├── BenhNhanDAOImpl.java
│   │   │       └── KhoaDAOImpl.java
│   │   ├── entities/             # Entity Classes
│   │   │   ├── BenhNhan.java
│   │   │   └── Khoa.java
│   │   └── utils/                # Utility Classes
│   │       └── DBConnection.java
│   ├── resources/META-INF/
│   │   └── persistence.xml
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── views/            # JSP Views
│       │   │   ├── danh-sach-benh-nhan.jsp
│       │   │   ├── danh-sach-khoa.jsp
│       │   │   ├── tim-kiem-benh-nhan.jsp
│       │   │   ├── benh-nhan-theo-khoa.jsp
│       │   │   └── them-benh-nhan.jsp
│       │   └── web.xml
│       ├── META_INF/
│       │   └── context.xml       # Database Configuration
│       └── index.jsp             # Trang chủ
└── script.sql                    # Database Script
```

## Cơ sở dữ liệu

### Bảng KHOA
- `MAKHOA` (INT, PRIMARY KEY, AUTO_INCREMENT)
- `TENKHOA` (VARCHAR(100), NOT NULL)
- `TRUONGKHOA` (VARCHAR(100), NOT NULL)
- `MOTA` (TEXT)

### Bảng BENHNHAN
- `MABN` (INT, PRIMARY KEY, AUTO_INCREMENT)
- `HOTEN` (VARCHAR(100), NOT NULL)
- `NGAYNHAPVIEN` (DATE, NOT NULL)
- `CHUANDOAN` (VARCHAR(200), NOT NULL)
- `MAKHOA` (INT, NOT NULL, FOREIGN KEY)

## Chức năng chính

### 1. Xem danh sách bệnh nhân
- **URL**: `/benhnhan?action=list`
- **Mô tả**: Hiển thị tất cả bệnh nhân trong hệ thống
- **View**: `danh-sach-benh-nhan.jsp`

### 2. Tìm kiếm bệnh nhân theo tên
- **URL**: `/benhnhan?action=search&hoTen={tên}`
- **Mô tả**: Tìm kiếm bệnh nhân theo tên (hỗ trợ tìm kiếm gần đúng)
- **View**: `tim-kiem-benh-nhan.jsp`

### 3. Xem danh sách khoa
- **URL**: `/khoa`
- **Mô tả**: Hiển thị tất cả các khoa trong bệnh viện
- **View**: `danh-sach-khoa.jsp`

### 4. Xem danh sách bệnh nhân theo khoa
- **URL**: `/benhnhan?action=listByKhoa&maKhoa={mã_khoa}`
- **Mô tả**: Hiển thị bệnh nhân thuộc khoa được chọn
- **View**: `benh-nhan-theo-khoa.jsp`

### 5. Thêm mới bệnh nhân
- **URL**: `/benhnhan?action=addForm` (GET), `/benhnhan` (POST)
- **Mô tả**: Thêm bệnh nhân mới vào hệ thống
- **View**: `them-benh-nhan.jsp`

## Cài đặt và chạy ứng dụng

### 1. Cài đặt cơ sở dữ liệu

**Cách 1: Sử dụng command line**
```bash
# Tạo database
mysql -u root -p < src/create-database.sql

# Chạy script chính
mysql -u root -p QLBenhnhan < src/script.sql
```

**Cách 2: Sử dụng MySQL Workbench hoặc phpMyAdmin**
1. Tạo database `QLBenhnhan`
2. Copy và paste nội dung từ `src/script.sql` vào query editor
3. Chạy script

**Cách 3: Chạy từng bước**
```sql
-- Bước 1: Tạo database
CREATE DATABASE QLBenhnhan;

-- Bước 2: Sử dụng database
USE QLBenhnhan;

-- Bước 3: Copy và paste nội dung từ src/script.sql
```

### 2. Cấu hình database
Chỉnh sửa file `src/main/webapp/META_INF/context.xml`:
```xml
<Resource name="jdbc/QLBenhnhan" 
          auth="Container" 
          type="javax.sql.DataSource"
          maxTotal="100" 
          maxIdle="30" 
          maxWaitMillis="10000"
          username="root" 
          password="your_password" 
          driverClassName="org.mariadb.jdbc.Driver"
          url="jdbc:mariadb://localhost:3306/QLBenhnhan" 
          URIEncoding="UTF-8"/>
```

### 3. Build và deploy
```bash
# Build project
mvn clean package

# Deploy file WAR vào Tomcat
cp target/QLBenhNhan-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

### 4. Truy cập ứng dụng
Mở trình duyệt và truy cập: `http://localhost:8080/QLBenhNhan-1.0-SNAPSHOT/`

**Lưu ý**: Tất cả các link trong ứng dụng đã được cấu hình sử dụng `${pageContext.request.contextPath}` để tự động thích ứng với context path của ứng dụng, tránh lỗi khi deploy với tên khác nhau.

## Cấu trúc MVC

### Model
- **Entities**: `BenhNhan.java`, `Khoa.java`
- **DAOs**: `BenhNhanDAO.java`, `KhoaDAO.java`
- **DAO Implementations**: `BenhNhanDAOImpl.java`, `KhoaDAOImpl.java`

### View
- **JSP Pages**: Các file JSP trong thư mục `WEB-INF/views/`
- **JSTL**: Sử dụng thư viện JSTL cho việc hiển thị dữ liệu
- **Expression Language**: Sử dụng EL để truy cập dữ liệu

### Controller
- **BenhNhanServlet**: Xử lý các request liên quan đến bệnh nhân
- **KhoaServlet**: Xử lý các request liên quan đến khoa

## Tính năng nổi bật

1. **Giao diện đẹp**: Sử dụng CSS hiện đại với gradient và animation
2. **Responsive**: Giao diện thích ứng với các kích thước màn hình khác nhau
3. **Validation**: Kiểm tra dữ liệu đầu vào ở cả client và server
4. **Error Handling**: Xử lý lỗi và hiển thị thông báo phù hợp
5. **Search**: Tìm kiếm bệnh nhân theo tên với hỗ trợ tìm kiếm gần đúng
6. **Filter**: Lọc bệnh nhân theo khoa điều trị

## Hướng dẫn sử dụng

1. Truy cập trang chủ để xem menu chính
2. Sử dụng các chức năng:
   - **Danh sách Bệnh nhân**: Xem tất cả bệnh nhân
   - **Tìm kiếm**: Tìm bệnh nhân theo tên
   - **Danh sách Khoa**: Xem thông tin các khoa
   - **Bệnh nhân theo Khoa**: Lọc bệnh nhân theo khoa
   - **Thêm Bệnh nhân**: Thêm bệnh nhân mới

## Lưu ý

- Đảm bảo MariaDB/MySQL đang chạy
- Cấu hình đúng thông tin database trong `context.xml`
- Sử dụng Tomcat 11 và JDK 21
- Kiểm tra các dependency trong `pom.xml`
- **Context Path**: Ứng dụng sử dụng `${pageContext.request.contextPath}` để tự động thích ứng với context path, tránh lỗi khi deploy với tên khác nhau