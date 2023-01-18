<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   		#TeacherList{text-align: center;}
        #TeacherList>tbody>tr:hover{cursor: pointer;}
        #pagingArea{width:fit-content; margin: auto;}       
        #searchForm{
            width: 80%;
            margin: auto;
        }
        #searchForm>*{
            float:left;
            margin:5px;
        }
        .select{width:20%; }
        .text{width:53%; }
        .searchBtn{width: 20%; }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

	<div id="wrap">
		<div id="content">
			<div id="inner">
				<div class="content2">
					<div class="innerOuter">
						<h2>강좌목록 관리</h2>
						<br>

						<table id="TeacherList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>번호</th>
									<th>강사이름</th>
									<th>나이</th>
									<th>등록일자</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="t" items="${ list }">
									<tr>
										<td class="tno">${ t.teaNo }</td>
										<td>${ t.teaName }</td>
										<td>${ t.teaAge }</td>
										<td>${ t.teaEdate}</td>
										<td>${ t.teaStatus}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<!-- 상세페이지 -->
						<script>
							$(function() {
								$("#TeacherList>tbody>tr").click(
										function() {
											location.href = 'detail2.le?tno='
													+ $(this).children(".tno")
															.text();
										})
							})
						</script>
						<div id="pagingArea">
							<ul class="pagination">
								<c:choose>
									<c:when test="${ pi.nowPage eq 1 }">
										<li class="page-item disabled"><a class="page-link"
											href="#">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="list.te?cpage=${ pi.nowPage-1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endpage }">
									<li class="page-item"><a class="page-link"
										href="list.te?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								<c:choose>
									<c:when test="${ pi.nowPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="list.te?cpage=${ pi.nowPage+1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>

						<br clear="both"> <br>

						<form id="searchForm" action="" method="Get" align="center">
							<div class="select">
								<select class="custom-select" name="condition">
									<option value="writer">강사이름</option>
									<option value="title">상태</option>
								</select>
							</div>
							<div class="text">
								<input type="text" class="form-control" name="keyword">
							</div>
							<button type="submit" class="searchBtn btn btn-secondary">검색</button>
						</form>
						<br> <br>

					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>