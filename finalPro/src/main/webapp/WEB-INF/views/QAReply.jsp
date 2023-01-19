<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>樂受文化 악수문화센터</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/service centerReply.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>



    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">

</head>
<body>
<jsp:include page="common/header.jsp" />   
  
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="#" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">고객센터</a></li>
                            <li><a href="#">고객게시판</a></li>
                        </ul>                            
                    </div>                     
                </div>
                <div class="innersection">
                    <h2>고객게시판</h2>
                    <div class="notiBoxArea">
                        <ul>
                            <li>
                                · 1:1문의의 내용은 이메일에서 보실 수 있습니다.
                            </li>
                            <li>
                                · 자주하는문의에 없는 질문은 1:1문의를 해주시면 빠른 시일 안에 답변을 보내드리겠습니다.
                            </li>
                            <a href="#" class="btn btnBlack btnType04">
                                    <span>자주하는 문의보기</span>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="basicDataTable mb30 inquiry">
                    <table>
                        <!-- <caption>1:1문의 목록</caption> -->
                            <colgroup>
                                <col style="width:293px;">
                                <col style="width:490px;">
                                <col style="width:360px;">                          
                                <col style="width:360px;">                                
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">제목</th>                                 
                                    <th scope="col">내용</th>                                  
                                    <th scope="col">답변상태</th>
                                    <th scope="col">공개상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="6" class="noData">등록된 1:1문의가 없습니다.</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <div class="btnArea">
                    <div class="rightArea">
                        <a href="#" class="btntype03">
                            <span>문의하기</span>
                        </a>
                    </div>
                </div>
            </div>            
        </div>
    </div>

    <div id="wrap">
        <div id="banner">
            <div class="inner">
                <div class="banner">                                                          
                </div>
            </div>
        </div>
    </div>

    <div id="wrap">
        <div id="content">           
            <div class="quickmenu">
                <ul>
                    <li><a href="">문의</a></li>
                    <li><a href="#"><img src="resources/img/icons8-쪽으로-48.png" alt="화살표 위로"></a></li>
                </ul>
            </div>
        </div>
    </div>
   
    <div class="all"></div>
    <jsp:include page="common/footer.jsp" />
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