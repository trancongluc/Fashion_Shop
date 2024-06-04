package com.example.banhang.controller;

import com.example.banhang.respository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HoaDonController {
    @Autowired
    HoaDonRepository hdRepo;
    @GetMapping("/hoa-don")
    public String hoaDon(Model  model){
        model.addAttribute("listHD",hdRepo.findAll());
        return "hoa-don/hoadon";
    }
}
