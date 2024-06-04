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
    <title>San Pham Detail</title>

</head>
<body class="container">
<h1 class="text-center">San Pham Detail</h1>
<form action="/san-pham/update?idSP=${spDetail.id}" method="post">
    <div class="mb-3">
        <label>Ma san pham:</label>
        <input type="text" name="maSP" class="form-control" value="${spDetail.maSP}">
    </div>
    <div class="mb-3">
        <label>Ten san pham:</label>
        <input type="text" name="tenSP" class="form-control" value="${spDetail.tenSP}">
    </div>
    <div class="mb-3">
        <label>Danh muc:</label>
        <select name="danhMuc" class="form-control" >
            <c:forEach var="dm" items="${listDM}">
                <option value="${dm.id}"
                        <c:if test="${dm.id == spDetail.danhMuc.id}">selected</c:if>
                >${dm.tenDanhMuc}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label>Trang thai: </label>
        <input type="radio" name="trangThai" class="form-check-input" value="Con hang"
               <c:if test="${spDetail.trangThai =='Con hang'}">checked</c:if>
        > Con hang
        <input type="radio" name="trangThai" class="form-check-input" value="Het hang"
               <c:if test="${spDetail.trangThai =='Het hang'}">checked</c:if>> Het hang
    </div>
    <button class="btn btn-success" type="submit">Update</button>
</form>

</body>
</html>