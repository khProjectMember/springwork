<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   		#HangoutList{text-align: center;}
        #HangoutList>tbody>tr:hover{cursor: pointer;}
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
						<h2>모임게시판 관리</h2>
						<br>

						<table id="HangoutList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성날짜</th>
									<th>모집현황</th>
									<th>조회수</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="h" items="${ list }">
									<tr>
										<td class="hangoutNo">${ h.hangoutNo}</td>
										<td><a href="meetingDetail.bo?hangoutNo=${h.hangoutNo}">${h.hangoutTitle}</a></td>
										<td>${h.m.memNickname }</td>
										<td>${h.hangoutEdate}</td>
										<td>${h.hangoutNowCount} / ${h.hangoutJoinCount}</td>
										<td>${h.hangoutViewCount}</td>
										<td><input name = "selectDelete" type = "checkbox" value = "${h.hangoutNo }"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<c:if test="${not empty loginUser and loginUser.isAdmin eq 'Y' }">
						<input type = "button" value = "삭제" class = "btn btn-outline-danger" onclick="deleteValue();">
						</c:if>
						<!-- 상세페이지 -->
					<!-- 	<script>
							$(function() {
								$("#HangoutList>tbody>tr").click(
										function() {
											location.href = 'meetingDetail.bo?hangoutNo=1'
													+ $(this).children(".hno")
															.text();
										})
							})
						</script> -->
						<script>
								
								function deleteValue() {
									var deleteArr = new Array(); //삭제할  리스트
									var list = $("input[name='selectDelete']"); //체크된 리스트
									//console.log(list);
									for(var i = 0; i < list.length; i++) {
										if(list[i].checked) {
											deleteArr.push(list[i].value); //boardId 값 들어감
											//console.log(deleteArr);
										}
									}
									if(deleteArr.length == 0) {
										alert('선택된 글이 없습니다.');
									} else {
										var msg = confirm("정말  삭제하시겠습니까?");
										$.ajax({
											url: "${contextPath}/spring/deleteHangout.ad",
											type: 'POST',
											data: {
												deleteArr: deleteArr
											},
											success: function(data) {
												alert("삭제했습니다.");
												history.go(0);
											}
										});
									}
								}
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
											href="hlist.ad?cpage=${ pi.nowPage-1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endpage }">
									<li class="page-item"><a class="page-link"
										href="hlist.ad?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								<c:choose>
									<c:when test="${ pi.nowPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="hlist.ad?cpage=${ pi.nowPage+1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>

						<br clear="both"> <br>

						<form id="searchForm" action="" method="Get" align="center">
							<div class="select">
								<select class="custom-select" name="condition">
									<option value="writer">작성자</option>
									<option value="title">제목</option>
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