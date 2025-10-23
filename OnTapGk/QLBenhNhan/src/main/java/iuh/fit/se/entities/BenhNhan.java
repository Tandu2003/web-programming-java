package iuh.fit.se.entities;


import java.util.Date;

public class BenhNhan {
    private int maBN;
    private String hoTen;
    private Date ngayNhapVien;
    private String chuanDoan;

    private Khoa khoa;

    public BenhNhan() {

    }

    public BenhNhan(String hoTen, Date ngayNhapVien, String chuanDoan, Khoa khoa) {
        this.hoTen = hoTen;
        this.ngayNhapVien = ngayNhapVien;
        this.chuanDoan = chuanDoan;
        this.khoa = khoa;
    }

    public int getMaBN() {
        return maBN;
    }

    public void setMaBN(int maBN) {
        this.maBN = maBN;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgayNhapVien() {
        return ngayNhapVien;
    }

    public void setNgayNhapVien(Date ngayNhapVien) {
        this.ngayNhapVien = ngayNhapVien;
    }

    public String getChuanDoan() {
        return chuanDoan;
    }

    public void setChuanDoan(String chuanDoan) {
        this.chuanDoan = chuanDoan;
    }

    public Khoa getKhoa() {
        return khoa;
    }

    public void setKhoa(Khoa khoa) {
        this.khoa = khoa;
    }

    @Override
    public String toString() {
        return "BenhNhan{" +
                "maBN=" + maBN +
                ", hoTen='" + hoTen + '\'' +
                ", ngayNhapVien=" + ngayNhapVien +
                ", chuanDoan='" + chuanDoan + '\'' +
                ", khoa=" + khoa +
                '}';
    }
}
