# Hệ thống Quản lý Bệnh nhân

Ứng dụng web quản lý bệnh nhân trong bệnh viện sử dụng Servlet/JSP với mô hình MVC.

## Công nghệ sử dụng
- **Backend**: Java Servlet, JSP
- **Database**: MariaDB/MySQL
- **Web Server**: Apache Tomcat 11
- **JDK**: 17
- **View**: JSP + JSTL + Expression Language (EL)
- **Build Tool**: Maven

## Hướng dẫn làm bài từng bước

### Bước 0: Chuẩn bị Dependencies và Môi trường
1. **Cài đặt môi trường phát triển**
   - **JDK 17**: Tải và cài đặt Java Development Kit 17
   - **Apache Tomcat 11**: Tải và cài đặt Tomcat 11
   - **MariaDB/MySQL**: Cài đặt MariaDB hoặc MySQL
   - **IDE**: IntelliJ IDEA, Eclipse, hoặc VS Code với Java extension

2. **Kiểm tra file pom.xml**
   - Đảm bảo các dependencies cần thiết đã được khai báo:
   ```xml
   <!-- Jakarta Servlet API -->
   <dependency>
       <groupId>jakarta.servlet</groupId>
       <artifactId>jakarta.servlet-api</artifactId>
       <version>6.0.0</version>
       <scope>provided</scope>
   </dependency>
   
   <!-- JSTL -->
   <dependency>
       <groupId>jakarta.servlet.jsp.jstl</groupId>
       <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
       <version>3.0.0</version>
   </dependency>
   
   <!-- MariaDB Driver -->
   <dependency>
       <groupId>org.mariadb.jdbc</groupId>
       <artifactId>mariadb-java-client</artifactId>
       <version>3.5.1</version>
   </dependency>
   ```

3. **Cấu hình IDE**
   - Cấu hình Tomcat server trong IDE
   - Cấu hình JDK 17 cho project
   - Cấu hình Maven để build project

4. **Kiểm tra kết nối database**
   - Đảm bảo MariaDB/MySQL đang chạy
   - Test kết nối bằng client database (phpMyAdmin, DBeaver, etc.)
   - Ghi nhớ thông tin kết nối: host, port, username, password

### Bước 1: Thiết lập Database
1. **Tạo database và chạy script**
   ```sql
   -- Tạo database
   CREATE DATABASE QLBenhnhan;
   
   -- Sử dụng database
   USE QLBenhnhan;
   
   -- Chạy script tạo bảng và dữ liệu mẫu
   -- Copy toàn bộ nội dung từ file src/script.sql và chạy
   ```

2. **Cấu hình database connection**
   - Tạo file `src/main/webapp/META-INF/context.xml`:
   ```xml
   <Context>
       <Resource name="jdbc/QLBenhnhan" auth="Container" type="javax.sql.DataSource"
                 maxTotal="100" maxIdle="30" maxWaitMillis="10000"
                 username="root" password="1234567890" driverClassName="org.mariadb.jdbc.Driver"
                 url="jdbc:mariadb://localhost:3306/QLBenhnhan" URIEncoding="UTF-8"/>
   </Context>
   ```

### Bước 2: Tạo Entity Classes
Tạo các class entity trong package `iuh.fit.se.entities`:

1. **Khoa.java** - Entity cho bảng KHOA
2. **BenhNhan.java** - Entity cho bảng BENHNHAN

**Lưu ý**: Các entity cần có:
- Các field tương ứng với cột trong database
- Constructor mặc định và constructor đầy đủ
- Getter/Setter cho tất cả các field
- Annotation `@Entity` và `@Table` (nếu dùng JPA)

### Bước 3: Tạo Database Connection Utility
Tạo class `DBConnection.java` trong package `iuh.fit.se.utils`:
- Sử dụng DataSource từ JNDI
- Cung cấp method để lấy Connection
- Xử lý exception và đóng connection

### Bước 4: Tạo Interface DAO
Tạo các interface DAO trong package `iuh.fit.se.daos`:

