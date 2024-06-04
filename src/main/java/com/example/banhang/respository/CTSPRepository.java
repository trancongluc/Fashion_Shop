package com.example.banhang.respository;

import com.example.banhang.model.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CTSPRepository extends JpaRepository<ChiTietSanPham,Integer> {
}
