package com.example.banhang.controller;

import com.example.banhang.model.KhachHang;
import com.example.banhang.respository.KhachHangRepository;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangRepository khRepo;
    @GetMapping("/khach-hang")
    public String khachHang(Model model,
                            @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo
                            ){
        Pageable pageable = PageRequest.of(pageNo,3);
        Page<KhachHang> page = khRepo.findAllByOrderByNgayTaoDesc(pageable);
        model.addAttribute("listKH",page.getContent());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPage", page.getTotalPages());
        return "khach-hang/khachHang";
    }
    @PostMapping("/khach-hang/add")
    public String addKH(@ModelAttribute KhachHang khachHang){
        khachHang.setNgayTao(LocalDateTime.now());
        khRepo.save(khachHang);
        return "redirect:/ban-hang";
    }
    @GetMapping("/khach-hang/delete")
    public String deleteKH(@RequestParam("idKH") Integer idKH){
        khRepo.deleteById(idKH);
        return "redirect:/khach-hang";
    }
}
