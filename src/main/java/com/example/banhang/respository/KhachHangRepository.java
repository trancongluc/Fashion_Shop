package com.example.banhang.respository;

import com.example.banhang.model.HoaDon;
import com.example.banhang.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KhachHangRepository extends JpaRepository<KhachHang,Integer> {
    KhachHang findAllById(Integer id);
    KhachHang findBySdt(String sdt);
    Page<KhachHang> findAllByOrderByNgayTaoDesc(Pageable pageable);
}
