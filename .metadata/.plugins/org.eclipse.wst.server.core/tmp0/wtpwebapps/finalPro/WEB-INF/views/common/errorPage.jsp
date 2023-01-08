<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>

    <br>
    <div align="center">
        <img src="https://cdn-icons-png.flaticon.com/512/4522/4522205.png">
        <br><br>
        <!--에러 문구 넣을 곳-->
        <h1 style="font-weight:bold">${ errorMsg }</h1>
    </div>
    <br>

    <jsp:include page="footer.jsp" />
</body>
</html>