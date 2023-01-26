<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/noticedetail.css">

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	
</head>
<body>
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
                    <div class="detailbox">
                        <div class="detail_info">
                            <div class="detail_cate">
                             <c:choose>
	                                    <c:when test="${ notice.noticeCatg eq 0}">
	                                    <span>공지사항</span>
	                                    </c:when>
	                                    <c:otherwise>
	                                    <span>이벤트</span>
	                                    </c:otherwise>
	                         </c:choose>
                            </div>
                            <div class="detail_title">
                                <span>${ notice.noticeTitle }</span>
                            </div>
                            <div class="detail_nick">
                                <span>${ notice.m.memNickname }</span>
                            </div>
                            <div class="detail_date">                                
                                <span>${ notice.edate }</span>
                            </div>
                        </div>
                        <div class="detail_content">
                            <p>
                                ${ notice.noticeContent }
                            </p>
                        </div>
                    </div>
                    <div class="home_box">
                        <div class="home_btn">
                            <button class="btn_notice">목록</button>
                            <button class="btn_re">수정</button>
                            <button class="btn_delete">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <form method="post" class="postFrm_re">
    	<input type="hidden" name="nNo" value="${ notice.noticeNo }">
    </form>
     <form method="get" class="postFrm_de">
    	<input type="hidden" name="nNo" value="${ notice.noticeNo }">
    </form>
    
    <script type="text/javascript">
    	
    	$('.btn_notice').click(function() {
    		console.log('안눌려요');
    		location.href='notice.bo';
    	})
    	
    	$('.btn_re').click(function() {
    		console.log('안눌려요!');
    		$('.postFrm_re').attr('action', 'updateFrm.bo').submit();
    	})
    	
    	$('.btn_delete').click(function() {
    		console.log('안눌려요!!');
    		$('.postFrm_de').attr('action', 'deleteFrm.bo').submit();
    	})
    		
    		
    </script>
       
    <jsp:include page="../common/footer.jsp" />
    
    

    
</body>
</html>