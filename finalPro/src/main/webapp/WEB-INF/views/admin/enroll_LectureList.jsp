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
   		#lectureList{text-align: center;}
        #lectureList>tbody>tr:hover{cursor: pointer;}
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

						<table id="LectureList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th>번호</th>
									<th>강의명</th>
									<th>강사이름</th>
									<th>강의기간</th>
									<th>강의시간</th>
									<th>강의횟수</th>
									<th>강의 분류</th>
									<th>강의가격</th>
									<th>평점</th>
									<th>인원현황</th>
									<th>강의실</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="l" items="${ list }">
									<tr>
										<td class="lno">${ l.lecNo }</td>
										<td>${l.lecName}</td>
										<td>${l.teacher.teaName }</td>
										<td>${l.lecSdate} ~ ${l.lecEdate}</td>
										<td>${l.lecStime} ~ ${l.lecEtime}</td>
										<td>${l.lecCount}</td>
										<td>${l.lecBcatg}  -${l.lecScatg}</td>
										<td>${l.lecPrice}</td>
										<td>${l.lecGrade}</td>
										<td>여기에 접수인원 카운트/${l.lecCnum}</td>
										<td>${l.lectureLocation.locName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<!-- 상세페이지 -->
						<script>
							$(function() {
								$("#LectureList>tbody>tr").click(
										function() {
											location.href = 'detail.le?lno='
													+ $(this).children(".lno")
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
											href="list2.le?cpage=${ pi.nowPage-1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endpage }">
									<li class="page-item"><a class="page-link"
										href="list2.le?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								<c:choose>
									<c:when test="${ pi.nowPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="list2.le?cpage=${ pi.nowPage+1 }">Next</a></li>
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