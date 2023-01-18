<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link rel="stylesheet" href="resources/css/review.css">
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
                    <div class="search_box">
                        <div class="search">
                            <form class="search_arr" action="" method="">
                                <select name="" id="" class="search_sel">
                                    <option value="전체">전체</option>
                                    <option value="체육">체육</option>
                                    <option value="인문학">인문학</option>
                                    <option value="요리">요리</option>
                                    <option value="예능">예능</option>
                                </select>
                                <input type="text" name="" class="search_input" placeholder="검색할 내용을 입력하세요.">
                                <button type="submit" class="search_btn" >검색</button>
                            </form>                            
                        </div>
                    </div>
                    <div class="board_type">
                        <div class="type">
                            <ul>
                                <li><a href="">최신순</a></li>
                                <li><a href="">조회순</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="table_box">
                        <table>
                            <colgroup>
                                <col style="width: 80px;">
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                                <col style="width: 140px;">
                                <col style="width: 140px;">
                                <col style="width: 80px">
                            </colgroup>
                            <thead> 
                                <tr>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>평점</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <tr>
                                    <td>10</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>관리자</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagin">
                        <div class="pagin_box">
                            <div class="pagin_box_fir"></div>
                            <div class="pagin_box_sec">
                                <ul>
                                    <li><a href="">이전</a></li>                                                          
                                    <li><a href="">1</a></li>                                                          
                                    <li><a href="">2</a></li>                                                          
                                    <li><a href="">3</a></li>                                                          
                                    <li><a href="">4</a></li>                                                          
                                    <li><a href="">5</a></li>                                                          
                                    <li><a href="">다음</a></li>                                                          
                                </ul>
                            </div>
                            <div class="pagin_box_thi">
                                <button>게시글 작성</button>
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