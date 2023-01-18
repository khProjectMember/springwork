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
        <link rel="stylesheet" href="resources/css/main.css">
        <link rel="stylesheet" href="resources/css/review.css">
        
        <!-- js -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    
    
    
        <!-- 폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    
    </head>
<body>
     <!--header--> 
     <jsp:include page="../common/header.jsp"/>

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
                    <h1>나의 최근 작성목록</h1>
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
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>공지사항</td>
                                    <td>4.5</td>
                                    <td class="subject"><a href="">[광복점]신년맞이 성인 특강Ⅱ</a></td>
                                    <td>홍길동</td>
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


    <!--footer--> 
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>