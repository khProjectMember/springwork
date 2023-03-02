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
									<th></th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="l" items="${ list }">
									<tr>
										<td class="lecNo">${ l.lecNo }</td>
										<td><a href="detail.le?lecNo=${l.lecNo}">${l.lecName}</a></td>
										<td>${l.teacher.teaName }</td>
										<td>${l.lecSdate} ~ ${l.lecEdate}</td>
										<td>${l.lecStime} ~ ${l.lecEtime}</td>
										<td>${l.lecCount}</td>
										<td>${l.lecBcatg}  -${l.lecScatg}</td>
										<td>${l.lecPrice}</td>
										<td>${l.lecGrade}</td>
										<td> 카운트/${l.lecCnum}</td>
										<td>${l.lectureLocation.locName}</td>
										<td><input name = "selectDelete" type = "checkbox" value = "${l.lecNo }"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<div class="pagin_box_thi">
							 <c:if test="${not empty loginUser and loginUser.isAdmin eq 'Y' }">
                                <button class="text_box_button">강의추가</button>
                                <button class="text_box_button2" onclick="deleteValue();">강의삭제</button>
                               </c:if>
                            </div>
                           
                            <form method="post" class="postForm_le">
						    	<input type="hidden" name="lecNo" value="${ l.lecNo }">
						    	<input type="hidden" name="filePath" value="${ l.lecFilename}">
						    </form>
                       <script type="text/javascript">
					    	$('.text_box_button').click(function() {
					    		console.log("안눌려용");
					    		location.href='enrollForm.le';
					    	})
					    	/* $('.text_box_button3').click(function() {
					    		console.log("안눌려용");
					    		location.href='updateForm.le';
					    	}) */
					    	function postFormSubmit(num){
								if(num == 1){
									$(".postForm_le").attr("action","updateForm.le").submit();
								} 
							}
					    </script>
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
											url: "${contextPath}/spring/deleteLecture.ad",
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
						<!-- 상세페이지 -->
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