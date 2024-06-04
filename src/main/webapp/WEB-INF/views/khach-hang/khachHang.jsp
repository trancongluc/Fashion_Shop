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
    <title>Khach Hang</title>

</head>
<body class="container">


<h1 class="text-center">DANH SACH KHACH HANG</h1>
<table class="table">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>HoTen</th>
        <th>DiaChi</th>
        <th>SDT</th>
        <th>NgayTao</th>
        <th>Trang thai</th>
        <th>CHUC NANG</th>
    </tr>
    <c:forEach var="kh" varStatus="i" items="${listKH}">
        <tr>
            <td>${i.index +1}</td>
            <td>${kh.id}</td>
            <td>${kh.hoTen}</td>
            <td>${kh.diaChi}</td>
            <td>${kh.sdt}</td>
            <td>${kh.ngayTao}</td>
            <td>${kh.trangThai}</td>
            <td>
                <a href="" class="btn btn-primary">Chi tiet</a>
                <a href="" class="btn btn-danger">Xoa</a>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>