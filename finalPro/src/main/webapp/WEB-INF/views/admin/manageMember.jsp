<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
  	 
    .content2{
        width: 100%;
        margin: auto;
    }
    .innerOuter{
    	align: center;
        width: 100%;
        margin: auto;
        padding: 5% 5%;
        background:white;
    }
   		#MemberList{text-align: center;}
        #MemberList>tbody>tr:hover{cursor: pointer;}
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
						<h2>회원 목록</h2>
						<br>

						<table id="MemberList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>번호</th>
									<th>회원이름</th>
									<th>회원아이디</th>
									<th>회원닉네임</th>
									<th>성별</th>
									<th>생년월일</th>
									<th>회원생성일자</th>
									<th>차량번호</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="m" items="${ list }">
									<tr>
										<td class="mno">${ m.memNo}</td>
										<td>${m.memName}</td>
										<td>${m.memId}</td>
										<td>${m.memNickname}</td>
										<td>${m.memGender}</td>
										<td>${m.memBirthday}</td>
										<td>${m.memCdate}</td>
										<td>${m.memCarno}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<!-- 상세페이지 -->
						<script>
							$(function() {
								$("#MemberList>tbody>tr").click(
										function() {
											location.href = 'detail.me?mno='
													+ $(this).children(".mno")
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
											href="alist.me?cpage=${ pi.nowPage-1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endpage }">
									<li class="page-item"><a class="page-link"
										href="alist.me?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								<c:choose>
									<c:when test="${ pi.nowPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="alist.me?cpage=${ pi.nowPage+1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>

						<br clear="both"> <br>

						<form id="searchForm" action="" method="Get" align="center">
							<div class="select">
								<select class="custom-select" name="condition">
									<option value="name">이름</option>
									<option value="nickname">닉네임</option>
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