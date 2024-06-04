package com.example.banhang.controller;

import com.example.banhang.respository.KhachHangRepository;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangRepository khRepo;
    @GetMapping("/khach-hang")
    public String khachHang(Model model){
        model.addAttribute("listKH",khRepo.findAll());
        return "khach-hang/khachHang";
    }
}
