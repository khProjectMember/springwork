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
    <link rel="stylesheet" href="resources/css/service.css">

</head>
<body>
<jsp:include page="../common/header.jsp" />   

    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="views/list.jsp" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">고객센터</a></li>
                            <li><a href="#">1:1문의</a></li>
                        </ul>                            
                    </div>                     
                </div>
                    <div class="innersection">
                        <h2>1:1문의</h2>
                        <div class="notiBoxArea">
                            <ul>
                                <li>
                                    · 1:1문의의 내용은 이메일에서 보실 수 있습니다.
                                </li>
                                <li>
                                    · 자주하는문의에 없는 질문은 1:1문의를 해주시면 빠른 시일 안에 답변을 보내드리겠습니다.
                                </li>
                             </ul>
                        </div>
                    </div>
                 <form name="detailForm" method="post" action="insertQA.bo" class="insertFrm">
                    <div>
                            <input type="radio" name="qnaStatus"  value="1">공개</label>
                            <input type="radio" name="qnaStatus"  value="0">비공개</label>              
                           
                    </div>
                    <div class="basicDataTable aLeft" mb30>
                       
                            <table>                   
                                <colgroup>
                                    <col style="width:12%;">
                                    <col style="width:12%;">
                                    <col style="width:38%;">
                                    <col style="width:12%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <label for="tit">제목</label>
                                        </th>
                                            <td colspan="3">
                                                <input type="text" name="qnaTitle" title="제목 입력" >
                                            </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="tit">이메일</label>
                                        </th>
                                            <td colspan="3">
                                                <input type="text" name="qnaEmail" title="제목 입력" >
                                            </td>
                                    </tr>                                    
                                    <tr>
                                        <th scope="row">
                                            <label for="tit">내용</label>
                                        </th>
                                        <td colspan="3">
                                           <textarea id="summernote" name="qnaContent" class="text_content"></textarea>                                                                                                                
                                        </td>                                    
                                    </tr>                                                                                                           
                                </tbody>
                            </table>
                        </form>
                    </div>
                    
                    <div class="btnArea">
                        <div class="leftArea">
                            <a href="list.qa" class="btn btntype03 btnWhite" style="background: #fff;
    						border: 1px solid #aaa;color: #222;height: 80px;   						
    						line-height: 66px; font-size: 20px; min-width: 120px;">
                                <span>목록</span>
                            </a>
                        </div>
                        <div class="rightArea">
                            <a href="list.qa" id="dCancel" class="btn btntype03 btnBlack"style="background: #000;
    						border: 1px solid #aaa;color: white;height: 80px;   						
    						line-height: 66px; font-size: 20px; min-width: 120px;">
                                <span>취소</span>
                            </a>
                            <a href="javascript:qaFrm();" id="dInsert" class="btn btntype03 btnRed" style="background: #eb2d2f;
    						border: 1px solid #aaa;color:white;height: 80px;   						
    						line-height: 66px; font-size: 20px; min-width: 120px;">
                                <span>등록</span>
                            </a>
                        </div>
                    </div>
                </div>            
            </div>
        </div>
    <script>
    	function qaFrm() {
    		$('.insertFrm').submit();
    	}
    
    
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
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>