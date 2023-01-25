<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>樂受文化 악수문화센터</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/qadetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<body>
<jsp:include page="../common/header.jsp" />	
		<div class="main">
		<p>
			<label>글번호</label> <input type="text" name="qnaNo"
				value="${qna.qnaNo}" readonly="readonly">
		</p>
		<p>
			<label>제목</label> <input type="text" name="qnaTitle"
				value="${qna.qnaTitle}" readonly="readonly">
		</p>
		<p>
			<label>공개상태</label> <input type="text" name="status" size="15"
				value="${qna.qnaStatus}" readonly="readonly">
		<p>
			<label>내용</label>
			<textarea name=qnaContent rows="10" cols="70" readonly="readonly" value="${qnaContent}"></textarea>
			
			<hr>
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
                                        <button><img src="resources/img/icons8-지우다-24.png" alt="삭제"></button>
                                    </div>
                                    <div class="user_content">
                                        <p>내용이에욘</p>
                                    </div>
                                    <div class="user_func">
                                        <span>2023-01-01</span>
                                        <div class="user_good">
                                            <button onclick="#">답글</button>
                                            <img src="resources/img/icons8-하트-50.png" alt="좋아요">
                                            <span>0</span>
                                        </div>
                                    </div>
                                </div>
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
<script>

</script>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>