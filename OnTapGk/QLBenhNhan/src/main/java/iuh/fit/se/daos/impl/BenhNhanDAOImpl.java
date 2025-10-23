package iuh.fit.se.daos.impl;

import iuh.fit.se.daos.BenhNhanDAO;
import iuh.fit.se.entities.BenhNhan;
import iuh.fit.se.entities.Khoa;
import iuh.fit.se.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BenhNhanDAOImpl implements BenhNhanDAO {
    @Override
    public List<BenhNhan> getList() {
        List<BenhNhan> list = new ArrayList<>();
        String sql = "SELECT b.*, k.TENKHOA, k.TRUONGKHOA, k.MOTA " +
                    "FROM BENHNHAN b " +
                    "JOIN KHOA k ON b.MAKHOA = k.MAKHOA " +
                    "ORDER BY b.NGAYNHAPVIEN DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BenhNhan benhNhan = new BenhNhan();
                benhNhan.setMaBN(rs.getInt("MABN"));
                benhNhan.setHoTen(rs.getString("HOTEN"));
                benhNhan.setNgayNhapVien(rs.getDate("NGAYNHAPVIEN"));
                benhNhan.setChuanDoan(rs.getString("CHUANDOAN"));
                
                // Create full Khoa object with all details
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getInt("MAKHOA"));
                khoa.setTenKhoa(rs.getString("TENKHOA"));
                khoa.setTruongKhoa(rs.getString("TRUONGKHOA"));
                khoa.setMoTa(rs.getString("MOTA"));
                benhNhan.setKhoa(khoa);
                
                list.add(benhNhan);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    @Override
    public List<BenhNhan> getBenhNhanhByName(String hoTen) {
        List<BenhNhan> list = new ArrayList<>();
        String sql = "SELECT b.*, k.TENKHOA, k.TRUONGKHOA, k.MOTA " +
                    "FROM BENHNHAN b " +
                    "JOIN KHOA k ON b.MAKHOA = k.MAKHOA " +
                    "WHERE b.HOTEN LIKE ? " +
                    "ORDER BY b.NGAYNHAPVIEN DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + hoTen + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BenhNhan benhNhan = new BenhNhan();
                benhNhan.setMaBN(rs.getInt("MABN"));
                benhNhan.setHoTen(rs.getString("HOTEN"));
                benhNhan.setNgayNhapVien(rs.getDate("NGAYNHAPVIEN"));
                benhNhan.setChuanDoan(rs.getString("CHUANDOAN"));
                
                // Create full Khoa object with all details
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getInt("MAKHOA"));
                khoa.setTenKhoa(rs.getString("TENKHOA"));
                khoa.setTruongKhoa(rs.getString("TRUONGKHOA"));
                khoa.setMoTa(rs.getString("MOTA"));
                benhNhan.setKhoa(khoa);
                
                list.add(benhNhan);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<BenhNhan> getListByKhoa(int maKhoa) {
        List<BenhNhan> list = new ArrayList<>();
        String sql = "SELECT b.*, k.TENKHOA, k.TRUONGKHOA, k.MOTA " +
                    "FROM BENHNHAN b " +
                    "JOIN KHOA k ON b.MAKHOA = k.MAKHOA " +
                    "WHERE b.MAKHOA = ? " +
                    "ORDER BY b.NGAYNHAPVIEN DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maKhoa);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BenhNhan benhNhan = new BenhNhan();
                benhNhan.setMaBN(rs.getInt("MABN"));
                benhNhan.setHoTen(rs.getString("HOTEN"));
                benhNhan.setNgayNhapVien(rs.getDate("NGAYNHAPVIEN"));
                benhNhan.setChuanDoan(rs.getString("CHUANDOAN"));
                
                // Create full Khoa object with all details
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getInt("MAKHOA"));
                khoa.setTenKhoa(rs.getString("TENKHOA"));
                khoa.setTruongKhoa(rs.getString("TRUONGKHOA"));
                khoa.setMoTa(rs.getString("MOTA"));
                benhNhan.setKhoa(khoa);
                
                list.add(benhNhan);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public boolean addBenhNhanByMaKhoa(BenhNhan benhNhan) {
        String sql = "INSERT INTO BENHNHAN (HOTEN, NGAYNHAPVIEN, CHUANDOAN, MAKHOA) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {


            ps.setString(1, benhNhan.getHoTen());
            ps.setDate(2, new Date(benhNhan.getNgayNhapVien().getTime()));
            ps.setString(3, benhNhan.getChuanDoan());
            ps.setInt(4, benhNhan.getKhoa().getMaKhoa());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
