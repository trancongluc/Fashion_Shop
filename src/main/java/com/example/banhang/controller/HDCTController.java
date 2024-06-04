package com.example.banhang.controller;

import com.example.banhang.respository.HDCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HDCTController {
    @Autowired
    HDCTRepository hdctRepo;
    @GetMapping("/hoa-don-chi-tiet")
    public String hdctTrangChu(Model model){
        model.addAttribute("listHDCT",hdctRepo.findAll());
        return"hdct/hdct";
    }
}
