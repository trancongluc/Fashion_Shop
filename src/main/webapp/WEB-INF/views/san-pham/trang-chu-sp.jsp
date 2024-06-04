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
    <title>Ban Hang</title>

</head>
<body class="container">
<h1 class="text-center">San Pham</h1>
<form action="/add-sp" method="post">
    <div class="mb-3">
        <label>Ma san pham:</label>
        <input type="text" name="maSP" class="form-control">
    </div>
    <div class="mb-3">
        <label>Ten san pham:</label>
        <input type="text" name="tenSP" class="form-control">
    </div>
    <div class="mb-3">
        <label>Danh muc:</label>
        <select name="danhMuc" class="form-control">
            <c:forEach var="dm" items="${listDM}">
                <option value="${dm.id}">${dm.tenDanhMuc}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label>Trang thai: </label>
        <input type="radio" name="trangThai" class="form-check-input" value="Con hang"> Con hang
        <input type="radio" name="trangThai" class="form-check-input" value="Het hang"> Het hang
    </div>
    <button class="btn btn-success" type="submit">ADD</button>
</form>
<h1>DANH SACH SAN PHAM</h1>
<table class="table">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>MaSP</th>
        <th>TenSP</th>
        <th>NgayTao</th>
        <th>Ma danh muc</th>
        <th>Ten danh muc</th>
        <th>Trang thai</th>
        <th>CHUC NANG</th>
    </tr>
    <c:forEach var="sp" varStatus="i" items="${page.content}">
        <tr>
            <td>${i.index +1}</td>
            <td>${sp.id}</td>
            <td>${sp.maSP}</td>
            <td>${sp.tenSP}</td>
            <td>${sp.ngayTao}</td>
            <td>${sp.danhMuc.maDanhMuc}</td>
            <td>${sp.danhMuc.tenDanhMuc}</td>
            <td>${sp.trangThai}</td>
            <td>
                <a href="/san-pham/detail?idSP=${sp.id}" class="btn btn-primary">Chi tiet</a>
                <a href="/san-pham/delete?idSP=${sp.id}" class="btn btn-danger">Xoa</a>
            </td>
        </tr>
    </c:forEach>

</table>
<a href="/trang-chu-sp?pageNo=0 ">|&lt; </a>
<a href="/trang-chu-sp?pageNo=${page.number-1}"> &lt;&lt; </a>
<a href="/trang-chu-sp?pageNo=${page.number+1}"> &gt; &gt; </a>
<a href="/trang-chu-sp?pageNo=${page.totalPages-1}"> &gt;| </a>


</body>
</html>