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
<div class="container mt-5">
    <h2 class="text-center">Them Khach Hang</h2>
    <form action="/khach-hang/add" method="post">
        <div class="mb-3 row">
            <label for="hoTen" class="col-sm-2 col-form-label">Ho ten:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="hoTen" name="hoTen" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="diaChi" class="col-sm-2 col-form-label">Dia chi:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="diaChi" name="diaChi" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="sdt" class="col-sm-2 col-form-label">SDT:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="sdt" name="sdt" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="trangThai" class="col-sm-2 col-form-label">Trang Thai:</label>
            <div class="col-sm-10">
                <select class="form-select" id="trangThai" name="trangThai" required>
                    <option value="Hoat dong">Hoat dong</option>
                    <option value="Ngung hoat dong">Ngung hoat dong</option>
                </select>
            </div>
        </div>
        <div class="mb-3 row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn btn-primary">Them khach hang</button>
            </div>
        </div>
    </form>
</div>

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
                <a href="/khach-hang/delete?idKH=${kh.id}" class="btn btn-danger">Xoa</a>
            </td>
        </tr>
    </c:forEach>

</table>
<div class="center">
    <nav aria-label="Page navigation example" name="pageNo">
        <ul class="pagination">
            <li class="page-item">
                <c:if test="${currentPage > 0}">
                    <a class="page-link" href="/khach-hang?pageNo=${currentPage - 1}">Previous</a>
                </c:if>
            </li>
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item ${i == currentPage + 1 ? 'active' : ''}">
                    <a class="page-link" href="/khach-hang?pageNo=${i - 1}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <c:if test="${currentPage < totalPage - 1}">
                    <a class="page-link" href="/khach-hang?pageNo=${currentPage + 1}">Next</a>
                </c:if>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>