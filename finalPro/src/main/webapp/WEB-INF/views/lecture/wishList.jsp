<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/wishList.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>


    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="lecture_util">
                    <div class="lecture_util_box">
                        <a href="goHome.le"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면">&emsp;|&emsp;</a>
                        <a href="applyForm.le">수강신청&emsp;|&emsp;</a>
                        <a href="list.le">강좌검색</a>
                    </div>
                </div>
                <div class="lecture_join">
                    <h1>찜목록</h1>
                </div>
                <form action="" method="post">
                    <table class="join_form">
                        <thead>
                            <th>
                                <td width="15%">강좌구분</td>
                                <td width="30%">강좌명</td>
                                <td width="15%">강사정보</td>
                                <td width="10%">강의실</td>
                                <td width="10%">수강료</td>
                                <td width="20%">접수상태</td>
                            </th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td><a href="detail.le?="${lecNo }>체육/수영</td>  
                                <td>기초수영</td>
                                <td>홍길동<br><a href="" class="teacher_info">강사소개</a></td>
                                <td>수영장</td>
                                <td>50000</td>
                                <td>대기중<br>대기인원 : 0명</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td width="15%">
                                    <input type="button" value="선택강좌 삭제">
                                </td>
                                <td width="15%">
                                    <input type="button" value="찜목록 비우기">
                                </td>
                                <td width="15%"></td>
                                <td width="10%"></td>
                                <td width="15%">선택    강좌</td>
                                <td width="10%">0</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="join_move">
                        <input type="hidden" name="lectureNum">
                        <input type="hidden" name="userNum">
                        <input type="submit" value="신청하기">
                    </div>
                </form>
                <div class="lecture_regi">
                    <hr>
                    <a href="list.le">강좌목록</a>
                    <a href="goHome.le">홈으로</a>
                    <a href="applyList.le">신청목록</a>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>