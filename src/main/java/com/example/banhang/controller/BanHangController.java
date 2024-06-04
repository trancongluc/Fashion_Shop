package com.example.banhang.controller;

import com.example.banhang.respository.CTSPRepository;
import com.example.banhang.respository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BanHangController {
    @Autowired
    HoaDonRepository hdRepo;
    @Autowired
    CTSPRepository ctspRepo;
    @GetMapping("/ban-hang")
    public String banHang(Model model){
        model.addAttribute("listHD",hdRepo.findByTrangThaiOrderByNgayTaoDesc("Chua thanh toan"));
        model.addAttribute("listCTSP",ctspRepo.findAll());
        return "ban-hang/banHang";
    }

}
