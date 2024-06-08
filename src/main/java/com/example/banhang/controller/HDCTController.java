package com.example.banhang.controller;

import com.example.banhang.respository.HDCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HDCTController {
    @Autowired
    HDCTRepository hdctRepo;
    @GetMapping("/hoa-don-chi-tiet")
    public String hdctTrangChu(Model model, @RequestParam("idHD")Integer idHD){
        model.addAttribute("listHDCT",hdctRepo.findByHoaDon_Id(idHD));
        return"hdct/hdct";
    }
}