1. **KhoaDAO.java**
   - `List<Khoa> getAllKhoa()`
   - `Khoa getKhoaById(int maKhoa)`

2. **BenhNhanDAO.java**
   - `List<BenhNhan> getAllBenhNhan()`
   - `List<BenhNhan> getBenhNhanByKhoa(int maKhoa)`
   - `List<BenhNhan> searchBenhNhanByTen(String hoTen)`
   - `boolean addBenhNhan(BenhNhan benhNhan)`

### Bước 5: Implement DAO Classes
Tạo các class implement DAO trong package `iuh.fit.se.daos.impl`:

1. **KhoaDAOImpl.java**
   - Implement tất cả method từ KhoaDAO
   - Sử dụng JDBC để thao tác database
   - Xử lý SQLException

2. **BenhNhanDAOImpl.java**
   - Implement tất cả method từ BenhNhanDAO
   - Sử dụng JDBC để thao tác database
   - Xử lý SQLException

### Bước 6: Tạo Servlet Controllers
Tạo các Servlet trong package `iuh.fit.se.controllers`:

1. **KhoaServlet.java**
   - Xử lý request `/khoa`
   - Method `doGet()`: Lấy danh sách khoa và forward đến view

2. **BenhNhanServlet.java**
   - Xử lý request `/benhnhan`
   - Method `doGet()`: Xử lý các action (list, search, listByKhoa, addForm)
   - Method `doPost()`: Xử lý thêm bệnh nhân mới

### Bước 7: Tạo JSP Views
Tạo các file JSP trong thư mục `src/main/webapp/WEB-INF/views/`:

1. **danh-sach-khoa.jsp**
   - Hiển thị danh sách tất cả khoa
   - Sử dụng JSTL `<c:forEach>` để duyệt danh sách

2. **danh-sach-benh-nhan.jsp**
   - Hiển thị danh sách tất cả bệnh nhân
   - Hiển thị thông tin: Mã BN, Họ tên, Ngày nhập viện, Chẩn đoán, Tên khoa

3. **tim-kiem-benh-nhan.jsp**
   - Form tìm kiếm bệnh nhân theo tên
   - Hiển thị kết quả tìm kiếm

4. **benh-nhan-theo-khoa.jsp**
   - Hiển thị danh sách bệnh nhân theo khoa được chọn
   - Có link quay lại danh sách khoa

5. **them-benh-nhan.jsp**
   - Form thêm bệnh nhân mới
   - Dropdown chọn khoa
   - Validation dữ liệu đầu vào

### Bước 8: Cấu hình web.xml
Cấu hình file `src/main/webapp/WEB-INF/web.xml`:
- Định nghĩa servlet mapping
- Cấu hình welcome file
- Cấu hình JSTL

### Bước 9: Tạo trang chủ
Tạo file `src/main/webapp/index.jsp`:
- Menu điều hướng đến các chức năng
- Giao diện thân thiện với người dùng

### Bước 10: Test và Debug
1. **Build project**: `mvn clean package`
2. **Deploy lên Tomcat**
3. **Test từng chức năng**:
   - Xem danh sách khoa
   - Xem danh sách bệnh nhân
   - Tìm kiếm bệnh nhân
   - Xem bệnh nhân theo khoa
   - Thêm bệnh nhân mới

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
│       ├── META-INF/
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

## Lưu ý quan trọng

- **Database**: Đảm bảo MariaDB/MySQL đang chạy
- **Cấu hình**: Kiểm tra thông tin database trong `context.xml`
- **Server**: Sử dụng Tomcat 11 và JDK 17
- **Dependencies**: Kiểm tra các dependency trong `pom.xml`
- **Context Path**: Sử dụng `${pageContext.request.contextPath}` để tự động thích ứng với context path
- **Error Handling**: Xử lý exception đúng cách trong DAO và Servlet
- **Validation**: Validate dữ liệu đầu vào ở cả client và server side