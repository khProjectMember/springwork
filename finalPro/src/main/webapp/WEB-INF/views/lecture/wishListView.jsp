<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/wishListView.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>


    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
	 <jsp:include page="../common/header.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding: 5% 10%;">
            <h2>게시판</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${ not empty loginUser }">
           		<a class="btn btn-secondary" style="float:right" href="enrollForm.bo"">글쓰기</a>
            	<br>
            </c:if>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="b" items="${ list }">
	                    <tr>
	                        <td class="bno">${ b.boardNo }</td>
	                        <td>${ b.boardTitle }</td>
	                        <td>${ b.boardWriter }</td>
	                        <td>${ b.count }</td>
	                        <td>${ b.createDate }</td>
	                        <td>
	                        	<c:if test="${ not empty b.originName }">
	                        		★
	                        	</c:if>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            
            <!-- 상세페이지 -->
			<script>
				$(function(){
					$("#boardList>tbody>tr").click(function(){
						location.href='detail.bo?bno=' + $(this).children(".bno").text();
					})
				})
			</script>
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.nowPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.nowPage-1 }">Previous</a></li>
	                    </c:otherwise>
	                 </c:choose> 
	                 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endpage }">
	                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
	                 </c:forEach>
	                 <c:choose>   
	                 	<c:when test="${ pi.nowPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.nowPage+1 }">Next</a></li>
	                    </c:otherwise>
                     </c:choose>
                </ul>
            </div>

            <br clear="both"><br>

            <form id="searchForm" action="" method="Get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>            
        </div>
        <br><br>        
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>