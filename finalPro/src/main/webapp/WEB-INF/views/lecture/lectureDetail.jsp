<%@page import="com.siot.IamportRestClient.IamportClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	
	<!--  script -->
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
        var IMP = window.IMP; 
        IMP.init("imp67011510"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '${lecture.lecName}',
                amount : 500,
                buyer_email : '${member.memEmail}',
                buyer_name : 'member.memName',
                buyer_tel : 'member.memPhone',
                buyer_addr : 'memAddress',
                buyer_postcode : 'memZipcode'
            }, function (rsp) { // callback
                if (rsp.success) {
      		      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
      		      // jQuery로 HTTP 요청
      		      jQuery.ajax({
      		        url: "{서버의 결제 정보를 받는 가맹점 endpoint}", 
      		        method: "POST",
      		        headers: { "Content-Type": "application/json" },
      		        data: {
      		          imp_uid: rsp.imp_uid,            // 결제 고유번호
      		          merchant_uid: rsp.merchant_uid   // 주문번호
      		        }
      		      }).done(function (data) {
      		        // 가맹점 서버 결제 API 성공시 로직
      		      })
      		    } else {
      		      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
      		    }
      		  });
        }
    </script>
    <!-- css -->
    <link rel="stylesheet" href="resources/css/lectureDetailView.css">

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
                    <a href="goHome.le">홈으로&emsp;|&emsp;</a>
                    <a href="applyForm.le">수강신청&emsp;|&emsp;</a>
                    <a href="list.le">강좌검색</a>
                </div>
                <div class="class_status">
                    <ul>
                        <li>접수중</li>
                        <li>${ lecture.lecBcatg }</li>
                        <li>${lecture.lecScatg }</li>
                    </ul>
                </div>
                <div class="class_name">
                    <table>
                        <tr>
                            <td><h1>${lecture.lecName }</h1></td>
                            <td rowspan="2"><a href="">장바구니</a></td>
                            <td rowspan="2"><a href="">신청하기</a></td>
                        </tr>
                    </table>
                </div>
                <div class="class_info">
                    <table class="info_table">
                        <tr>
                            <td>
                                <h1>${lecture.lecInfo }</h1>
                            </td>
                            <td class="class_info2">
                            <h1>등록정보</h1>
                            <table>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강좌정보</td>
                                    <td>${ lecture.lecBcatg }/${lecture.lecScatg }</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강사명</td>
                                    <td>${lecture.teacher.teaName }&ensp;<a href="" class="teacher_info">강사소개</a></td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>수강기간</td>
                                    <td>${lecture.lecSdate} ~ ${lecture.lecEdate}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>접수인원</td>
                                    <td>${lecture.lecJnum }/${lecture.lecCnum }</td>
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
                                    <td>${lecture.lecPrice }</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>접수기간</td>
                                    <td>${lecture.lecStime} ~ ${lecture.lecEtime}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>강의시간</td>
                                    <td>${lecture.lecStime} ~ ${lecture.lecEtime}</td>
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
                    <a href="list.le">목록</a>
                    <!-- <a href="applyForm.le">신청하기</a> -->
                    <button onClick="requestPay()">신청하기</button>
                    <a href="wishList.le">찜하기</a>
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