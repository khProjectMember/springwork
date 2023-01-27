<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>樂受文化 악수문화센터</title>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css -->
    <link rel="stylesheet" href="resources/css/header.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous" ></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">

    <!-- 서머노트Api -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<!-- sweetalert 알림창 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<!-- sweetalert 알림창 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			Swal.fire("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	<c:if test="${ not empty errorMsg }">
		<script>
			Swal.fire("${errorMsg}");
		</script>
		<c:remove var="errorMsg" scope="session"/>
	</c:if>
 <div id="wrap">
        <div id="header">            
            <div class="header">
                <div class="header-top">
                    <div class="user-info">
                        <ul class="user">
                            <c:choose>
           				    <c:when test="${ empty loginUser }">
           						<!-- 로그인 전 -->
           						<li><a href="javascript:zoomIn();">확대</a></li>
           						<li><a href="javascript:zoomOut();">축소</a></li>
  			                    <li><a href="loginEnroll.me">찜목록</a></li>
	                            <li><a href="loginEnroll.me">로그인</a></li>
	                            <li><a href="enrollForm.me">회원가입</a></li>
                                
	                        </c:when>
	                        <c:when test="${not empty loginUser and loginUser.isAdmin eq 'Y' }">
	                        	<li><a><strong>${ loginUser.memName }</strong>님 환영합니다</a></li>
					                <li><a href="admin.ad">관리자메뉴</a></li>
					                <li><a href="logout.me" onclick="Swal.fire({title: '로그아웃 되었습니다.',timer: 3000})">로그아웃</a><li>
	                        </c:when>
            				<c:otherwise>
            					<!-- 로그인 후 -->
            					<li><a href="javascript:zoomIn();">확대</a></li>
            					<li><a href="javascript:zoomOut();">축소</a></li>
  			                     <li><a href="myWishList.wi">찜목록</a></li>
            					<li><a><strong>${ loginUser.memName }</strong>님 환영합니다</a></li>
					                <li><a href="myPage.me">마이페이지</a></li>
					                <li><a href="logout.me" onclick="Swal.fire({title: '로그아웃 되었습니다.',timer: 3000})">로그아웃</a><li>
				             </c:otherwise>
				            </c:choose>
                        </ul>
                    </div>
                </div>                
                <div class="header-mid">
                    <div class="mid-f">
                        <h1>
                            <a href="main_ord.le">樂受文化</a>
                        </h1>
                    </div>
                    <div class="mid-m">
                        <div class="category">
                            <ul class="nav_category">
                                <li><a href="">수강안내</a></li>
                                <li><a href="">시설안내</a></li>
                                <li><a href="">커뮤니티</a></li>
                                <li><a href="">고객센터</a></li>                            
                            </ul>
                        </div>
                    </div>                    
                    <div class="mid-b">
                        <div class="button_box">
                            <div class="button_img">                            
                                <button type="button"><img src="resources/img/icons8-달력-32.png" alt="달력"></button>
                                <button type="button"><img src="resources/img/icons8-하트-50.png" alt="찜"></button>
                                <button type="button" class="main_btn"><img src="resources/img/icons8-수색-30.png" alt="검색"></button>
                            </div>
                        </div>                        
                    </div>
                </div>
                <div class="nav_bar">
                    <div class="inner">
                        <div class="nav_info">
                            <h4>강좌안내</h4>
                            <ul>
                                <li><a href="list.le">강좌목록</a></li>
                                <li><a href="myApplyList.ap">신청목록</a></li>
                            </ul>
                        </div>
                        <div class="nav_info">
                            <h4>시설안내</h4>
                            <ul>
                                <li><a href="facility.fa">시설현황</a></li>
                                <li><a href="contact.co">오시는 길</a></li>
                            </ul>
                        </div>
                        <div class="nav_info">
                            <h4>커뮤니티</h4>
                            <ul>
                                <li><a href="notice.bo">공지사항/이벤트</a></li>
                                <li><a href="meeting.bo">모임게시판</a></li>
                                <li><a href="review.bo">수강생 후기</a></li>
                                
                            </ul>
                        </div>
                        <div class="nav_info">
                            <h4>고객센터</h4>
                            <ul>
                                <li><a href="qa.bo">1:1문의</a></li>
                                <li><a href="">자주하는문의</a></li>                                
                            </ul>
                        </div>
                    </div>
                </div>
            
                <form action="" method="" class="h_form">
                    <div class="search_hide">
                        <div class="search_bar">
                            <div class="search_array">
                                <div class="search_select">
                                    <select name="" id="">
                                        <option value="0">전체검색</option>
                                        <option value="강좌">강좌</option>
                                        <option value="시설">시설</option>
                                        <option value="커뮤니티">커뮤니티</option>                                    
                                    </select>
                                </div>                        
                                <div class="search_inp">
                                    <input type="text" id="" name="">
                                    <button type="submit"><img src="resources/img/icons8-수색-30.png" alt="찾기"></button>
                                    <button type="button" class="search_cancle"><img src="resources/img/icons8-지우다-24.png" alt="취소"></button>
                                    <input type="hidden">
                                </div>       
                            </div>
                        </div>
                    </div>
                </form>    
            </div>
        </div>            
 </div>
    <script>
        // 검색 버튼 fade
        $(function() {
            $('.main_btn').on('click', function(e) {
                $('.h_form').fadeIn(300)
                
                $('.search_cancle').on('click', function() {
                    $('.h_form').fadeOut(300)
                })
            })
        })

        // 헤더 카데고리 바 숨겨진 div
        $(function() {
            $('.nav_category').mouseover(function() {
                $('.nav_bar').stop().fadeIn(1);
            })
            $($('.nav_bar')).mouseleave(function() {
                $(this).fadeOut(1);
            })
        })

        // 확대 기능
        var nowZoom=100;

        function zoomIn(){
            nowZoom = nowZoom +10;
            if(nowZoom>=500) nowZoom = 500;
            zooms();
        }
        function zooms(){
            document.body.style.zoom=nowZoom + '%';
        }
        
        function zoomOut(){
            nowZoom = nowZoom -10;
            if(nowZoom<=70) nowZoom = 70;
            zooms();
        }

        
</script>
</body>
</html>