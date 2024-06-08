package com.example.banhang.respository;

import com.example.banhang.model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface HoaDonRepository extends JpaRepository<HoaDon,Integer> {
    List<HoaDon> findByTrangThaiOrderByNgayTaoDesc(String trangThai);
    Page<HoaDon> findAllByOrderByNgaySuaDesc(Pageable pageable);
    HoaDon findAllById(Integer id);


}
