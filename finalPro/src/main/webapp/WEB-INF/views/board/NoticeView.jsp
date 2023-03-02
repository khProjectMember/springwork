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
	
	<%
		String keyvalue = "";
		String keyword = "";
		int nowPage;
		if(request.getParameter(keyvalue) != null) {
			keyvalue = request.getParameter("keyvalue");
			keyword = request.getParameter("keyword");
		}
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt((request.getParameter("nowPage")));
		}
	%>
	
	
	
	
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
                            <li><a href="#" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">커뮤니티</a></li>
                            <li><a href="#">공지사항/이벤트</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>공지사항 / 이벤트</h1>
                    <div class="search_box">
                        <div class="search">
                            <form class="search_arr" action="search.bo" method="get">
                                <select name="keyvalue" class="search_sel">
                                    <option value="search_all">전체</option>
                                    <option value="search_title">제목</option>
                                    <option value="search_content">내용</option>                            
                                </select>
                                <input type="text" name="keyword" class="search_input" placeholder="검색할 내용을 입력하세요.">
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
                            	<c:forEach var="notice" varStatus = "status" items="${ list }">
                           	                            	                           	                            	                            		                                
	                                <tr>	                                	                    		                   
	                                    <td class="noticeNo" >${ ( nlist.size() -status.index) - ((pi.nowPage - 1) * 10) }</td>											                                    	                                                           
	                                    <c:choose>
	                                    <c:when test="${ notice.noticeCatg eq 0}">
	                                    <td>공지사항</td>
	                                    </c:when>
	                                    <c:otherwise>
	                                    <td>이벤트</td>
	                                    </c:otherwise>
	                                    </c:choose>
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
	                                    	<li><a href="#">이전</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li><a href="${ url }?cpage=${ pi.nowPage-1 }">이전</a></li>
	                                    </c:otherwise>
	                                </c:choose>   
	                                    <c:forEach var="page" begin="${ pi.startPage }" end="${ pi.endpage }">
	                                    	<li><a href="javascript:paging(${ page });">${ page }</a></li>
	                                    </c:forEach>
	                                <c:choose>
	                                    <c:when test="${ pi.nowPage eq pi.maxPage }">                                                            
	                                    	<li><a href="#">다음</a></li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<li><a href="${ url }?cpage=${ pi.nowPage+1 }">다음</a></li>
	                                    	<form>
	                                    	</form>
	                                    </c:otherwise>
	                                </c:choose>                                                                                           
                                </ul>
                            </div>
                            <div class="pagin_box_thi">
                            	<c:if test="${ not empty loginUser and (loginUser.memNo eq 1 )}">
                                	<button class="text_box_button">게시글 작성</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form method="get" action="" class="submitFrm">
    	<input type="hidden" name="keyvalue" value="${ keyvalue }">
    	<input type="hidden" name="keyword" value="${ keyword }">
    	<input type="hidden" name="cpage" class = "cpage">
    </form>
    <jsp:include page="../common/footer.jsp" />
    
    <script type="text/javascript">
    	$('.text_box_button').click(function() {
    		console.log("안눌려용");
    		location.href='enroll.bo';
    	})
    	
    	function paging(num) {
    		var url = "${ url }";
    		$('.cpage').attr("value", num);
    		$('.submitFrm').attr("action", url).submit();
    	}
    </script>
</body>
</html>