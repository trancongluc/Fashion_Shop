package com.example.banhang.controller;

import com.example.banhang.model.ChiTietSanPham;
import com.example.banhang.model.HoaDon;
import com.example.banhang.model.HoaDonChiTiet;
import com.example.banhang.model.KhachHang;
import com.example.banhang.respository.CTSPRepository;
import com.example.banhang.respository.HDCTRepository;
import com.example.banhang.respository.HoaDonRepository;
import com.example.banhang.respository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class BanHangController {
    @Autowired
    HoaDonRepository hdRepo;
    @Autowired
    CTSPRepository ctspRepo;
    @Autowired
    HDCTRepository hdctRepo;
    @Autowired
    KhachHangRepository khRepo;

    @GetMapping("/ban-hang")
    public String banHang(Model model) {
        model.addAttribute("listHD", hdRepo.findByTrangThaiOrderByNgayTaoDesc("Chua thanh toan"));
        model.addAttribute("listCTSP", ctspRepo.findAll());
        model.addAttribute("listKH", khRepo.findAll());
        return "ban-hang/banHang";
    }

    @GetMapping("/ban-hang/gio-hang")
    public String gioHang(Model model, @RequestParam("idHD") Integer idHD
            , @RequestParam("idKH") Integer idKH

    ) {
        List<HoaDonChiTiet> hdct = hdctRepo.findByHoaDon_Id(idHD);
        model.addAttribute("listHDCT", hdct);
        int tongtien = 0;
        for (HoaDonChiTiet hoaDonChiTiet : hdct) {
            tongtien += hoaDonChiTiet.getTongTien();
        }

        model.addAttribute("tongTien", tongtien);
        model.addAttribute("idKH", idKH);
        model.addAttribute("listHD", hdRepo.findByTrangThaiOrderByNgayTaoDesc("Chua thanh toan"));
        model.addAttribute("listCTSP", ctspRepo.findByTrangThaiOrderByNgayTaoDesc("Con hang"));
        model.addAttribute("listKH", khRepo.findAll());
        model.addAttribute("idHD", idHD);
        return "ban-hang/banHang";
    }

//    @PostMapping("/ban-hang/gio-hang/add")
//    public String addGioHang(@RequestParam("idHDInput") Integer idHD,
//                             @RequestParam("idCTSP") Integer idCTSP,
//                             @RequestParam("giaBan") Integer giaBan,
//                             @RequestParam("soLuong") Integer soLuong
//            , @ModelAttribute HoaDonChiTiet hdct, @ModelAttribute HoaDon hd,
//                             @RequestParam("idKH") Integer idKH
//
//                             ) {
//        HoaDonChiTiet hdctTonTai = hdctRepo.findTop1ByChiTietSanPham_Id(idCTSP);
//        ChiTietSanPham ctsp = ctspRepo.findAllById(idCTSP);
//        hd.setId(idHD);
//        boolean productExistsInCurrentOrder = false;
//        for (HoaDonChiTiet hdct1 : hdctRepo.findAll()) {
//            if (hdct1.getHoaDon().getId().equals(idHD) && hdct1.getChiTietSanPham().getId().equals(idCTSP)) {
//                productExistsInCurrentOrder = true;
//                hdctTonTai = hdct1;
//                break;
//            }
//        }
//        if (productExistsInCurrentOrder) {
//            int soLuongMoi = hdctTonTai.getSoLuongMua() + soLuong;
//            hdctTonTai.setSoLuongMua(soLuongMoi);
//            hdctTonTai.setTongTien(hdctTonTai.getGiaBan() * soLuongMoi);
//            ctsp.setSoLuongTon(ctsp.getSoLuongTon() - soLuong);
//            if (ctsp.getSoLuongTon() == 0) {
//                ctsp.setTrangThai("Het hang");
//            }
//            hdctTonTai.setNgaySua(LocalDateTime.now());
//            hdctRepo.save(hdctTonTai);
//
//        } else {
//            int soLuongMoi = soLuong;
//            hdct.setHoaDon(hd);
//            hdct.setChiTietSanPham(ctsp);
//            hdct.setNgayTao(LocalDateTime.now());
//            hdct.setNgaySua(LocalDateTime.now());
//            hdct.setSoLuongMua(soLuongMoi);
//            ctsp.setSoLuongTon(ctsp.getSoLuongTon() - soLuong);
//            if (ctsp.getSoLuongTon() == 0) {
//                ctsp.setTrangThai("Het hang");
//            }
//            hdct.setGiaBan(giaBan);
//            hdct.setTrangThai("Chua thanh toan");
//            hdct.setTongTien(soLuongMoi * ctsp.getGiaBan());
////            model.addAttribute("listCTSP", ctspRepo.findById(idCTSP));
//            hdctRepo.save(hdct);
//        }
//
//
//        return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH;
//    }

    @GetMapping("/ban-hang/gio-hang/delete")
    public String deleteGioHang(@RequestParam("idHDCT") Integer idHDCT,
                                @RequestParam("idHD") Integer idHD,
                                @RequestParam("idCTSP") Integer idCTSP,
                                @RequestParam("soLuongXoa") Integer soLuongXoa,
                                @RequestParam("idKH") Integer idKH,
                                Model model

    ) {
        HoaDonChiTiet hdct = hdctRepo.findAllById(idHDCT);
        model.addAttribute("idHDCT",hdct.getId());
        ChiTietSanPham ctsp = ctspRepo.findAllById(idCTSP);
        System.out.println(idCTSP);
        if (soLuongXoa > hdct.getSoLuongMua()) {
            soLuongXoa = 0;
        } else if (soLuongXoa < hdct.getSoLuongMua()) {
            hdct.setSoLuongMua(hdct.getSoLuongMua() - soLuongXoa);
            hdctRepo.save(hdct);
            ctsp.setSoLuongTon(ctsp.getSoLuongTon() + soLuongXoa);
            if (ctsp.getSoLuongTon() != 0) {
                ctsp.setTrangThai("Con hang");
            }
            ctspRepo.save(ctsp);

        } else {
            ctsp.setSoLuongTon(ctsp.getSoLuongTon() + soLuongXoa);
            if (ctsp.getSoLuongTon() != 0) {
                ctsp.setTrangThai("Con hang");
            }
            hdctRepo.deleteById(idHDCT);
        }

        return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH;
    }

    @PostMapping("/ban-hang/addHoaDon")
    public String addHoaDon(@ModelAttribute HoaDon hoaDon) {
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setTrangThai("Chua thanh toan");
        KhachHang kh = khRepo.findAllById(11);
        hoaDon.setKhachHang(kh);
        hdRepo.save(hoaDon);
        return "redirect:/ban-hang";
    }

    @GetMapping("/ban-hang/tkKH")
    public String tkKH(@RequestParam("tkKH") String sdt, @RequestParam("idHD") Integer idHD, Model model, @RequestParam("idKH") Integer idKH,
                       RedirectAttributes redirectAttributes
    ) {
        try {
            KhachHang tkKH = khRepo.findBySdt(sdt);
            if (tkKH == null) {
                redirectAttributes.addFlashAttribute("erro", "Khach hang khong ton tai");
                return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH;
            }
            HoaDon hoaDon = hdRepo.findById(idHD).orElse(null);
            if (hoaDon != null) {
                tkKH.setNgayTao(LocalDateTime.now());
                tkKH.setNgaySua(LocalDateTime.now());
                hoaDon.setKhachHang(tkKH);
                hdRepo.save(hoaDon);
                idKH = tkKH.getId();
            }
            redirectAttributes.addFlashAttribute("tkKH", tkKH);
            redirectAttributes.addFlashAttribute("sdtTK", sdt);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", "Co loi xay ra: " + e.getMessage());
        }
        return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH;
    }
    @GetMapping("/ban-hang/thanh-toan")
    public String thanhToan(@RequestParam("idHD") Integer idHD,
                            @ModelAttribute HoaDonChiTiet hoaDonChiTiet
                            ){
        HoaDon hd = hdRepo.findAllById(idHD);


        hd.setTrangThai("Da thanh toan");
        hd.setNgaySua(LocalDateTime.now());
        hoaDonChiTiet.setTrangThai("Da thanh toan");
        hoaDonChiTiet.setNgaySua(LocalDateTime.now());
        hdRepo.save(hd);
        hdctRepo.save(hoaDonChiTiet);
        //Database thiếu trường tổng tiền
        return "redirect:/ban-hang";
    }
    @PostMapping("/ban-hang/gio-hang/add")
    public String addGioHang(@RequestParam("idHDInput") Integer idHD,
                             @RequestParam("idCTSP") Integer idCTSP,
                             @RequestParam("giaBan") Integer giaBan,
                             @RequestParam("soLuong") Integer soLuong,
                             @RequestParam("idKH") Integer idKH) {
        // Tìm kiếm HoaDon và ChiTietSanPham
        HoaDon hoaDon = hdRepo.findById(idHD).orElse(null);
        ChiTietSanPham ctsp = ctspRepo.findById(idCTSP).orElse(null);

        if (hoaDon == null || ctsp == null) {
            // Xử lý lỗi nếu không tìm thấy HoaDon hoặc ChiTietSanPham
            return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH + "&error=HoaDonOrCTSPNotFound";
        }

        HoaDonChiTiet hdctTonTai = hdctRepo.findTop1ByChiTietSanPham_IdAndHoaDon_Id(idCTSP, idHD);

        if (hdctTonTai != null) {
            // Nếu sản phẩm đã tồn tại trong đơn hàng hiện tại
            int soLuongMoi = hdctTonTai.getSoLuongMua() + soLuong;
            hdctTonTai.setSoLuongMua(soLuongMoi);
            hdctTonTai.setTongTien(hdctTonTai.getGiaBan() * soLuongMoi);
            hdctTonTai.setNgaySua(LocalDateTime.now());
            hdctRepo.save(hdctTonTai);
        } else {
            // Nếu sản phẩm chưa tồn tại trong đơn hàng hiện tại
            HoaDonChiTiet newHdct = new HoaDonChiTiet();
            newHdct.setHoaDon(hoaDon);
            newHdct.setChiTietSanPham(ctsp);
            newHdct.setNgayTao(LocalDateTime.now());
            newHdct.setNgaySua(LocalDateTime.now());
            newHdct.setSoLuongMua(soLuong);
            newHdct.setGiaBan(giaBan);
            newHdct.setTrangThai("Chua thanh toan");
            newHdct.setTongTien(soLuong * giaBan);
            hdctRepo.save(newHdct);
        }

        // Cập nhật số lượng tồn kho của sản phẩm
        ctsp.setSoLuongTon(ctsp.getSoLuongTon() - soLuong);
        if (ctsp.getSoLuongTon() == 0) {
            ctsp.setTrangThai("Het hang");
        }
        ctspRepo.save(ctsp);

        return "redirect:/ban-hang/gio-hang?idHD=" + idHD + "&idKH=" + idKH;
    }
    @RequestMapping("/khach-hang")
    public String khachHang(){
        return "khach-hang/khachHang";
    }
}
