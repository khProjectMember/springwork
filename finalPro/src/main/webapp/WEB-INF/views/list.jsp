<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/main33.css">
    <style>
    	/*확대기능*/

        /* 감싸는 div */
        .wrap {
            position: relative;
            width: 500px;
            height: 500px;
            margin: 0 auto;
        }
        /* 확대될 타겟이미지*/
        .target {
            display: block;
            width: 100%;
        }
        /* 돋보기 */
        .magnifier {
            width: 100px;
            height: 100px;
            position: absolute;
            border-radius: 100%;
            box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
            display: none;
        }
    </style>
</head>
<body>
	<jsp:include page="common/header.jsp" />

    <div id="wrap">
        <div id="banner">
            <div class="inner">
                <div class="banner">
                    <div class="swiper">
                        <!-- Additional required wrapper -->
                        <div class="swiper-wrapper">
                          <!-- Slides -->
                        	<div class="swiper-slide">
                            	<div class="backg" onclick="location.href='list.le'">        
                                	<img src="resources/img/children-7339441_1280.jpg" alt="수영">
                                	<div class="explan">
                                    	<p>여러 강의를 수강하세요!</p>
                                    	<div class="edate">
                                        	<p>강좌기간</p>
                                        	<span>목록을 확인해주세요!</span>
                                    	</div>
                                    	<div class="edate">
                                        	<p>강의시간</p>
                                        	<span>오전, 오후, 저녁 시간대</span>
                                    	</div>
                                    	<div class="edate">
                                        	<p>접수방법</p>
                                        	<span>홈페이지 접수 또는 방문 접수</span>
                                    	</div>                            
                                	</div>
                            	</div> 
                            </div>
                        	<div class="swiper-slide">
                            	<div class="backg" onclick="location.href='detail.bo?noticeNo=2'">                        
                                	<img src="resources/img/sunset-3156176_1920.jpg" alt="수영">
                                	<div class="explan">
                                    	<p>노인을 위한 캠페인</p>
                                    	<div class="edate">
                                        	<p>참여 기한</p>
                                        	<span>2023.01.27~2023.02.27</span>
	                                    </div>
	                                    <div class="edate">
	                                        <p>접수기간</p>
	                                        <span>2023.01.05~2023.01.06</span>
	                                    </div>
	                                    <div class="edate">
	                                        <p>접수방법</p>
	                                        <span>홈페이지 접수 또는 방문 접수</span>
	                                    </div>                            
	                                </div>
                          		</div> 
                            </div>
                          	<div class="swiper-slide">
	                            <div class="backg" onclick="location.href='meeting.bo'">                        
	                                <img src="resources/img/hot-air-balloon-2411851_1280.jpg" alt="열기구">
	                                <div class="explan">
	                                    <p>모임 모집</p>
	                                    <div class="edate">
	                                        <p>강좌기간</p>
	                                        <span>2023.03.01~2023.06.30</span>
	                                    </div>
	                                    <div class="edate">
	                                        <p>접수기간</p>
	                                        <span>상시 접수</span>
	                                    </div>
	                                    <div class="edate">
	                                        <p>접수방법</p>
	                                        <span>홈페이지 접수 또는 방문 접수</span>
	                                    </div>                            
	                                </div>
	                          	</div> 
                         	</div>
                         	
                        </div>
                        <!-- If we need pagination -->
                        <div class="swiper-pagination"></div>
                      
                        <!-- If we need navigation buttons -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>                                          
                </div>
            </div>
        </div>
    </div>
 
    <div id="wrap">
        <div id="content">
         <form method="post" action="main_ord.le">
            <div class="inner">
          
                <div class="content">
                    <h2>추천강좌</h2>
                    <div class="container">
                        <div class="reco">
                            <ul class="reco_ul">
                            	<c:forEach var="l" items="${list2}" begin="0" end="4">
                                <li>
                                    <a href="detail.le?lecNo=${l.lecNo}" class="over_mouse">
                                    
                                    	<div class="img_box">
	                                            <img src="${l.lecFilename}" alt="라떼아트"  >
	                                        </div>
	                                    
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>${l.lecName}</span>
                                                <p>강사 : ${l.teacher.teaName} 강사</p>
                                                <p>${l.lecStime}~${l.lecEtime}</p>
                                                <p>${l.lecPrice}원</p>
                                            </div>                                            
                                        </div>
                                        <div class="img_title">
                                            <p><${l.lecName}></p>
                                        </div>
                                    </a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div> 
                
                <div class="content2">
                    <h2>최신강좌</h2>
                    <div class="container">
                        <div class="reco">
                            <ul class="reco_ul">
                               <c:forEach var="l" items="${list1}" begin="0" end="4">
                                <li>
                                    <a href="detail.le?lecNo=${l.lecNo}" class="over_mouse">
                                        <div class="img_box">
                                            <img src="${l.lecFilename}" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>${l.lecName}</span>
                                                <p>강사 : ${l.teacher.teaName} 강사</p>
                                                <p>${l.lecStime}~${l.lecEtime}</p>
                                                <p>${l.lecPrice}원</p>
                                            </div>                                            
                                        </div>
                                        <div class="img_title">
                                            <p><${l.lecName}></p>
                                        </div>
                                    </a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="content3">
                    <div class="notice">
                        <h2>공지사항</h2>
                        <div class="notice_box">
                       
                            <div class="notice_title">
                                <ul> 
                                	<c:forEach var="n" items="${list3}"  begin="0" end="4">
                                    <li><a href="detail.bo?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></li>
                                     </c:forEach>
                                </ul>
                            </div>
                            <div class="notice_date">
                                <ul>
                                <c:forEach var="n" items="${list3}"  begin="0" end="4">
                                    <li>${n.edate}</li>
                                     </c:forEach>
                                </ul>
                            </div>
                           
                        </div>
                    </div>
                    <div class="event">
                        <h2>이벤트</h2>
                        <div class="event_box">
                          
                            <div class="event_title">
                                <ul>
                                 <c:forEach var="n" items="${list4}"  begin="0" end="4">
                                    <li><a href="detail.bo?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></li>
                                     </c:forEach>
                                </ul>
                            </div>
                            <div class="event_date">
                                <ul>
                                 <c:forEach var="n" items="${list4}"  begin="0" end="4">
                                    <li>${n.edate}</li>
                                     </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="quickmenu">
                <ul>
                    <li><a href="">문의</a></li>
                    <li><a href="#"><img src="resources/img/icons8-쪽으로-48.png" alt="화살표 위로"></a></li>
                </ul>
            </div>
            </form>
        </div>
    </div>
	
	<jsp:include page="common/footer.jsp" />
	<div class="all"></div>
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

        // 강좌 이미지 설명 hover
        $(function() {
            $('.over_mouse').mouseover(function() {
                $(this).find('.img_info').stop().fadeIn(400);
            }).mouseleave(function() {
                $(this).find('.img_info').stop().fadeOut(400);
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

        $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
            
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            if(position < 1500) {
                $('.quickmenu').stop().animate({top:position+"px"}, 1000); //해당 오브젝트 위치값 재설정
            }
        });
            
        const swiper = new Swiper('.swiper', {
            
            loop: true,
            // speed: 10000,
            // loopedSlides: 5,
            // observer:true,
            // observeParents:true,

            // If we need pagination
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            
            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            autoplay: {
                delay: 3000,
                // stopOnLastSlide: false,
                // disableOnInteraction: true,
            }

            // freeMode: {
            //     enabled: true,
            //     sticky: true,
            // },

        });
   	 
    </script>
</body>
</html>