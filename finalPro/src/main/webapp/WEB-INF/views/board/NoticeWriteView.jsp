<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/noticewrite.css">
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
                    <h1>공지사항/이벤트</h1>
                    <div class="textbox">
                        <form action="insert.bo" method="post">
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
                                        <td colspan="3"><input type="text" name="noticeTitle" class="title_input" placeholder="제목을 입력해주세요."></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">카테고리</th>
                                        <td>
                                            <select name="noticeCatg" id="">
                                                <option value="0">공지사항</option>
                                                <option value="1">이벤트</option>                                                
                                            </select>
                                        </td>
                                        <th scope="row">작성자</th>
                                        <td><input type="text" placeholder="${ loginUser.memNickname }" class="nick_input" readonly></td>
                                    </tr>
                                    <tr class="th_textarea">
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea id="summernote" name="noticeContent" class="text_content"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="postbox">
                                <div class="homebox">
                                    <button class="noticeList_box">목록</button>
                                </div>
                                <div class="modifybox">
                                    <button type="submit">작성</button>                                   
                                    <button type="reset" class="cancle">취소</button>
                                </div>
                            </div>
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

        // 썸머노트
      
    
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
        
        $('.noticeList_box').click(function() {
        	location.href='notice.bo';
        });
        

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