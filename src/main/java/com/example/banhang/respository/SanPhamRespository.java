package com.example.banhang.respository;

import com.example.banhang.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamRespository  extends JpaRepository<SanPham,Integer> {
    List<SanPham> findAllByOrderByNgayTaoDesc();

    SanPham findAllById(Integer idSP);
}
