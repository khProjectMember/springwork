<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/meetingwrite.css">

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
                    <h1>모임 게시판</h1>
                    <div class="textbox">
                        <form action="meetingInsert.bo" method="post">
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
                                        <td colspan="3"><input type="text" name="hangoutTitle" class="title_input" placeholder="제목을 입력해주세요."></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">작성자</th>
                                        <td>
                                        	<input type="text" class="nick_input" placeholder="${ loginUser.memNickname }" readonly>
                                        	<input type="hidden" name="memNo" value="${ loginUser.memNo }">
                                        </td>                                        
                                        <th scope="row">모집인원</th>
                                        <td>
                                            <select name="hangoutJoinCount" id="">
                                                <option value="100">전체</option>
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
                                            <select name="hangoutLocal" id="">
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
                                            <select name="hangoutGender" id="">
                                                <option value="전체">전체</option>
                                                <option value="남성">남성</option>
                                                <option value="여성">여성</option>                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">연령</th>
                                        <td>
                                            <select name="hangoutAge" id="">
                                                <option value="전체">전체</option>
                                                <option value="청소년">청소년</option>
                                                <option value="20대">20대</option>
                                                <option value="30대">30대</option>
                                                <option value="40대">40대</option>
                                                <option value="50대">50대</option>
                                                <option value="60대이상">60대 이상</option>
                                            </select>
                                        </td>
                                        <th scope="row">카테고리</th>
                                        <td>
                                            <select name="hangoutCatg" id="">
                                                <option value="전체">전체</option>
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
                                            <textarea id="summernote" name="hangoutContent" class="text_content"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="postbox">
                                <div class="homebox">
                                    <button type="button" class="meetingList_box">목록</button>
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
    <script type="text/javascript">
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
	    };
	
	    $('.cancle').on('click', function() {
	        $('#summernote').summernote('reset');
	    });
	    
	    $('.meetingList_box').click(function() {
	    	location.href='meeting.bo';
	    })
	    
	    $(function() {
    		
    	})
    	
	    
    </script>
    
    
	<jsp:include page="../common/footer.jsp" />
</body>
</html>