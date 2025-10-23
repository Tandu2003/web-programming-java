package iuh.fit.se.daos.impl;

import iuh.fit.se.daos.KhoaDAO;
import iuh.fit.se.entities.Khoa;
import iuh.fit.se.utils.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KhoaDAOImpl implements KhoaDAO {
    @Override
    public List<Khoa> getList() {
        List<Khoa> khoas = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            Statement  stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM KHOA");
            while (rs.next()) {
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getInt("MAKHOA"));
                khoa.setTenKhoa(rs.getString("TENKHOA"));
                khoa.setTruongKhoa(rs.getString("TRUONGKHOA"));
                khoa.setMoTa(rs.getString("MOTA"));
                khoas.add(khoa);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return khoas;
    }
}
