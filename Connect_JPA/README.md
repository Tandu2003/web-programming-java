# Connect JPA - Hướng dẫn hoàn chỉnh

## 📋 Mục lục
1. [Giới thiệu](#giới-thiệu)
2. [Công nghệ sử dụng](#công-nghệ-sử-dụng)
3. [Cài đặt môi trường](#cài-đặt-môi-trường)
4. [Cấu hình Database](#cấu-hình-database)
5. [Cấu hình Maven](#cấu-hình-maven)
6. [Cấu hình JPA](#cấu-hình-jpa)
7. [Tạo Entity](#tạo-entity)
8. [Tạo DAO Layer](#tạo-dao-layer)
9. [Tạo Servlet Layer](#tạo-servlet-layer)
10. [Tạo JSP Views](#tạo-jsp-views)
11. [Chạy ứng dụng](#chạy-ứng-dụng)
12. [Kiểm tra kết quả](#kiểm-tra-kết-quả)
13. [Troubleshooting](#troubleshooting)****************

---

## 🚀 Giới thiệu

**Connect JPA** là ứng dụng demo quản lý User sử dụng Jakarta Persistence API (JPA) với Hibernate ORM. Ứng dụng thực hiện các thao tác CRUD (Create, Read, Update, Delete) với database MariaDB/MySQL và hiển thị dữ liệu qua JSP.

### Tính năng chính:
- ✅ Quản lý User với đầy đủ CRUD operations
- ✅ Kết nối database với JPA/Hibernate
- ✅ Giao diện JSP responsive và đẹp mắt
- ✅ Validation dữ liệu đầu vào
- ✅ Error handling và transaction management
- ✅ Dropdown select cho quốc gia với 100+ quốc gia

---

## 🛠️ Công nghệ sử dụng

| Công nghệ | Phiên bản | Mô tả |
|-----------|-----------|-------|
| **Java** | 17+ | Ngôn ngữ lập trình chính |
| **Jakarta Persistence API** | 3.2.0 | JPA specification |
| **Hibernate** | 6.6.1.Final | JPA implementation |
| **MariaDB JDBC Driver** | 3.5.1 | Database driver |
| **Lombok** | 1.18.42 | Giảm boilerplate code |
| **Maven** | 3.6+ | Build tool và dependency management |
| **Tomcat** | 10.1+ | Web server |
| **JSP/Servlet** | Jakarta EE | Web layer |

---

## 🔧 Cài đặt môi trường

### 1. Cài đặt Java 17+
```bash
# Kiểm tra Java version
java -version
javac -version

# Nếu chưa có Java 17+, download từ:
# https://adoptium.net/
```

### 2. Cài đặt Maven
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install maven

# Kiểm tra Maven
mvn -version
```

### 3. Cài đặt MariaDB/MySQL
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install mariadb-server mariadb-client

# Khởi động service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Bảo mật cài đặt
sudo mysql_secure_installation
```

### 4. Cài đặt Tomcat
```bash
# Download Tomcat 10.1+ từ:
# https://tomcat.apache.org/download-10.cgi

# Giải nén và cấu hình
sudo tar -xzf apache-tomcat-10.1.x.tar.gz -C /opt/
sudo ln -s /opt/apache-tomcat-10.1.x /opt/tomcat
```

---

## 🗄️ Cấu hình Database

### 1. Sử dụng Script tự động
```bash
# Chạy script setup database
mysql -u root -p < database_setup.sql
```

**Hoặc chạy từng bước:**
```bash
# Đăng nhập MariaDB
sudo mysql -u root -p

# Chạy script
source database_setup.sql
```

### 2. Nội dung file database_setup.sql
Script này sẽ tự động:
- ✅ Tạo database `userdb` với charset UTF-8
- ✅ Tạo user `root` với password `1234567890`
- ✅ Cấp quyền đầy đủ cho user
- ✅ Tạo bảng `users` với cấu trúc phù hợp
- ✅ Tạo indexes để tối ưu performance
- ✅ Thêm dữ liệu mẫu để test
- ✅ Hiển thị thông tin setup

### 3. Kiểm tra kết quả
```sql
-- Kiểm tra database đã tạo
SHOW DATABASES;

-- Chuyển sang database
USE userdb;

-- Xem danh sách bảng
SHOW TABLES;

-- Xem cấu trúc bảng users
DESCRIBE users;

-- Xem dữ liệu mẫu
SELECT * FROM users;
```

---

## 📦 Cấu hình Maven

### 1. Cấu trúc project
```
Connect_JPA/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── iuh/fit/se/connect_jpa/
│   │   │       ├── entity/
│   │   │       ├── dao/
│   │   │       ├── servlet/
│   │   │       └── util/
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   │       └── persistence.xml
│   │   └── webapp/
│   │       ├── index.jsp
│   │       ├── user-list.jsp
│   │       ├── user-form.jsp
│   │       ├── user-detail.jsp
│   │       └── WEB-INF/
│   │           └── web.xml
│   └── test/
└── README.md
```

### 2. File pom.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>iuh.fit.se</groupId>
    <artifactId>Connect_JPA</artifactId>
    <version>1.0-SNAPSHOT</version>
    <name>Connect_JPA</name>
    <packaging>war</packaging>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.target>17</maven.compiler.target>
        <maven.compiler.source>17</maven.compiler.source>
        <junit.version>5.13.2</junit.version>
    </properties>

    <dependencies>
        <!-- Jakarta Servlet API -->
        <dependency>
            <groupId>jakarta.servlet</groupId>
            <artifactId>jakarta.servlet-api</artifactId>
            <version>6.1.0</version>
            <scope>provided</scope>
        </dependency>
        
        <!-- Jakarta Persistence API -->
        <dependency>
            <groupId>jakarta.persistence</groupId>
            <artifactId>jakarta.persistence-api</artifactId>
            <version>3.2.0</version>
        </dependency>
        
        <!-- Hibernate Core -->
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>6.6.1.Final</version>
        </dependency>
        
        <!-- MariaDB JDBC Driver -->
        <dependency>
            <groupId>org.mariadb.jdbc</groupId>
            <artifactId>mariadb-java-client</artifactId>
            <version>3.5.1</version>
        </dependency>
        
        <!-- Lombok -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.42</version>
            <scope>provided</scope>
        </dependency>
        
        <!-- JUnit 5 -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.4.0</version>
            </plugin>
        </plugins>
    </build>
</project>
```

---

## ⚙️ Cấu hình JPA

### 1. Tạo persistence.xml
**File:** `src/main/resources/META-INF/persistence.xml`

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence version="3.0" 
    xmlns="https://jakarta.ee/xml/ns/persistence"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence https://jakarta.ee/xml/ns/persistence/persistence_3_0.xsd">

  <persistence-unit name="user-management" transaction-type="RESOURCE_LOCAL">
    <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>
    <properties>
      <!-- Database Connection -->
      <property name="jakarta.persistence.jdbc.driver" value="org.mariadb.jdbc.Driver" />
      <property name="jakarta.persistence.jdbc.url" value="jdbc:mariadb://localhost:3306/userdb" />
      <property name="jakarta.persistence.jdbc.user" value="root" />
      <property name="jakarta.persistence.jdbc.password" value="1234567890" />

      <!-- Hibernate Settings -->
      <property name="jakarta.persistence.schema-generation.database.action" value="none" />
      <property name="hibernate.show_sql" value="true" />
      <property name="hibernate.format_sql" value="true" />
      <property name="hibernate.highlight_sql" value="true" />
    </properties>
  </persistence-unit>
</persistence>
```

### 2. Tạo EntityManagerFactoryUtil
**File:** `src/main/java/iuh/fit/se/connect_jpa/util/EntityManagerFactoryUtil.java`

```java
package iuh.fit.se.connect_jpa.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManagerFactoryUtil {
    private static final EntityManagerFactory emf;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("user-management");
        } catch (Throwable ex) {
            System.err.println("Initial EntityManagerFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf.isOpen()) emf.close();
    }
}
```

---

## 🏗️ Tạo Entity

### User Entity
**File:** `src/main/java/iuh/fit/se/connect_jpa/entity/User.java`

```java
package iuh.fit.se.connect_jpa.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;
    private String country;

    // Constructor for creating new user (without ID)
    public User(String name, String email, String password, String country) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
    }
}
```

### Giải thích annotations:
- `@Entity`: Đánh dấu class là JPA entity
- `@Table(name = "users")`: Map với bảng "users" trong database
- `@Id`: Đánh dấu primary key
- `@GeneratedValue(strategy = GenerationType.IDENTITY)`: Auto-increment ID
- `@Data`: Lombok - tự động tạo getter/setter/toString/equals/hashCode
- `@NoArgsConstructor`: Lombok - constructor không tham số
- `@AllArgsConstructor`: Lombok - constructor với tất cả tham số

---

## 📊 Tạo DAO Layer

### 1. UserDAO Interface
**File:** `src/main/java/iuh/fit/se/connect_jpa/dao/UserDAO.java`

```java
package iuh.fit.se.connect_jpa.dao;

import iuh.fit.se.connect_jpa.entity.User;
import java.util.List;

public interface UserDAO {
    List<User> findAll();
    void save(User user);
    User findById(Long id);
    void update(User user);
    void delete(Long id);
    
    // Methods bổ sung
    List<User> findByEmail(String email);
    List<User> findByCountry(String country);
    long count();
    boolean existsById(Long id);
}
```

### 2. UserDAOImpl Implementation
**File:** `src/main/java/iuh/fit/se/connect_jpa/dao/UserDAOImpl.java`

```java
package iuh.fit.se.connect_jpa.dao;

import iuh.fit.se.connect_jpa.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    private final EntityManager em;

    public UserDAOImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public List<User> findAll() {
        // Query trực tiếp từ database
        return em.createQuery("SELECT u FROM User u ORDER BY u.id DESC", User.class).getResultList();
    }

    @Override
    public void save(User user) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Persist vào database
            em.persist(user);
            // Flush để đảm bảo data được ghi vào database ngay lập tức
            em.flush();
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    @Override
    public User findById(Long id) {
        // Query trực tiếp từ database theo ID (không dùng cache)
        List<User> users = em.createQuery("SELECT u FROM User u WHERE u.id = :id", User.class)
                .setParameter("id", id)
                .getResultList();
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public void update(User user) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Merge changes vào database
            em.merge(user);
            // Flush để đảm bảo changes được ghi vào database ngay lập tức
            em.flush();
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    @Override
    public void delete(Long id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Tìm user từ database
            User user = em.find(User.class, id);
            if (user != null) {
                // Xóa từ database
                em.remove(user);
                // Flush để đảm bảo xóa được thực hiện ngay lập tức
                em.flush();
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }
    
    @Override
    public List<User> findByEmail(String email) {
        // Query trực tiếp từ database theo email
        return em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                .setParameter("email", email)
                .getResultList();
    }
    
    @Override
    public List<User> findByCountry(String country) {
        // Query trực tiếp từ database theo quốc gia
        return em.createQuery("SELECT u FROM User u WHERE u.country = :country ORDER BY u.id DESC", User.class)
                .setParameter("country", country)
                .getResultList();
    }
    
    @Override
    public long count() {
        // Đếm số lượng records trong database
        return em.createQuery("SELECT COUNT(u) FROM User u", Long.class)
                .getSingleResult();
    }
    
    @Override
    public boolean existsById(Long id) {
        // Kiểm tra user có tồn tại trong database không
        Long count = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.id = :id", Long.class)
                .setParameter("id", id)
                .getSingleResult();
        return count > 0;
    }
}
```

---

## 🌐 Tạo Servlet Layer

### 1. UserListServlet
**File:** `src/main/java/iuh/fit/se/connect_jpa/servlet/UserListServlet.java`

```java
package iuh.fit.se.connect_jpa.servlet;

import iuh.fit.se.connect_jpa.dao.UserDAO;
import iuh.fit.se.connect_jpa.dao.UserDAOImpl;
import iuh.fit.se.connect_jpa.entity.User;
import iuh.fit.se.connect_jpa.util.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "userListServlet", value = "/user-list")
public class UserListServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            List<User> users = userDAO.findAll();
            
            request.setAttribute("users", users);
            request.getRequestDispatcher("user-list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi tải danh sách users: " + e.getMessage());
            request.getRequestDispatcher("user-list.jsp").forward(request, response);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}
```

### 2. UserSaveServlet
**File:** `src/main/java/iuh/fit/se/connect_jpa/servlet/UserSaveServlet.java`

```java
package iuh.fit.se.connect_jpa.servlet;

import iuh.fit.se.connect_jpa.dao.UserDAO;
import iuh.fit.se.connect_jpa.dao.UserDAOImpl;
import iuh.fit.se.connect_jpa.entity.User;
import iuh.fit.se.connect_jpa.util.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "userSaveServlet", value = "/user-save")
public class UserSaveServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        EntityManager em = null;
        try {
            // Lấy dữ liệu từ form
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String country = request.getParameter("country");
            
            // Validation
            if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                country == null || country.trim().isEmpty()) {
                
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("user-form.jsp").forward(request, response);
                return;
            }
            
            // Tạo user mới
            User user = new User(name.trim(), email.trim(), password.trim(), country.trim());
            
            em = EntityManagerFactoryUtil.getEntityManager();
            UserDAO userDAO = new UserDAOImpl(em);
            
            // Lưu user
            userDAO.save(user);
            
            // Redirect về danh sách users
            response.sendRedirect("user-list");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi lưu user: " + e.getMessage());
            request.getRequestDispatcher("user-form.jsp").forward(request, response);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}
```

### 3. Các Servlet khác
Tương tự tạo các servlet còn lại:
- `UserUpdateServlet` - Cập nhật user
- `UserDeleteServlet` - Xóa user  
- `UserDetailServlet` - Hiển thị chi tiết user
- `UserFormServlet` - Hiển thị form thêm/sửa

---

## 🎨 Tạo JSP Views

### 1. Trang chủ (index.jsp)
**File:** `src/main/webapp/index.jsp`

```jsp
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
```

### 2. Danh sách Users (user-list.jsp)
**File:** `src/main/webapp/user-list.jsp`

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuh.fit.se.connect_jpa.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
            display: inline-block;
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
        .btn-success {
            background-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        .actions {
            white-space: nowrap;
        }
        .actions a {
            margin-right: 5px;
        }
        .no-data {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Danh sách Users</h1>
        
        <a href="user-form" class="btn btn-success">➕ Thêm User mới</a>
        <a href="index.jsp" class="btn">🏠 Trang chủ</a>
        
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Quốc gia</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getCountry() %></td>
                    <td class="actions">
                        <a href="user-detail?id=<%= user.getId() %>" class="btn">👁️ Xem</a>
                        <a href="user-form?id=<%= user.getId() %>" class="btn">✏️ Sửa</a>
                        <a href="user-delete?id=<%= user.getId() %>" class="btn btn-danger" 
                           onclick="return confirm('Bạn có chắc muốn xóa user này?')">🗑️ Xóa</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <div class="no-data">
            <h3>📭 Chưa có user nào</h3>
            <p>Hãy thêm user đầu tiên để bắt đầu!</p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
```

### 3. Form User (user-form.jsp)
**File:** `src/main/webapp/user-form.jsp`

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuh.fit.se.connect_jpa.entity.User" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: white;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
        }
        select {
            cursor: pointer;
        }
        select option {
            padding: 8px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            User user = (User) request.getAttribute("user");
            boolean isEdit = user != null && user.getId() != null;
            String action = isEdit ? "user-update" : "user-save";
            String title = isEdit ? "✏️ Sửa User" : "➕ Thêm User mới";
        %>
        
        <h1><%= title %></h1>
        
        <form action="<%= action %>" method="post">
            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= user.getId() %>">
            <% } %>
            
            <div class="form-group">
                <label for="name">Tên:</label>
                <input type="text" id="name" name="name" 
                       value="<%= user != null ? user.getName() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" 
                       value="<%= user != null ? user.getEmail() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" 
                       value="<%= user != null ? user.getPassword() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="country">Quốc gia:</label>
                <select id="country" name="country" required>
                    <option value="">-- Chọn quốc gia --</option>
                    <option value="Việt Nam" <%= (user != null && "Việt Nam".equals(user.getCountry())) ? "selected" : "" %>>🇻🇳 Việt Nam</option>
                    <option value="Thái Lan" <%= (user != null && "Thái Lan".equals(user.getCountry())) ? "selected" : "" %>>🇹🇭 Thái Lan</option>
                    <option value="Singapore" <%= (user != null && "Singapore".equals(user.getCountry())) ? "selected" : "" %>>🇸🇬 Singapore</option>
                    <!-- Thêm các quốc gia khác... -->
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-success">
                    <%= isEdit ? "💾 Cập nhật" : "➕ Thêm mới" %>
                </button>
                <a href="index.jsp" class="btn btn-secondary">🏠 Trang chủ</a>
            </div>
        </form>
    </div>
</body>
</html>
```

---

## 🚀 Chạy ứng dụng

### 1. Build project
```bash
# Di chuyển vào thư mục project
cd /path/to/Connect_JPA

# Clean và compile
mvn clean compile

# Package thành WAR file
mvn clean package
```

### 2. Deploy lên Tomcat
```bash
# Copy WAR file vào webapps
sudo cp target/Connect_JPA-1.0-SNAPSHOT.war /opt/tomcat/webapps/

# Hoặc rename thành Connect_JPA.war
sudo cp target/Connect_JPA-1.0-SNAPSHOT.war /opt/tomcat/webapps/Connect_JPA.war
```

### 3. Khởi động Tomcat
```bash
# Khởi động Tomcat
sudo /opt/tomcat/bin/startup.sh

# Kiểm tra log
tail -f /opt/tomcat/logs/catalina.out
```

### 4. Truy cập ứng dụng
```
http://localhost:8080/Connect_JPA/
```

---

## ✅ Kiểm tra kết quả

### 1. Kiểm tra kết nối database
- Mở trang chủ: `http://localhost:8080/Connect_JPA/`
- Click "Danh sách Users" - nếu không có lỗi thì kết nối thành công

### 2. Test CRUD operations
1. **Create**: Click "Thêm User" → Điền form → Submit
2. **Read**: Xem danh sách users sau khi thêm
3. **Update**: Click "Sửa" → Thay đổi thông tin → Submit
4. **Delete**: Click "Xóa" → Confirm → Kiểm tra đã xóa

### 3. Kiểm tra database
```sql
-- Đăng nhập MariaDB
sudo mysql -u root -p

-- Chọn database
USE userdb;

-- Xem dữ liệu
SELECT * FROM users;

-- Xem cấu trúc bảng
DESCRIBE users;
```

---

## 🔧 Troubleshooting

### 1. Lỗi kết nối database
```
Error: Could not create connection to database server
```

**Giải pháp:**
- Kiểm tra MariaDB đang chạy: `sudo systemctl status mariadb`
- Kiểm tra thông tin kết nối trong `persistence.xml`
- Test kết nối: `mysql -u root -p -h localhost -P 3306`

### 2. Lỗi EntityManagerFactory
```
Initial EntityManagerFactory creation failed
```

**Giải pháp:**
- Kiểm tra `persistence.xml` có đúng syntax không
- Kiểm tra database driver trong classpath
- Kiểm tra database đã tạo chưa

### 3. Lỗi 404 - Servlet not found
```
HTTP Status 404 – Not Found
```

**Giải pháp:**
- Kiểm tra `@WebServlet` annotation
- Kiểm tra URL mapping
- Rebuild và redeploy project

### 4. Lỗi Lombok
```
java: cannot find symbol
```

**Giải pháp:**
- Cài đặt Lombok plugin cho IDE
- Hoặc xóa Lombok và viết getter/setter thủ công

### 5. Lỗi encoding
```
Dữ liệu tiếng Việt hiển thị sai
```

**Giải pháp:**
- Thêm `pageEncoding="UTF-8"` vào JSP
- Cấu hình database charset: `utf8mb4`
- Cấu hình Tomcat encoding

---

## 📚 Tài liệu tham khảo

- [Jakarta Persistence API Documentation](https://jakarta.ee/specifications/persistence/)
- [Hibernate Documentation](https://hibernate.org/orm/documentation/)
- [MariaDB Documentation](https://mariadb.org/documentation/)
- [Maven Documentation](https://maven.apache.org/guides/)
- [Tomcat Documentation](https://tomcat.apache.org/tomcat-10.1-doc/)

---

## 🎯 Kết luận

Sau khi hoàn thành hướng dẫn này, bạn sẽ có:

✅ **Ứng dụng web hoàn chỉnh** với JPA/Hibernate  
✅ **Kết nối database** MariaDB/MySQL  
✅ **CRUD operations** đầy đủ  
✅ **Giao diện JSP** responsive và đẹp mắt  
✅ **Error handling** và transaction management  
✅ **Best practices** trong Java web development  

Ứng dụng sẵn sàng để mở rộng thêm các tính năng như authentication, pagination, search, validation nâng cao, v.v.

**Chúc bạn thành công! 🚀**