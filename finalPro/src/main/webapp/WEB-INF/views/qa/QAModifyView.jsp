<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>樂受文化 악수문화센터</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/QAModify.css">


</head>
<body>
<jsp:include page="../common/header.jsp" />   
<form method="POST" name="updateFrm" action="updatePost.bo" style="padding-left:500px;margin-top:50px;" class="updatefr">
		<table align="center" width="600">
			<tr>
				<td></td>
				<td><input type="hidden" name="qnaNo" size="30" value="${qna.qnaNo}"></td>
			</tr>
			<div>		
				<tr>
					<td>제목</td>
					<td><input name="qnaTitle" size="30" value="${qna.qnaTitle}"></td>
				</tr>
			</div>	
			<tr>
				<td>내용</td>
				<td><textarea name="qnaContent" rows="10" cols="65">${qna.qnaContent}</textarea></td>
			</tr>			
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="padding-left:300px;">
				
					<input type="submit" value="수정완료" style="padding:10px;color:white;background:black;border:none;">&emsp;
					<a href="sendQa.qa"></a><input type="reset" value="초기화" style="padding:10px;color:white;background:black; border:none;">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1);" style="padding:10px;color:white;background:red; border:none;">
				</td>
			</tr>			
		</table>
		<input type="hidden" name="qnaNo" value="${qna.qnaNo}">		
	</form>
<script>
	
</script> 		  
<jsp:include page="../common/footer.jsp" />   
</body>
</html>