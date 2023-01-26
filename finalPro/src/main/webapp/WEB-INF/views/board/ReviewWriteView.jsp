<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/reviewWrite.css">
	<!-- controll에서 강의 받아사 input hidden 해야함 수정 mapper-->
	<!-- 로그인 세션도 받아서 input hidden mem_no 수정해야함 insert 부분 mapper -->
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
                        <form action="insertReview.bo" method="post">
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
                                        <td colspan="3"><input type="text" name="revTitle" class="title_input" placeholder="제목을 입력해주세요."></td>                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">카테고리</th>
                                        <td>
                                            <select name="revCatg" id="">
                                                <option value="컴퓨터">컴퓨터</option>      
                                                <option value="언어">언어</option>                                        
                                                <option value="음식">음식</option>
                                                <option value="음악">음악</option>
                                            </select>
                                        </td>
                                        <th scope="row">수강한 강의</th>
                                        <td>
                                            <select name="revLecture" id="">
                                                <option value="수영">컴활</option>                                        
                                                <option value="프랑스어">프랑스어</option>
                                                <option value="한식">한식</option>
                                                <option value="바이올린">바이올린</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">평점</th>
                                        <td>
                                            <div class="starpoint_set">
                                                <span>*스크롤 후 클릭해주세요</span>
                                                <input type="radio" name="revStar" value="5" id="star1" class="star"><label for="star1" class="label">★</label>
                                                <input type="radio" name="revStar" value="4" id="star2" class="star"><label for="star2" class="label">★</label>
                                                <input type="radio" name="revStar" value="3" id="star3" class="star"><label for="star3" class="label">★</label>
                                                <input type="radio" name="revStar" value="2" id="star4" class="star"><label for="star4" class="label">★</label>
                                                <input type="radio" name="revStar" value="1" id="star5" class="star"><label for="star5" class="label">★</label>                                                
                                                <input type="hidden" value="">
                                            </div>
                                        </td>
                                        <th scope="row">작성자</th>
                                        <td><input type="text" placeholder="${ loginUser.memNickname }" class="nick_input" readonly></td>
                                    </tr>
                                    <tr class="th_textarea">
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea id="summernote" name="revContent" class="text_content"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="postbox">
                                <div class="homebox">
                                    <button class="listReturn">목록</button>
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
        });

  		$('.listReturn').click(function() {
  			location.href='review.bo';
  		});
        
    </script>
    
	<jsp:include page="../common/footer.jsp" />
</body>
</html>