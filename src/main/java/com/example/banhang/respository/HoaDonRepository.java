package com.example.banhang.respository;

import com.example.banhang.model.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface HoaDonRepository extends JpaRepository<HoaDon,Integer> {
    List<HoaDon> findByTrangThaiOrderByNgayTaoDesc(String trangThai);
    HoaDon findAllById(Integer id);

}
