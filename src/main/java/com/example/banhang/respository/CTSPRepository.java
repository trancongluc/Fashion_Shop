package com.example.banhang.respository;

import com.example.banhang.model.ChiTietSanPham;
import com.example.banhang.model.HoaDon;
import com.example.banhang.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CTSPRepository extends JpaRepository<ChiTietSanPham,Integer> {
    ChiTietSanPham findAllById(Integer idCTSP);
    List<ChiTietSanPham> findByTrangThaiOrderByNgayTaoDesc(String trangThai);
}
