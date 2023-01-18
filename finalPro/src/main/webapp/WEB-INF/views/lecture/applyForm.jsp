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
    <link rel="stylesheet" href="resources/css/applyForm.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>


    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    
    <!-- 결제 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
                        <script>
                        function iamport(){
                        		//가맹점 식별코드
                        		IMP.init('imp80013463');
                        		IMP.request_pay({
                        		    pg : '',
                        		    pay_method : 'trans',
                        		    merchant_uid : 'merchant_' + new Date().getTime(),
                        		    name : '상품1' , //결제창에서 보여질 이름
                        		    amount : 100, //실제 결제되는 가격
                        		    buyer_email : 'iamport@siot.do',
                        		    buyer_name : '구매자이름',
                        		    buyer_tel : '010-1234-5678',
                        		    buyer_addr : '서울 강남구 도곡동',
                        		    buyer_postcode : '123-456'
                        		}, function(rsp) {
                        			console.log(rsp);
                        		    if ( rsp.success ) {
                        		    	var msg = '결제가 완료되었습니다.';
                        		        msg += '고유ID : ' + rsp.imp_uid;
                        		        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        		        msg += '결제 금액 : ' + rsp.paid_amount;
                        		        msg += '카드 승인번호 : ' + rsp.apply_num;
                        		    } else {
                        		    	 var msg = '결제에 실패하였습니다.';
                        		         msg += '에러내용 : ' + rsp.error_msg;
                        		    }
                        		    alert(msg);
                        		});
                        	}
						</script>
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