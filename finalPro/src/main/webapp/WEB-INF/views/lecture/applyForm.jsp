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
    <link rel="stylesheet" href="../../../resources/css/applyForm.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>


    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp" />

	<div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="class_util">
                    <a href="">홈으로&emsp;|&emsp;</a>
                    <a href="">수강신청&emsp;|&emsp;</a>
                    <a href="">강좌검색</a>
                </div>
                <div class="class_join">
                    <h1>수강신청</h1>
                </div>
                <form action="" method="post">
                    <table class="join_form">
                        <thead>
                            <th>
                                <td width="10%">강좌구분</td>
                                <td width="10%">수강자명</td>
                                <td width="35%">강좌정보</td>
                                <td width="10%">강사정보</td>
                                <td width="10%">강의실</td>
                                <td width="15%">수강료</td>
                                <td width="10%">접수상태</td>
                            </th>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td>체육/수영</td>  
                                <td>홍길동<br><a href="" class="teacher_info">강사소개</a></td>
                                <td>물에 뜨는법, 호흡법, 영법 등 수영에 필요한 기초부터 완벽하게 잡아나가는 강좌 입니다.</td>
                                <td>허준</td>
                                <td>수영장</td>
                                <td>50000</td>
                                <td>접수중</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="join_move">
                        <input type="hidden" name="classNum">
                        <input type="hidden" name="userNum">
                        <input type="submit" value="신청하기">
                    </div>
                </form>
                <div class="class_regi">
                    <hr>
                    <a href="">강좌목록</a>
                    <a href="">홈으로</a>
                    <a href="">찜목록</a>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>