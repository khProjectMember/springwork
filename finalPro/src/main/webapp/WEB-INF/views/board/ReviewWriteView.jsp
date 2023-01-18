<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/reviewwrite.css">
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
                    <div class="textbox">
                        <form action="" method="post">
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
                                        <td><input type="text" name="" id="" class="title_input" placeholder="제목을 입력해주세요."></td>
                                        <th scope="row">평점</th>
                                        <td>
                                            <div class="starpoint_set">
                                                <span>*스크롤 후 클릭해주세요</span>
                                                <input type="radio" name="starpoint" value="5" id="star1" class="star"><label for="star1" class="label">★</label>
                                                <input type="radio" name="starpoint" value="4" id="star2" class="star"><label for="star2" class="label">★</label>
                                                <input type="radio" name="starpoint" value="3" id="star3" class="star"><label for="star3" class="label">★</label>
                                                <input type="radio" name="starpoint" value="2" id="star4" class="star"><label for="star4" class="label">★</label>
                                                <input type="radio" name="starpoint" value="1" id="star5" class="star"><label for="star5" class="label">★</label>                                                
                                                <input type="hidden" value="">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수강한 강의</th>
                                        <td>
                                            <select name="" id="">
                                                <option value="체육">수영</option>                                        
                                                <option value="요리">한식</option>
                                                <option value="예능">바이올린</option>
                                            </select>
                                        </td>
                                        <th scope="row">작성자</th>
                                        <td><input type="text" placeholder="작성자 닉네임" class="nick_input" readonly></td>
                                    </tr>
                                    <tr class="th_textarea">
                                        <th scope="row">내용</th>
                                        <td colspan="3">
                                            <textarea id="summernote" name="editordata" class="text_content"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="postbox">
                                <div class="homebox">
                                    <button onclick="location.href=#">목록</button>
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
	<jsp:include page="../common/footer.jsp" />
</body>
</html>