<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li><a href="#" class="nav_a"><img src="../img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
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
                                <span>수영</span>
                            </div>
                            <div class="detail_starpoint">
                                <span>별점 4</span>
                            </div>
                            <div class="detail_title">
                                <span>수영 종일반</span>
                            </div>
                            <div class="detail_nick">
                                <span>쿄보이</span>
                            </div>
                            <div class="detail_date">
                                <span>2023-01-01</span>
                            </div>
                        </div>
                        <div class=detail_content>
                            <p>
                                
                            </p>
                        </div>
                    </div>
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
                                <button onclick="#">목록</button>
                                <button class="btn_re" onclick="">수정</button>
                                <button class="btn_delete" onclick="">삭제</button>
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
    <jsp:include page="../common/footer.jsp" />
</body>
</html>