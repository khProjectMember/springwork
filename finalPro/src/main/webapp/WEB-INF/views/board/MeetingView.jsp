<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/meeting.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	
	<!-- 미팅  -->
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
                    <div class="search_box">
                        <div class="search">
                            <form class="search_arr" method="post">                                
                                <select name="key_local" class="search_location">
                                    <option value="전체">지역 전체</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="강원">강원</option>
                                    <option value="충청">충청</option>
                                    <option value="전라">전라</option>
                                    <option value="경상">경상</option>
                                </select>                                
                                <select name="key_gender" class="search_gender">
                                    <option value="전체">성별 전체</option>
                                    <option value="남성">남성</option>
                                    <option value="여성">여성</option>
                                </select>                                
                                <select name="key_age" class="search_age">
                                    <option value="전체">연령 전체</option>
                                    <option value="청소년">청소년</option>
                                    <option value="20대">20대</option>
                                    <option value="30대">30대</option>
                                    <option value="40대">40대</option>
                                    <option value="50대">50대</option>
                                    <option value="60대 이상">60대 이상</option>
                                </select>                                
                                <select name="key_catg" class="search_category">                                    
                                    <option value="전체">카테고리 전체</option>
                                    <option value="체육">체육</option>
                                    <option value="인문학">인문학</option>
                                    <option value="요리">요리</option>
                                    <option value="예능">예능</option>
                                </select>
                                <select name="key_count" class="search_person">
                                    <option value="0">인원 전체</option>
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명</option>
                                    <option value="7">7명</option>
                                    <option value="8">8명</option>
                                </select>           
                                <button type="button" class="search_btn">검색</button>
                            </form>                            
                        </div>
                    </div>
                    <div class="board_type">
                        <div class="type">
                            <ul>
                                <li><a href="javascript:viewAlign();">최신순</a></li>
                                <li><a href="javascript:viewCountAlign();">조회순</a></li>
                            </ul>
                        </div>
                        <div class="board_btn">
                        	<c:choose>
                        		<c:when test="${ empty loginUser }">
                        			<button class = "meeting_make_no">모임만들기</button>	
                        		</c:when>
                        		<c:otherwise>
                        			<button class = "meeting_make">모임만들기</button>
                        		</c:otherwise>
                        	</c:choose>
                            	
                        </div>
                    </div>
                    <div class="board_count">
                        <h2>전체 모임 ${ listCount }</h2>
                    </div>
                    <div class="main_board">
                        <ul>
                        	<c:forEach var="meeting" varStatus="status" items="${ list }">
	                            <li>
	                                <div class="board_info">
	                                    <div class="board_textbox">
	                                        <h3>${ meeting.hangoutTitle }</h3>
	                                        <p class="hangoutNo" style="display: none;">${ meeting.hangoutNo }</p>                          
	                                        <p>🌎<span>${ meeting.hangoutLocal }</span></p>
	                                        <p>💑<span>${ meeting.hangoutGender }</span></p>
	                                        <p>🔞<span>${ meeting.hangoutAge }</span></p>
	                                        <p>🎨<span>${ meeting.hangoutCatg }</span></p>
	                                        <p>🎣<span>현재 ${ meeting.hangoutNowCount }명 / 최대 ${ meeting.hangoutJoinCount }명</span></p>
	                                        <p>
	                                            <span>${ meeting.hangoutEdate }</span>
	                                            <span>👀 ${ meeting.hangoutViewCount }</span>
	                                        </p>	                                        
	                                    </div>      
	                                </div>
	                            </li>
                            </c:forEach>                 
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    	// 로그인 제한
    	
    	$('.meeting_make_no').on('click', function() {
    		Swal.fire("로그인 후 이용해주세요.");
    	})
    
    
    	// 모임 만들기 폼 이동
    	$('.meeting_make').click(function() {
    		location.href='meetingEnroll.bo';
    	});
    	
    
    	// ajax 최신순 조회순
    	function viewAlign() {
    		$.ajax({    			 
    			url:"viewAlign.bo",
    			success: function(list) {
    				let value = "";
    				for(let i in list) {
    					value += "<li>"
    					      +		"<div class='board_info'>"
    					      +			"<div class='board_textbox'>"
    					      +				"<h3>" + list[i].hangoutTitle + "</h3>"
    					      +				"<p class='hangoutNo' style='display: none;'>" + list[i].hangoutNo + "</p>"
    					      +				"<p>🌎<span>" + list[i].hangoutLocal +"</span></p>"
    					      +				"<p>💑<span>" + list[i].hangoutGender + "</span></p>"
    					      +				"<p>🔞<span>" + list[i].hangoutAge + "</span></p>"
    					      +				"<p>🎨<span>" + list[i].hangoutCatg + "</span></p>"
    					      +				"<p>🎣<span>현재 " + list[i].hangoutNowCount + "명 / 최대 " + list[i].hangoutJoinCount + "명</span></p>"
    					      +				"<p>"
    					      +					"<span>" + list[i].hangoutEdate + "</span>"
    					      +					"<span>👀 " + list[i].hangoutViewCount + "</span>"
    					      +				"</p>"
    					      +			"</div>"
    					      +		"</div>"
    					      +	 "</li>";
    				}
    				$('.main_board>ul').empty();					
					$('.main_board>ul').html(value);
    			},
    			error: function() {
    				console.log("실패");
    			}
    		})
    	}
    	
    	function viewCountAlign() {
    		$.ajax({
    			url : "viewCountAlign.bo",	
    			success: function(list) {
    				let value = "";
    				for(let i in list) {
    					value += "<li>"
    					      +		"<div class='board_info'>"
    					      +			"<div class='board_textbox'>"
    					      +				"<h3>" + list[i].hangoutTitle + "</h3>"
    					      +				"<p class='hangoutNo' style='display: none;'>" + list[i].hangoutNo + "</p>"
    					      +				"<p>🌎<span>" + list[i].hangoutLocal +"</span></p>"
    					      +				"<p>💑<span>" + list[i].hangoutGender + "</span></p>"
    					      +				"<p>🔞<span>" + list[i].hangoutAge + "</span></p>"
    					      +				"<p>🎨<span>" + list[i].hangoutCatg + "</span></p>"
    					      +				"<p>🎣<span>현재 " + list[i].hangoutNowCount + "명 / 최대 " + list[i].hangoutJoinCount + "명</span></p>"
    					      +				"<p>"
    					      +					"<span>" + list[i].hangoutEdate + "</span>"
    					      +					"<span>👀 " + list[i].hangoutViewCount + "</span>"
    					      +				"</p>"
    					      +			"</div>"
    					      +		"</div>"
    					      +	 "</li>";
    				}
    				$('.main_board>ul').empty();					
					$('.main_board>ul').html(value);
    			},
    			error: function() {
    				console.log("실패");
    			}
    		})
    	}
    	
		$('.search_btn').click(function() {
		
			var selectData = $('.search_arr').serialize();
			console.log(selectData);
			$.ajax({
				type : "post",
				url : 'meetingsearch.bo',
				data : selectData,
				success: function(list) {
					let value = "";
    				for(let i in list) {
    					value += "<li>"
    					      +		"<div class='board_info'>"
    					      +			"<div class='board_textbox'>"
    					      +				"<h3>" + list[i].hangoutTitle + "</h3>"
    					      +				"<p class='hangoutNo' style='display: none;'>" + list[i].hangoutNo + "</p>"
    					      +				"<p>🌎<span>" + list[i].hangoutLocal +"</span></p>"
    					      +				"<p>💑<span>" + list[i].hangoutGender + "</span></p>"
    					      +				"<p>🔞<span>" + list[i].hangoutAge + "</span></p>"
    					      +				"<p>🎨<span>" + list[i].hangoutCatg + "</span></p>"
    					      +				"<p>🎣<span>현재 " + list[i].hangoutNowCount + "명 / 최대 " + list[i].hangoutJoinCount + "명</span></p>"
    					      +				"<p>"
    					      +					"<span>" + list[i].hangoutEdate + "</span>"
    					      +					"<span>👀 " + list[i].hangoutViewCount + "</span>"
    					      +				"</p>"
    					      +			"</div>"
    					      +		"</div>"
    					      +	 "</li>";
    				}
    				$('.main_board>ul').empty();					
					$('.main_board>ul').html(value);
				},
				error: function() {
					console.log("실패");
				}
			})
		})
    	
    	
    	// 모임 상세 페이지 이동
    	$(function() {
    		$('.board_textbox').click(function() {
    			var hangoutNo = $(this).children('.hangoutNo').text();
    			console.log(hangoutNo);
    			hangoutNo = Number(hangoutNo);
    			console.log(hangoutNo);
        		location.href='meetingDetail.bo?hangoutNo='+ hangoutNo;
        	});
    		$(document).on("click", '.board_textbox', function(){
    			var hangoutNo = $(this).children('.hangoutNo').text();
    			console.log(hangoutNo);
    			hangoutNo = Number(hangoutNo);
    			console.log(hangoutNo);
    			location.href='meetingDetail.bo?hangoutNo='+ hangoutNo;
			});
    	});
    </script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>