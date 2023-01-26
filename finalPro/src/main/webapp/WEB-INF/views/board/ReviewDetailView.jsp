<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/reviewdetail.css">
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
                            <li><a href="#">수강생 후기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content_sec">
                    <h1>수강생 후기</h1>
                    <div class="detailbox">
                        <div class="detail_info">
                            <div class="detail_cate">
                                <span>${ review.revCatg }</span>
                            </div>
                            <div class="detail_lec">
                                <span>${ review.l.lecName }</span>
                            </div>
                            <div class="detail_starpoint">
                                <span>평점 ${ review.revStar }</span>
                            </div>
                            <div class="detail_title">
                                <span>${ review.revTitle }</span>
                            </div>
                            <div class="detail_nick">
                                <span>${ review.m.memNickname }</span>
                            </div>
                            <div class="detail_date">
                                <span>${ review.revDate }</span>
                            </div>
                            <div class="detail_recomm">
                                <span>${ review.revRec }</span>
                            </div>
                        </div>
                        <div class=detail_content>                            
                        	${ review.revContent }
                        </div>
                    </div>
                    <div class="middle_box">
                        <h3>댓글</h3>
                        <c:choose>
                        	<c:when test="${ empty loginUser }">
                        		<button class="recommendNo"><img src="resources/img/icons8-엄지-척-52.png" alt="따봉"></button>
                        	</c:when>
                        	<c:otherwise>
                        		<c:if test="${ fn:contains(list, loginUser.memNo) }">
                        			<button onclick="revRecommDelete();"><img src="resources/img/icons8-엄지-척-52 색깔.png" alt="따봉색깔" class="goodImg"></button>
                        		</c:if>
                        		<c:if test="${ not fn:contains(list, loginUser.memNo) }">
                        			<button onclick="revRecomm();"><img src="resources/img/icons8-엄지-척-52.png" alt="따봉" class="goodImg"></button>
                        		</c:if>								                        	
                        	</c:otherwise>
                        </c:choose>                                                                              		
                    </div>
                    <div class="review">
                        <div class="review_text">
                            <div class="review_area">
                                <textarea name="revReplyContent" class="revReplyContent"></textarea>
                            </div>
                            <div class="review_btn">
                                <button class="insertComment">등록</button>
                            </div>
                            <div class="home_btn">
                                <button class="listReturn">목록</button>
                                <c:if test="${ loginUser.memNickname eq review.m.memNickname }">
                                	<button class="btn_re">수정</button>
                                	<button class="btn_delete">삭제</button>
                                </c:if>                                
                            </div>
                        </div>
                        <div class="review_show">
                            <div class="review_count">
                                <span></span>
                            </div>
                            
                            <div class="review_main">
                                
                                <div class="user_comment_add">
                                    <div class="comment_nick">
                                        <span>리뷰 작성자</span>
                                        <button><img src="resources/img/icons8-지우다-24.png" alt="삭제"></button>
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
    <input type="hidden" class="id.check">
    <form method="post" class="enrollFrm">
		<input type="hidden" name="revNo" value="${ review.revNo }">
    </form>
    <jsp:include page="../common/footer.jsp" />
    <script type="text/javascript">    
	    $(function() {
			selectReviewReplyList();	
			reviewTotalCount();
			setInterval(reviewTotalCount, 1000);
	
		})
    	
    	$('.recommendNo').on('click', function() {
    		alert('로그인 후 이용 가능합니다.');
    	})
    	//목록 이동
    	
    	$('.listReturn').click(function() {
    		location.href='review.bo';
    	})
    	
    	// 글 수정
    	
    	$('.btn_re').click(function() {
    		$('.enrollFrm').attr('action', 'reviewModify.bo').submit();
    	})
    	
    	// 글 삭제
    	
    	$('.btn_delete').click(function() {
    		$('.enrollFrm').attr('action', 'reviewDelete.bo').submit();
    	})
    	
    	// 글 추천 (글 추천할 때 멤버 번호도 넘겨줘야함 controll 수정)
    	
    	
    	function revRecomm() {
        	console.log("실행맨");

        	$.ajax({
        		url : "reviewRecommend.bo",
        		data : {revNo: "${ review.revNo }",
        				memNo: "${ loginUser.memNo }"
        	   		},
        		success: function(result) {
        			console.log("성공");        			
            		location.reload();	
        			        			
        		},
       			error: function() {
       				console.log("실패");
       			}
       		});
       	}
	    
	    function revRecommDelete() {
        	console.log("실행");

        	$.ajax({
        		url : "reviewRecommendDelete.bo",
        		data : {revNo: "${ review.revNo }",
        				memNo: "${ loginUser.memNo }"
        	   		},
        		success: function(result) {
        			console.log("성공");        			
            		location.reload();	
        			        			
        		},
       			error: function() {
       				console.log("실패");
       			}
       		});
       	}
	    
	    
	    
    	
    	function selectReviewReplyList() {
    		console.log("되는건가요?");
    		$.ajax({
    			url: "rlist.bo",
    			data: {
    				revNo : ${ review.revNo }
    			},
    			success: function(list) {
    				let value = "";
    				for(let i in list) {
    					value += "<div class='main_add'>"
    						  +		"<div class='user_nick'>"
    						  +			"<span>"+list[i].revReplyWriter+"</span>"
    						  +			"<button onclick='revReplyDelete("+list[i].revReplyNo+");'><img src='resources/img/icons8-지우다-24.png' alt='삭제'></button>"
    						  +		"</div>"
    						  +		"<div class='user_content'>"
    						  +			"<p>"+list[i].revReplyContent+"</p>"
    						  +		"</div>"
    						  +		"<div class='user_func'>"
    						  +			"<span>"+list[i].revReplyDate+"</span>"
    						  +			"<div class='user_good'>"
    						  +				"<img src='resources/img/icons8-하트-50 (1).png' alt='좋아요' onclick='replyRecommend("+list[i].revReplyNo+");' >"
    					 	  +				"<span>"+list[i].revReplyGcount+"</span>"
    						  +			"</div>"
    						  +		"</div>"
    						  +	 "</div>";
    						  
    				}
    				$('.review_main').html(value);
    				
    			},
    			error: function() {
    				console.log("실패");
    			}
    		})
    	}

    	$('.insertComment').on('click', function() {
    		addReply();
    	})
    	
    	function addReply() {
    		if($('.revReplyContent').val().trim().length != 0) {
    			$.ajax({
    				url : "rinsert.bo",
    				data : {
    					revNo : ${ review.revNo },
    					revReplyWriter : "${ loginUser.memNickname }",
    					revReplyContent : $('.revReplyContent').val()
    				},
    				success: function(result) {
    					if(result == "success") {
    						selectReviewReplyList();
    						$('.revReplyContent').val("");
    					}
    				},
    				error: function() {
    					console.log("실패");
    				}
    			})
    		} else {
    			alert("댓글 작성 후 등록해주세요");
    		}
    	}
    	
    	function reviewTotalCount() {
    		$.ajax({
    			url: 'reviewTotalCount.bo',
    			data: {revNo: ${ review.revNo }},
    			success: function(result) {
    				$('.review_count>span').html("총 댓글 수 "+result);
    			},
    			error: function() {
    				console.log("실패");
    			}
    		})
    	}
    		
    	
    	/* 
    	$(document).on('click', '.revReplyDelete', function() {
			console.log($('.revReplyNo').val());
			$.ajax({
				url:'revReplyDelete.bo',
				data: {
						UserId : '${ loginUser.memNickname }',
						revReplyNo: num
					},
				success: function(result) {
					location.reload();
				},
				error: function() {
					console.log("실패");	
				}					
			})
				
		
		
		})
		
	
		$(document).on('click', '.replyGood', function() {
			console.log($('.replyGood').val());
		    	$.ajax({
	        		url : "replyRecommend.bo",
	        		data : {
	        				revReplyNo: $('.replyGood').val(),
	        				memNo: "${ loginUser.memNo }"
	        	   		},
	        		success: function(result) {
	        			console.log("성공");		        			
	            		location.reload();
	        			        			
	        		},
	       			error: function() {
	       				console.log("실패");
	       				location.reload();
	       			}
	       		});
		}) */
		
		function revReplyDelete(num) {
    		$.ajax({
				url:'revReplyDelete.bo',
				data: {
						UserId : '${ loginUser.memNickname }',
						revReplyNo: num
					},
				success: function(result) {
					location.reload();
				},
				error: function() {
					console.log("실패");	
				}					
			})
    	}
		
		
		function replyRecommend(num) {
    		$.ajax({
        		url : "replyRecommend.bo",
        		data : {
        				revReplyNo: num,
        				memNo: "${ loginUser.memNo }"
        	   		},
        		success: function(result) {
        			console.log("성공");		        			
            		location.reload();
        			        			
        		},
       			error: function() {
       				console.log("실패");
       				location.reload();
       			}
       		});
    	}

    </script>
</body>
</html>