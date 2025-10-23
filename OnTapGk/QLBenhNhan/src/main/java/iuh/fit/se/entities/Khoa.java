package iuh.fit.se.entities;

public class Khoa {
    private int maKhoa;
    private String tenKhoa;
    private String truongKhoa;
    private String moTa;

    public Khoa() {

    }

    public Khoa(int maKhoa) {
        this.maKhoa = maKhoa;
    }

    public Khoa(String tenKhoa, String truongKhoa, String moTa) {
        this.tenKhoa = tenKhoa;
        this.truongKhoa = truongKhoa;
        this.moTa = moTa;
    }

    public int getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(int maKhoa) {
        this.maKhoa = maKhoa;
    }

    public String getTenKhoa() {
        return tenKhoa;
    }

    public void setTenKhoa(String tenKhoa) {
        this.tenKhoa = tenKhoa;
    }

    public String getTruongKhoa() {
        return truongKhoa;
    }

    public void setTruongKhoa(String truongKhoa) {
        this.truongKhoa = truongKhoa;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "Khoa{" +
                "maKhoa=" + maKhoa +
                ", tenKhoa='" + tenKhoa + '\'' +
                ", truongKhoa='" + truongKhoa + '\'' +
                ", moTa='" + moTa + '\'' +
                '}';
    }
}
