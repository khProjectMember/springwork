<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 관리</title>
<style>
  	 
    .content2{
        width: 80%;
        margin: auto;
    }
    .innerOuter{
    	align: center;
        width: 80%;
        margin: auto;
        padding: 5% 10%;
        background:white;
    }
    #enrollForm>table{width: 100%; border: 1px solid lightgray; 
    background-color: rgb(247, 245, 245);}
    #enrollForm>table *{ margin:5px;}
</style>
</head>

<body>
<jsp:include page="../common/header.jsp" />
<div id="wrap">
<div id="content">
<div id="inner">
	<div class="content2">
	 	<div class="innerOuter">
            <h2>강사 관리</h2>
            <br>
            <form id="enrollForm" method="post" action="teainsert.te" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">강사이름</label></th>
                        <td><input class="form-control" name="teaName" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">나이</label></th>
                        <td><input class="form-control" name="teaAge" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강사정보(이력)</label></th>
                        <td><textarea class="form-control" name="teaInfo" rows="10" cols="50" style="resize:none" required ></textarea></td>
                    </tr>
                </table>
                	<!-- <input type="hidden" name="teaDate" class="form-control"> -->
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
	</div>
</div>
</div>
</div>
	<jsp:include page="../common/footer.jsp" />
</body>
 
</html>