package com.example.banhang.respository;

import com.example.banhang.model.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HDCTRepository extends JpaRepository<HoaDonChiTiet,Integer> {
    List<HoaDonChiTiet> findByHoaDon_Id(Integer idHD);
    HoaDonChiTiet findTop1ByChiTietSanPham_Id(Integer idCTSP);
    HoaDonChiTiet findAllById(Integer idHDCT);

    HoaDonChiTiet findTop1ByChiTietSanPham_IdAndHoaDon_Id(Integer idCTSP, Integer idHD);
}
