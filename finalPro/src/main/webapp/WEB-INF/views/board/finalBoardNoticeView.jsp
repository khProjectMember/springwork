<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="#" class="nav_a"><img src="../img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">커뮤니티</a></li>
                            <li><a href="#">공지사항/이벤트</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>공지사항 / 이벤트</h1>
                    <div class="search_box">
                        <div class="search">
                            <form class="search_arr" action="" method="">
                                <select name="" id="" class="search_sel">
                                    <option value="전체">전체</option>
                                    <option value="공지사항">공지사항</option>
                                    <option value="이벤트">이벤트</option>
                                </select>
                                <input type="text" name="" class="search_input" placeholder="검색할 내용을 입력하세요.">
                                <button type="submit" class="search_btn" >검색</button>
                            </form>                            
                        </div>
                    </div>
                    <div class="table_box">
                        <table>
                            <colgroup>
                                <col style="width: 80px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                                <col style="width: 140px;">
                                <col style="width: 140px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="notice" items="${ list }">                                
	                                <tr>
	                                    <td class="noticeNo" >${ notice.noticeNo }</td>
	                                    <td>${ notice.noticeCatg }</td>
	                                    <td class="subject"><a href="detail.bo?noticeNo=${ notice.noticeNo }">${ notice.noticeTitle }</a></td>
	                                    <td>${ notice.m.memNickname }</td>
	                                    <td>${ notice.edate }</td>
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
	                                    	<li class="pageitem disabled"><a href="#">이전</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li class="pageitem"><a href="notice.bo?cpage=${ pi.nowPage-1 }">이전</a></li>
	                                    </c:otherwise>
	                                </c:choose>   
	                                    <c:forEach var="page" begin="${ pi.startPage }" end="${ pi.endpage }">
	                                    	<li class="pageitem" ><a href="notice.bo?cpage=${ page }">${ page }</a></li>
	                                    </c:forEach>
	                                <c:choose>
	                                    <c:when test="${ pi.nowPage eq pi.maxPage }">                                                            
	                                    	<li class="pageitem disabled"><a href="#">다음</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li class="pageitem"><a href="notice.bo?cpage=${ pi.nowPage+1 }">다음</a></li>
	                                    </c:otherwise>
	                                </c:choose>                                                                                           
                                </ul>
                            </div>
                            <div class="pagin_box_thi">
                                <button class="text_box_button">게시글 작성</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    
    <script type="text/javascript">
    	$('.text_box_button').click(function() {
    		console.log("안눌려용");
    		location.href='enroll.bo';
    	})
    </script>
    
    
</body>
</html>