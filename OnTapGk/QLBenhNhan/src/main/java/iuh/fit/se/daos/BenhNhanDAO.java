package iuh.fit.se.daos;

import iuh.fit.se.entities.BenhNhan;

import java.util.List;

public interface BenhNhanDAO {
    List<BenhNhan> getList();

    List<BenhNhan> getBenhNhanhByName(String hoTen);

    List<BenhNhan> getListByKhoa(int maKhoa);

    boolean addBenhNhanByMaKhoa(BenhNhan benhNhan);
}
