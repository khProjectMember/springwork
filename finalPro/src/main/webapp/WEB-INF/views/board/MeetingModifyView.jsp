<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/meetingmodify.css">
	
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
                            <li><a href="#">모임 게시판</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>모임 게시판 수정</h1>
                    <div class="textbox">
                        <form action="meetingmodify.wr" method="post">
                            <table>
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: 35%;">
                                    <col style="width: 15%;">
                                    <col style="width: 35%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">제목</th>
                                        <td colspan="3"><input type="text" name="hangoutTitle" value="${ meeting.hangoutTitle }" class="title_input" placeholder="제목을 입력해주세요."></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">작성자</th>
                                        <td><input type="text" class="nick_input" value="${ meeting.m.memNickname }" placeholder="작성자 닉네임" readonly></td>
                                        <th scope="row">모집인원</th>
                                        <td>
                                            <select name="hangoutJoinCount">
                                                <option value="전체">전체</option>
                                                <option value="2">2명</option>
                                                <option value="3">3명</option>
                                                <option value="4">4명</option>
                                                <option value="5">5명</option>
                                                <option value="6">6명</option>
                                                <option value="7">7명</option>
                                                <option value="8">8명</option>                                     
                                            </select>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">지역</th>
                                        <td>
                                            <select name="hangoutLocal">
                                                <option value="전체">전체</option>
                                                <option value="서울">서울</option>
                                                <option value="경기">경기</option>
                                                <option value="강원">강원</option>
                                                <option value="충청">충청</option>
                                                <option value="전라">전라</option>
                                                <option value="경상">경상</option>                                                
                                            </select>
                                        </td>
                                        <th scope="row">성별</th>
                                        <td>
                                            <select name="hangoutGender">
                                                <option value="전체">전체</option>
                                                <option value="남성">남성</option>
                                                <option value="여성">여성</option>                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">연령</th>
                                        <td>
                                            <select name="hangoutAge">
                                                <option value="청소년">전체</option>
                                                <option value="청소년">청소년</option>
                                                <option value="20대">20대</option>
                                                <option value="30대">30대</option>
                                                <option value="40대">40대</option>
                                                <option value="50대">50대</option>
                                                <option value="60대 이상">60대 이상</option>
                                            </select>
                                        </td>
                                        <th scope="row">카테고리</th>
                                        <td>
                                            <select name="hangoutCatg">
                                                <option value="체육">체육</option>
                                                <option value="인문학">인문학</option>
                                                <option value="요리">요리</option>
                                                <option value="예능">예능</option>
                                            </select>
                                        </td>
                                        
                                    </tr>
                                    <tr class="th_textarea">
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea id="summernote" name="hangoutContent" class="text_content">
                                            	${ meeting.hangoutContent }
                                            </textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="postbox">
                                <div class="homebox">
                                    <button type="button" class="meetingList_box">목록</button>
                                </div>
                                <div class="modifybox">
                                    <button type="submit">수정</button>
                                    <button type="reset" class="cancle">취소</button>
                                </div>
                            </div>
                            <input type="hidden" name="hangoutNo" value="${ meeting.hangoutNo }" > 
                        </form>
                    </div>
                    
                </div>
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

        // 서머노트
      
    
        $('#summernote').summernote({
            height: 400,                 // 에디터 높이
            minHeight: 400,             // 최소 높이
            maxHeight: 400,             // 최대 높이
            focus: true,
            toolbar: [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor','color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert',['picture','link','video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview','fullscreen', 'help']]
            ],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            
            callbacks : { 
            	onImageUpload : function(files) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
	            	
	            		console.log(files[0]);	            		
	            		sendFile(files[0], this);
            	}
            	
            }
        	
        	
      
        });
        
		function sendFile(file, editor) {
        	var data = new FormData();
        	data.append("file", file);
        	console.log(file);
        	console.log(editor);
        	$.ajax({
        		data: data,
        		type:"POST",
        		url: "SummerNoteImageFile",
        		contentType: false,
        		processData: false,
        		success: function(data) {
        			console.log(data);
        			console.log(editor);
        			$(editor).summernote('insertImage', data.url);
        		},
        		error: function(e) {
        			console.log(e);
        		}
        		
        	})
        }
        
 
        $('.cancle').on('click', function() {
            $('#summernote').summernote('reset');
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
	<jsp:include page="../common/footer.jsp" />
</body>
</html>