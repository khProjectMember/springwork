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
    <link rel="stylesheet" href="../../../resources/css/lectureDetailView.css">

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
                <div class="class_status">
                    <ul>
                        <li>접수중</li>
                        <li>성인강좌</li>
                        <li>어학/인문</li>
                    </ul>
                </div>
                <div class="class_name">
                    <table>
                        <tr>
                            <td><h1>제목</h1></td>
                            <td rowspan="2"><a href="">장바구니</a></td>
                            <td rowspan="2"><a href="">신청하기</a></td>
                        </tr>
                        <tr>
                            <td>부제</td>
                        </tr>
                        <tr><td colspan="3"></td></tr>
                    </table>
                </div>
                <div class="class_info">
                    <table class="info_table">
                        <tr>
                            <td>
                                <h1>강좌소개</h1>
                            </td>
                            <td class="class_info2">
                            <h1>등록정보</h1>
                            <table>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강좌정보</td>
                                    <td>체육/수영</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강사명</td>
                                    <td>홍길동&ensp;<a href="" class="teacher_info">강사소개</a></td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>수강기간</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강의횟수/정원</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강의실</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>수강료</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>재료비</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>접수기간</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                            </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="class_regi">
                    <hr>
                    <a href="">목록</a>
                    <a href="">신청하기</a>
                    <a href="">장바구니</a>
                </div>
                <div class="class_review">
                    <h1>수강후기(0)</h1>
                    <a href=""><br>수강후기 메뉴에서 더보기</a>
                </div>
            </div>
        </div>
    </div>
	    <jsp:include page="../common/footer.jsp" />
</body>
</html>