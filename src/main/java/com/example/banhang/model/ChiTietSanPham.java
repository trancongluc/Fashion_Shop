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
@Table(name = "ctsp")
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_sp")
    private SanPham sanPham;
    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;
    @ManyToOne
    @JoinColumn(name = "id_size")
    private Size size;
    @Column(name = "gia_ban")
    private int giaBan;
    @Column(name = "so_luong_ton")
    private int soLuongTon;
    @Column(name = "trang_thai")
    private String trangThai;
    @Column(name = "ngay_tao")
    private LocalDateTime ngayTao;
    @Column(name = "ngay_sua")
    private LocalDateTime ngaySua;
}
