package com.example.banhang.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hdct")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;
    @ManyToOne
    @JoinColumn(name = "id_ctsp")
    private ChiTietSanPham chiTietSanPham;
    @Column(name = "so_luong_mua")
    private int soLuongMua;
    @Column(name = "gia_ban")
    private int giaBan;
    @Column(name = "tong_tien")
    private int tongTien;
    @Column(name = "trang_thai")
    private String trangThai;
    @Column(name = "ngay_tao")
    private LocalDateTime ngayTao;
    @Column(name = "ngay_sua")
    private LocalDateTime ngaySua;

}
