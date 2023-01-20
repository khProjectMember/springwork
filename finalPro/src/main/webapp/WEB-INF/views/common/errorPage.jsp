<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <jsp:include page="header.jsp"/>

    <br>
    <div align="center">
        <img src="resources/img/error.png">
        <br><br>
        <!--에러 문구 넣을 곳-->
        <h1 style="font-weight:bold">${ errorMsg }</h1>
    </div>
    <br>

    <jsp:include page="footer.jsp"/>
</body>
</html>