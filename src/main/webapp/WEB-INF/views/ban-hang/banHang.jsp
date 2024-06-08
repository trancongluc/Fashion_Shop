<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/03/2024
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<link href="/path/to/bootstrap.min.css" rel="stylesheet">

<html>
<head>
    <title>Ban Hang Tai Quay</title>
    <style>


        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 300px; /* Set the width to be smaller */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function showQuantityForm(idCTSP, giaBan) {
            document.getElementById('idCTSP').value = idCTSP;
            document.getElementById('giaBan').value = giaBan;
            document.getElementById('quantityModal').style.display = 'block';
        }

        function showDeleteModal(idHDCT, idCTSP) {
            document.getElementById('deleteIdHDCT').value = idHDCT;
            document.getElementById('deleteIdCTSP').value = idCTSP;

            var myModal = new bootstrap.Modal(document.getElementById('deleteModal'), {
                keyboard: false
            });
            myModal.show();
        }

        function submitForm() {
            document.getElementById('addGioHang').submit();

        }

        function closeModal() {
            document.getElementById('quantityModal').style.display = 'none';

        }

    </script>
</head>
<body>
<h1 class="text-center">Ban Hang Tai Quay</h1>
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <form method="post" action="/ban-hang/addHoaDon">
            <div class="col-5">
                <input type="hidden" name="idKH" value="">
                <button type="submit" class="btn btn-primary">Tao Hoa Don</button>
                <a href="/hoa-don" class="btn btn-warning" >Xem Hoa Don</a>
            </div>
        </form>

        <form id="hoaDonForm" method="get" action="/ban-hang/gio-hang">
            <input type="hidden" name="idHD" id="idHD" value="">
            <input type="hidden" name="idKH" id="idKH" value="">
        </form>

        <table class="table table-hover">
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
                <tr onclick="document.getElementById('idHD').value=${hd.id};document.getElementById('idKH').value=${hd.khachHang.id}; document.getElementById('hoaDonForm').submit(); ">
                    <td>${i.index +1}</td>
                    <td>${hd.id}</td>
                    <td>${hd.khachHang.hoTen}</td>
                    <td>${hd.khachHang.diaChi}</td>
                    <td>${hd.khachHang.sdt}</td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.trangThai}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <h2>Gio Hang</h2>
        <table class="table" id="tableGioHang">
            <thead>
            <tr>
                <th>STT</th>
                <th>DanhMuc</th>
                <th>IDCTSP</th>
                <th>MaSP</th>
                <th>TenSP</th>
                <th>MauSac</th>
                <th>Size</th>
                <th>So luong</th>
                <th>Gia ban</th>
                <th>Tong tien</th>
                <th>Chuc nang</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hdct" items="${listHDCT}" varStatus="i">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${hdct.chiTietSanPham.sanPham.danhMuc.tenDanhMuc}</td>
                    <td>${hdct.chiTietSanPham.id}</td>
                    <td>${hdct.chiTietSanPham.sanPham.maSP}</td>
                    <td>${hdct.chiTietSanPham.sanPham.tenSP}</td>
                    <td>${hdct.chiTietSanPham.mauSac.tenMau}</td>
                    <td>${hdct.chiTietSanPham.size.tenSize}</td>
                    <td>${hdct.soLuongMua}</td>
                    <td>${hdct.giaBan}</td>
                    <td>${hdct.soLuongMua * hdct.giaBan}</td>
                    <td>
                        <button class="btn btn-danger" type="button"
                                onclick="showDeleteModal(${hdct.id}, ${hdct.chiTietSanPham.id})">Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Xóa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h3>Điền số lượng sản phẩm muốn xóa</h3>
                        <form method="get" action="/ban-hang/gio-hang/delete">
                            <input type="hidden" name="idHDCT" id="deleteIdHDCT" value="">
                            <input type="hidden" name="idHD" value="${idHD}">
                            <input type="hidden" name="idKH" value="${idKH}">
                            <input type="hidden" name="idCTSP" id="deleteIdCTSP" value="">
                            <label for="soLuongXoa">Số lượng:</label>
                            <input type="number" id="soLuongXoa" name="soLuongXoa" min="1" required/>
                            <button type="submit" class="btn btn-danger">Xác nhận xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-5">
        <h2 class="text-center">Tai quay</h2>
        <div class="row">
            <form action="/ban-hang/tkKH" method="get">
                <input type="hidden" name="idHD" value="${idHD}">
                                <input type="hidden" name="idKH" value="${idKH}">
                <div>
                    <div>
                        <label class="mb-3 col-3">So dien thoai</label>
                        <input type="text" class="col-7" name="tkKH" value="${sdtTK}">
                    </div>
                    <p class="text-danger">${erro}</p>
                    <button class="btn btn-primary" type="submit">Search</button>
                    <a href="/khach-hang" class="btn btn-info">Thêm Khách Hàng</a>
                </div>
            </form>
            <form action="/ban-hang/thanh-toan" method="get">
                <input type="hidden" name="idHD" value="${idHD}">
                <input type="hidden" name="idHDCT" value="${idHDCT}">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <select name="kh" class="col-7">
                        <c:forEach var="kh" items="${listKH}">
                            <option value="${tkKH.id}"
                                    <c:if test="${kh.id == idKH}">selected</c:if>
