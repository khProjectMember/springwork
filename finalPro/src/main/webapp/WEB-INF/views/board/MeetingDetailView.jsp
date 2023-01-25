<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/meetingdetail.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="#" class="nav_a"><img src="../img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">커뮤니티</a></li>
                            <li><a href="#">모임 게시판</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>모임 게시판</h1>
                    <div class="detailbox">
                        <div class="detail_info">
                            <div class="detail_title">
                                <span>${ meeting.hangoutTitle }</span>
                            </div>
                            <div class="detail_nick">
                                <span>${ meeting.m.memNickname }</span>
                            </div>
                            <div class="detail_date">
                                <span>${ meeting.hangoutEdate }</span>
                            </div>
                            <div class="detail_count">
                                <span>조회수 ${ meeting.hangoutViewCount }</span>
                            </div>
                        </div>
                        <div class=detail_content>
                            <div class="con_box">
                                <p>
                                    ${ meeting.hangoutContent }
                                </p>
                            </div>
                            <div class="info_box">
                                <span>🌎${ meeting.hangoutLocal }</span>
                                <span>💑${ meeting.hangoutGender }</span>
                                <span>🔞${ meeting.hangoutAge }</span>
                                <span>🎨${ meeting.hangoutCatg }</span>
                                <span>🎣현재 ${ meeting.hangoutNowCount }명 / 최대 ${ meeting.hangoutJoinCount }명</span>
                            </div>                            
                        </div>
                    </div>
                    <form method="post" class="modifyFrm">
                    	<input type="hidden" name="hangoutNo" value="${ meeting.hangoutNo }">
                    	<input type="hidden" name="memNo" class="memNofrm" >                	
                    </form>
                    <h3>댓글</h3>
                    <div class="review">
                        <div class="review_text">
                            <div class="review_area">
                                <textarea name="" id="" ></textarea>
                            </div>
                            <div class="review_btn">
                                <button onclick="#">등록</button>
                            </div>
                            
                            <div class="home_btn">
                                <button class="meetingList_btn">목록</button>
                                <c:choose>
                                	<c:when test="${ empty loginUser }">
 										<button class="btn_join_no">참여</button>							                               	
                                	</c:when>
                                	<c:otherwise>
                                		<c:if test="${ loginUser.memNickname eq meeting.m.memNickname }">
                                			<button class="btn_re">수정</button>
                                			<button class="btn_delete">삭제</button>		
                                		</c:if>
                                		<c:if test="${ loginUser.memNickname ne meeting.m.memNickname }">
                                			<button class="btn_join">참여</button>
                                		</c:if>
                                	</c:otherwise>
                                </c:choose>
                                
                                
                            </div>                            
                        </div>
                        <div class="review_show">
                            <div class="review_count">
                                <span>총 댓글 수 5</span>
                            </div>
                            <div class="review_order">
                                <ul>
                                    <li><a href="">추천순</a></li>
                                    <li><a href="">최신순</a></li>
                                </ul>
                            </div>
                            <div class="review_main">
                                <div class="main_add">
                                    <div class="user_nick">
                                        <span>닉네임</span>
                                        <button><img src="../img/icons8-지우다-24.png" alt="삭제"></button>
                                    </div>
                                    <div class="user_content">
                                        <p>내용이에욘</p>
                                    </div>
                                    <div class="user_func">
                                        <span>2023-01-01</span>
                                        <div class="user_good">
                                            <button onclick="#">답글</button>
                                            <img src="../img/icons8-하트-50.png" alt="좋아요">
                                            <span>0</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="user_comment_add">
                                    <div class="comment_nick">
                                        <span>리뷰 작성자</span>
                                        <button><img src="../img/icons8-지우다-24.png" alt="삭제"></button>
                                    </div>
                                    <div class="comment_content">
                                        <p>내용이에욘</p>
                                    </div>
                                    <div class="comment_btn">
                                        <span>2023-01-01</span>
                                        <button class="#">답글</button>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$('.meetingList_btn').click(function() {
    		location.href='meeting.bo';
    	});
    	$('.btn_re').click(function() {
    		$('.modifyFrm').attr('action', 'meetingmodifyfrm.bo').submit();
    	})
    	$('.btn_delete').click(function() {
    		$('.modifyFrm').attr('action', 'meetingdelete.bo').submit();
    	})
    	$('.btn_join').click(function() {
    		var list = [];
    		<c:forEach var="join" items="${ list }" varStatus="status">
    			list.push(${ join.memNo });
    		</c:forEach>
    		
    		console.log(list);
    		
    		$('.memNofrm').attr('value', ${ loginUser.memNo });
    		if( list.includes(${loginUser.memNo})) {
    			$('.modifyFrm').attr('action', 'meetingjoinOut.bo').submit();
    			Swal.fire("모임 탈퇴 하셨습니다!");
    		} else {
    			$('.modifyFrm').attr('action', 'meetingjoin.bo').submit();
    			Swal.fire("모임에 참여 되었습니다!");
    		}
    		
    		
    	})
    	
    	
    	// 로그인 제한
    	
    	$('.btn_join_no').on('click', function() {
    		Swal.fire("로그인 후 이용해주세요.");
    	})
    	
    	
    	
    </script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>