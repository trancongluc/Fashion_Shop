package com.example.banhang.controller;

import com.example.banhang.model.HoaDon;
import com.example.banhang.model.KhachHang;
import com.example.banhang.respository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HoaDonController {
    @Autowired
    HoaDonRepository hdRepo;
    @GetMapping("/hoa-don")
    public String hoaDon(Model  model,
                         @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo
                         ){
        Pageable pageable = PageRequest.of(pageNo,7);
        Page<HoaDon> page = hdRepo.findAllByOrderByNgaySuaDesc(pageable);
        model.addAttribute("listHD",page.getContent());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPage", page.getTotalPages());
        return "hoa-don/hoadon";
    }
}
