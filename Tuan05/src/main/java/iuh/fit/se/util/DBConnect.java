package iuh.fit.se.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static final String URL = "jdbc:mariadb://localhost:3306/quanlydienthoai";
    private static final String USER = "root";
    private static final String PASS = "1234567890";

    public static Connection getConnection() throws Exception {
        Class.forName("org.mariadb.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
