<!doctype html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Hoa Don Chi Tiet</title>
</head>
<body class="container">
<h1 class="text-center">DANH SACH HOA DON</h1>
<table class="table">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>TenKhachHang</th>
        <th>DiaChi</th>
        <th>SDT</th>
        <th>NgayTao</th>
        <th>Trang thai</th>
        <th>CHUC NANG</th>
    </tr>
    <c:forEach var="hd" varStatus="i" items="${listHD}">
        <tr>
            <td>${i.index +1}</td>
            <td>${hd.id}</td>
            <td>${hd.khachHang.hoTen}</td>
            <td>${hd.khachHang.diaChi}</td>
            <td>${hd.khachHang.sdt}</td>
            <td>${hd.ngayTao}</td>
            <td>${hd.trangThai}</td>
            <td>
                <a href="/hoa-don-chi-tiet?idHD=${hd.id}" class="btn btn-primary">Chi tiet</a>
                <a href="" class="btn btn-danger">Xoa</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="center">
    <nav aria-label="Page navigation example" name="pageNo">
        <ul class="pagination">
            <li class="page-item">
                <c:if test="${currentPage > 0}">
                    <a class="page-link" href="/hoa-don?pageNo=${currentPage - 1}">Previous</a>
                </c:if>
            </li>
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item ${i == currentPage + 1 ? 'active' : ''}">
                    <a class="page-link" href="/hoa-don?pageNo=${i - 1}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <c:if test="${currentPage < totalPage - 1}">
                    <a class="page-link" href="/hoa-don?pageNo=${currentPage + 1}">Next</a>
                </c:if>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>