<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/review.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	 <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="#" class="nav_a"><img src="../img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">커뮤니티</a></li>
                            <li><a href="#">수강생 후기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>수강생 후기</h1>
                    <div class="search_box">
                        <div class="search">
                            <form class="search_arr" action="" method="">
                                <select name="" id="" class="search_sel">
                                    <option value="전체">전체</option>
                                    <option value="체육">체육</option>
                                    <option value="인문학">인문학</option>
                                    <option value="요리">요리</option>
                                    <option value="예능">예능</option>
                                </select>
                                <input type="text" name="" class="search_input" placeholder="검색할 내용을 입력하세요.">
                                <button type="submit" class="search_btn" >검색</button>
                            </form>                            
                        </div>
                    </div>
                    <div class="board_type">
                        <div class="type">
                            <ul>
                                <li><a href="">최신순</a></li>
                                <li><a href="">조회순</a></li>
                                <li><a href="">추천순</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="table_box">
                        <table>
                            <colgroup>
                                <col style="display: none;">
                                <col style="width: 100px;">
                                <col style="width: 180px;">
                                <col style="width: 80px;">
                                <col style="width: auto;">
                                <col style="width: 80px;">
                                <col style="width: 180px;">
                                <col style="width: 80px">
                                <col style="width: 80px">
                            </colgroup>
                            <thead>
                            
                                <tr>
                                    <th style="display: none;">번호</th>
                                    <th>카테고리</th>
                                    <th>강의명</th>
                                    <th>평점</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                    <th>추천수</th>
                                </tr>
                            </thead>
                            <tbody>
	                            <c:forEach var="review" varStatus="status" items="${ list }">                                
	                                <tr>
	                                    <td style="display: none;">${ review.revNo }</td>
	                                    <td>${ review.revCatg }</td>
	                                    <td>${ review.l.lecName }</td>
	                                    <td>${ review.revStar }</td>
	                                    <td class="subject"><a href="">${ review.revTitle }</a></td>
	                                    <td>${ review.m.memNickname }</td>
	                                    <td>${ review.revDate }</td>
	                                    <td>${ review.revCount }</td>
	                                    <td>${ review.revRec }</td>
	                                </tr>
	                            </c:forEach>                                
                            </tbody>
                        </table>
                    </div>
                    <div class="pagin">
                        <div class="pagin_box">
                            <div class="pagin_box_fir"></div>
                            <div class="pagin_box_sec">
                                <ul>
                                	<c:choose>
	                                	<c:when test="${ pi.nowPage eq 1 }">
	                                    	<li><a href="#">이전</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li><a href="review.bo?rpage=${ pi.nowPage-1 }">이전</a></li>
	                                    </c:otherwise>
	                                </c:choose>   
	                                    <c:forEach var="page" begin="${ pi.startPage }" end="${ pi.endpage }">
	                                    	<li><a href="review.bo?rpage=${ page }">${ page }</a></li>
	                                    </c:forEach>
	                                <c:choose>
	                                    <c:when test="${ pi.nowPage eq pi.maxPage }">                                                            
	                                    	<li><a href="#">다음</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li><a href="review.bo?rpage=${ pi.nowPage+1 }">다음</a></li>
	                                    </c:otherwise>
	                                </c:choose>                                                        
                                </ul>
                            </div>
                            <div class="pagin_box_thi">
                                <button>게시글 작성</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    /* 
    	$(function() {
    		basicReviewList();
    	})
    	
    	function basicReviewList() {
    		$.ajax({
    			url: "selectReviewList.bo",
    			success: function(list) {
    				console.log("성공");
    				console.log(list);
    				let value = "";
    				for(let i in list) {
    					value += "<tr>"
    						  +		"<td style='display: none;'>" + list[i].revNo + "</td>"
    						  +		"<td>" + list[i].revCatg + "</td>"
    						  +		"<td>" + list[i].l.lecName + "</td>"
    						  +		"<td>" + list[i].revStar + "</td>"
    						  +		"<td>" + list[i].revTitle + "</td>"
    						  +		"<td>" + list[i].m.memNickname + "</td>"
    						  +		"<td>" + list[i].revDate + "</td>"
    						  +		"<td>" + list[i].revCount + "</td>"
    						  +		"<td>" + list[i].revRec + "</td>"
    						  +	 "</tr>";
    				}
    				$('.table_box>table>tbody').empty();
    				$('.table_box>table>tbody').html(value);
    			},
    			error: function() {
    				console.log("실패");
    			}	
    		}) 
    	} */
    </script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>