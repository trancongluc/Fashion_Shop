<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/03/2024
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Ban Hang Tai Quay</title>
    <style>
        .table tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
    </style>
    <script>
        function handleRowClick(hdId) {
            // Ví dụ: điều hướng đến trang chi tiết hóa đơn
            window.location.href = `/hoa-don`;
        }
    </script>
</head>
<body>
<div>
    <h1 class="text-center">Ban Hang Tai Quay</h1>
</div>
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <table class="table" >
            <thead>
            <tr>
                <th>STT</th>
                <th>ID</th>
                <th>Ten khach hang</th>
                <th>DiaChi</th>
                <th>SDT</th>
                <th>Ngay tao</th>
                <th>Trang Thai</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hd" varStatus="i" items="${listHD}">
                <tr  >
                    <td>${i.index +1}</td>
                    <td>${hd.id}</td>
                    <td>${hd.khachHang.hoTen}</td>
                    <td>${hd.diaChi}</td>
                    <td>${hd.sdt}</td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.trangThai}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <h2>Gio Hang</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>DanhMuc</td>
                <td>MaSP</td>
                <td>TenSP</td>
                <td>MauSac</td>
                <td>Size</td>
                <td>So luong</td>
                <td>Gia ban</td>
                <td>Tong tien</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hdct" items="${listHDCT}" varStatus="i">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${hdct.id}</td>
                    <td>${hdct.chiTietSanPham.sanPham.tenSanPham}</td>
                    <td>${hdct.soLuongMua}</td>
                    <td>${hdct.giaBan}</td>
                    <td>${hdct.soLuongMua * hdct.giaBan}</td>
                    <td>
                        <a href="/hoa-don-chi-tiet/delete?idDelete=${hdct.id}" class="btn btn-danger"
                           type="submit">Xóa</a>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <h2>Tạo hoá đơn</h2>
        <div class="row">
            <form action="/search" method="get">
                <div>
                    <div>
                        <label class="mb-3 col-3">So dien thoai</label>
                        <input type="text" class="col-7" name="tkSdt" value="${tk}">
                    </div>
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </form>
            <form action="/hoa-don" method="post">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <select name="kh" class="col-7">
                        <c:forEach var="kh" items="${listKH}">
                            <c:if test="${kh.id eq param.tkKH}">
                                <option value="${kh.id}" selected>${kh.hoTen}</option>
                            </c:if>
                            <c:if test="${kh.id ne param.tkKH}">
                                <option value="${kh.id}">${kh.hoTen}</option>
                            </c:if>
                        </c:forEach>
                    </select>


                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" name="idHoaDon" readonly  value="${hdDetail.id}">
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly name="tongTien" value="${tongTien}">
                </div>
                <div>
                    <button class="btn btn-primary" type="submit" >Tạo hoá đơn</button>
                    <button class="btn btn-primary" type="submit" >Thanh toán</button>
                </div>
            </form>

        </div>

    </div>

</div>
<div>
    <h2>Danh Sach Chi Tiet San Pham</h2>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>DanhMuc</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="i" items="${listCTSP}" var="ctsp">
            <tr onclick="handleRowClick(${ctsp.id})">
                <td>${i.index+1}</td>
                <td>${ctsp.sanPham.danhMuc.tenDanhMuc}</td>
                <td>${ctsp.id}</td>
                <td>${ctsp.sanPham.tenSP}</td>
                <td>${ctsp.mauSac.tenMau}</td>
                <td>${ctsp.size.tenSize}</td>
                <td>${ctsp.giaBan}</td>
                <td>${ctsp.soLuongTon}</td>
                <td>${ctsp.trangThai} </td>
                <td>
                    <a href="/hoa-don-chi-tiet/add?idctsp=${ctsp.id}" class="btn btn-primary">Chọn mua</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