<%--                                    <c:if test="${kh.sdt == tkKH.sdt}">selected</c:if> --%>
                            >${kh.hoTen}</option>
                        </c:forEach>
                    </select>

                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" name="idHoaDon" id="idHoaDon" readonly value="${idHD}">
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly name="tongTien" id="tongTien" readonly
                           value="${tongTien}">
                </div>
                <div>

                    <button class="btn btn-primary" type="submit">Thanh toán</button>
                </div>
            </form>

        </div>

    </div>

</div>
<div>
    <h2>Danh Sach Chi Tiet San Pham</h2>

    <%--                <form method="post" action="/ban-hang/gio-hang/add" id="addGioHang">--%>
    <%--                    <input type="hidden" name="idCTSP" id="idCTSP" value="">--%>
    <%--                    <input type="hidden" name="idHDInput" value="${idHD}">--%>
    <%--                    <input type="hidden" name="giaBan" id="giaBan" value="">--%>
    <%--                    <label for="soLuong">Số lượng:</label>--%>
    <%--                    <input type="number" id="soLuong" name="soLuong" min="1" required />--%>
    <%--                    <button type="submit">Thêm vào giỏ hàng</button>--%>
    <%--                </form>--%>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>DanhMuc</th>
            <th>ID CTSP</th>
            <th>Ten san pham</th>
            <th>Mau sac</th>
            <th>Size</th>
            <th>Gia ban</th>
            <th>So luong ton</th>
            <th>Trang Thai</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="i" items="${listCTSP}" var="ctsp">
            <tr onclick="showQuantityForm(${ctsp.id}, ${ctsp.giaBan}) ">
                <td>${i.index+1}</td>
                <td>${ctsp.sanPham.danhMuc.tenDanhMuc}</td>
                <td>${ctsp.id}</td>
                <td>${ctsp.sanPham.tenSP}</td>
                <td>${ctsp.mauSac.tenMau}</td>
                <td>${ctsp.size.tenSize}</td>
                <td>${ctsp.giaBan}</td>
                <td>${ctsp.soLuongTon}</td>
                <td>${ctsp.trangThai} </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

    <div id="quantityModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3 class="text-center">Điền số lượng SPCT:</h3>
            <form method="post" action="/ban-hang/gio-hang/add" id="addGioHang" class="text-center">
                <input type="hidden" name="idCTSP" id="idCTSP" value="">
                <input type="hidden" name="idHDInput" value="${idHD}">
                <input type="hidden" name="idKH" value="${idKH}">
                <input type="hidden" name="giaBan" id="giaBan" value="">
                <label for="soLuong">Số lượng:</label>
                <input type="number" id="soLuong" name="soLuong" min="1" required/>
                <br>
                <button type="button" onclick="submitForm()" class="btn btn-success">Them</button>
            </form>
        </div>
    </div>
</div>


</body>

</html>
