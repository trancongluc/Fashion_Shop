package com.example.banhang.controller;

import com.example.banhang.model.SanPham;
import com.example.banhang.respository.DanhMucRepository;
import com.example.banhang.respository.SanPhamRespository;
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
public class SanPhamController {
    @GetMapping("/trang-chu")
    public String banHang() {
        return "home";
    }

    @Autowired
    SanPhamRespository spRepo;
    @Autowired
    DanhMucRepository dmRepo;


    @GetMapping("/trang-chu-sp")
//    public String trangChuSP(Model model){
//        model.addAttribute("listSP",spRepo.findAllByOrderByNgayTaoDesc());
//        model.addAttribute("listDM",dmRepo.findAll());
//        return"san-pham/trang-chu-sp";
//    }
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model) {
        Pageable pageable = PageRequest.of(pageNo, 2);
        Page<SanPham> page = spRepo.findAll(pageable);
        model.addAttribute("listDM", dmRepo.findAll());
        model.addAttribute("page", page);
        return "san-pham/trang-chu-sp";
    }

    @PostMapping("/add-sp")
    public String addSP(@ModelAttribute SanPham sanPham) {
        sanPham.setNgayTao(LocalDateTime.now());
        sanPham.setNgaySua(LocalDateTime.now());
        spRepo.save(sanPham);
        return "redirect:/trang-chu-sp";
    }

    @GetMapping("/san-pham/detail")
    public String detailtSP(@RequestParam("idSP") Integer idSP, Model model) {
        SanPham sp = spRepo.findAllById(idSP);
        model.addAttribute("listDM", dmRepo.findAll());
        model.addAttribute("spDetail", sp);
        return "san-pham/detailtSP";
    }

    @GetMapping("/san-pham/delete")
    public String deleteSP(@RequestParam("idSP") Integer idSP, Model model) {
        spRepo.deleteById(idSP);
        return "redirect:/trang-chu-sp";
    }

    @PostMapping("/san-pham/update")
    public String updateSP(@ModelAttribute SanPham sanPham, @RequestParam("idSP") Integer idSP) {
//        SanPham sp = spRepo.findAllById(idSP);
//        sp.setMaSP(sanPham.getMaSP());
//        sp.setTenSP(sanPham.getTenSP());
//        sp.setTrangThai(sanPham.getTrangThai());
        sanPham.setNgaySua(LocalDateTime.now());
//        sp.setDanhMuc(sanPham.getDanhMuc());
        spRepo.save(sanPham);
        return "redirect:/trang-chu-sp";
    }
}
