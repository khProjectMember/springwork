<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            <div class="backg" onclick="location.href='#'">                        
                                <img src="resources/img/swim.jpg" alt="수영">
                                <div class="explan">
                                    <p>수강신청 안내</p>
                                    <div class="edate">
                                        <p>강좌기간</p>
                                        <span>2023.01.01~2023.12.31</span>
                                    </div>
                                    <div class="edate">
                                        <p>접수기간</p>
                                        <span>2023.01.01~2023.12.31</span>
                                    </div>
                                    <div class="edate">
                                        <p>접수방법</p>
                                        <span>홈페이지 접수 또는 방문 접수</span>
                                    </div>                            
                                </div>
                            </div> 
                          </div>
                          <div class="swiper-slide">
                            <div class="backg" onclick="location.href='#'">                        
                                <img src="resources/img/swim.jpg" alt="수영">
                                <div class="explan">
                                    <p>수강신청 안내</p>
                                    <div class="edate">
                                        <p>강좌기간</p>
                                        <span>2023.01.01~2023.12.31</span>
                                    </div>
                                    <div class="edate">
                                        <p>접수기간</p>
                                        <span>2023.01.01~2023.12.31</span>
                                    </div>
                                    <div class="edate">
                                        <p>접수방법</p>
                                        <span>홈페이지 접수 또는 방문 접수</span>
                                    </div>                            
                                </div>
                            </div> 
                          </div>
                          <div class="swiper-slide">
                            <div class="backg" onclick="location.href='#'">                        
                                <img src="resources/img/swim.jpg" alt="수영">
                                <div class="explan">
                                    <p>수강신청 안내</p>
                                    <div class="edate">
                                        <p>강좌기간</p>
                                        <span>2023.01.01~2023.12.31</span>
                                    </div>
                                    <div class="edate">
                                        <p>접수기간</p>
                                        <span>2023.01.01~2023.12.31</span>
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
            <div class="inner">
                <div class="content">
                    <h2>추천강좌</h2>
                    <div class="container">
                        <div class="reco">
                            <ul class="reco_ul">
                                <c:forEach var="l" items="${ list }">
					   <li>
			              <div class="prodItem">
			                 <a href="detail.le?lecNo=${l.lecNo}" class="" >
			                        <div class="thum">
			                            <img src="${l.lecFilename}"
			                                alt="예시1">
			                        </div>
			                        <div class="info">
			                            <div class="tagArea">
			                                <span class="icoTag type02">접수중</span>
			                                <span class="data">
			                                    <span>${l.lecBcatg} </span>
			                                    <span class="icoTag typeBlack">${l.lecScatg}</span>
			                                </span>
			                            </div>
			                            <div class="txtBox">
			                                <span class="subject" title="예시1">${l.lecName}</span>
			                                <div class="subTxt">
			                                    <span class="name">${l.teacher.teaName}</span>
			                                    <span class="semester">${l.lecSdate} ~ ${l.lecEdate}</span>
			                                    <span class="time">${l.lecStime} ~ ${l.lecEtime}</span>
			                                </div>
			                                <div class="price">
			                                    <span class="blind">가격</span>
			                                    <em>${l.lecPrice}</em>원
			                                    <span>(총 ${l.lecCount}회)</span>
			                                </div>
			                            </div>
			                        </div>
			                    </a>
			                    <div class="btnProd">
			                        <a href="" 
			                        class="btnCart dCartBtn" data-strcd="0006" data-status="2" data-kisuno="101" data-classcd="7130"data-clsfee="10000">
			                        <span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_cart_w.png">장바구니 담기</span></a>
                        			<a href=""
                            		class="btnPayment dPaymentBtn" data-strcd="0006" data-status="2" data-kisuno="101"data-classcd="7130" data-ismember="false">
                            		<span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_pay_w.png">결제하기</span></a>
			                   </div>
			                </div>
		           	   </li>
		           	</c:forEach>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>                          
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="content2">
                    <h2>최신강좌</h2>
                    <div class="container">
                        <div class="reco">
                            <ul class="reco_ul">
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>                                            
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="over_mouse">
                                        <div class="img_box">
                                            <img src="resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg" alt="라떼아트">
                                        </div>
                                        <div class="img_info">
                                            <div class="info_detail">
                                                <span>라떼아트 기초반</span>
                                                <p>강사 : 고석우 강사</p>
                                                <p>월, 수, 금 18:00~20:00</p>
                                                <p>월 30,000원</p>
                                            </div>        
                                        </div>
                                        <div class="img_title">
                                            <p><바리스타 초급반></p>
                                        </div>
                                    </a>
                                </li>                          
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
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                </ul>
                            </div>
                            <div class="notice_date">
                                <ul>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <h2>이벤트</h2>
                        <div class="event_box">
                            <div class="event_title">
                                <ul>
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                    <li><a href="#">제목</a></li>
                                </ul>
                            </div>
                            <div class="event_date">
                                <ul>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
                                    <li>2023-01-01</li>
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