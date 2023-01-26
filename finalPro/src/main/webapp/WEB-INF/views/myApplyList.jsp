<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myApplyList"  value="${applyMap.myApplyList}"  />
<c:set var="myLecsList"  value="${applyMap.myLecsList}"  />

<c:set  var="totalLecsNum" value="0" />  <!--주문 개수 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/wishList.css">

    <!-- 결제 -->
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
	 <script type="text/javascript">
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
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid: "IMP"+makeMerchantUid, 
            name : '${lname}',
            amount : '${lprice}',
            buyer_email : 'member.memEmail',
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
       function iamport(){
   		//가맹점 식별코드
   		IMP.init('imp30146952');
   		IMP.request_pay({
   		    pg : 'kcp',
   		    pay_method : 'card',
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
   			// 결제검증
   			$.ajax({
   	        	type : "POST",
   	        	url : "/verifyIamport/" + rsp.imp_uid 
   	        }).done(function(data) {
   	        	
   	        	console.log(data);
   	        	
   	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
   	        	if(rsp.paid_amount == data.response.amount){
   		        	alert("결제 및 결제검증완료");
   	        	} else {
   	        		alert("결제 실패");
   	        	}
   	        });
   		});
   	}
	
	function delete_apply_lecs(applyNo){
		var applyNo=Number(applyNo);
		var formObj=document.createElement("form");
		var i_apply = document.createElement("input");
		i_apply.name="applyNo";
		i_apply.value=applyNo;
		
		formObj.appendChild(i_apply);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/removeApplyLecs.ap";
	    formObj.submit();
	}
	</script>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="lecture_util">
                    <ul>
                        <li><a href="goHome.le" class="util_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
						<li><a href="myApplyList.ap" class="util_a">수강신청</a></li>
						<li><a href="list.le">강좌검색</a></li>
                    </ul>
                </div>
                <div class="lecture_join">
                    <h1>신청 목록</h1>
                </div>
			    <form action="" method="post" class="form_table">
                    <table class="join_form">
                        <tbody>
                    		<tr class="tr_th">
                                <td width="15%">강좌구분</td>
                                <td width="20%">강좌명</td>
                                <td width="15%">강사정보</td>
                                <td width="10%">강의실</td>
                                <td width="10%">수강료</td>
                		        <td width="20%">접수상태</td>
                    			<td width="10%"></td>	
                   			 </tr>
                   	<c:choose>
				    <c:when test="${ empty myApplyList }">
					    <tr>
					       <td colspan=8 class="fixed">
					         <strong>신청목록에 상품이 없습니다.</strong>
					       </td>
					     </tr>
					 </c:when>
					 
				     <c:otherwise>
                      <c:forEach var="lecture" items="${ myLecsList }" varStatus="cnt">
                        <c:set var="applyNo" value="${myApplyList[cnt.count-1].applyNo}" />
                        <c:set var="lname" value="${lecture.lecName}"/>
						<c:set var="lprice" value="${lecture.lecPrice}"/>
                            <tr class="tr_info">
                                <td>${lecture.lecBcatg}/${lecture.lecScatg }</td>  
                                <td><a href="detail.le?lecNo=${lecture.lecNo }">${lecture.lecName }</td>
                                <td>홍길동<br><a href="" class="teacher_info">강사소개</a></td>
                                <td>수영장</td>
                                <td>${lecture.lecPrice}</td>
                                <td>대기중<br>대기인원 : 0명</td>
                                <td class="color_diff"><button onClick="requestPay()" class="pay_go">결제</button><br>
                                    <a href="javascript:delete_apply_lecs('${applyNo}');">삭제</a></td>
                            </tr>
                            <c:set  var="totalLecsNum" value="${totalLecsNum+1 }" />
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="10%"></td>
                                <td width="15%">신청한 강좌</td>
                                <td width="10%">${totalLecsNum}개</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    <div class="btn_array">
                        <div class="lecture_regi">
                            <button type="button" onclick="location.href='list.le'">강좌목록</button>
							<button type="button" onclick="location.href='myWishList.wi'">찜목록</button>
                        </div>
                        <div class="join_move">
                            <input type="hidden" name="lectureNo">
                            <input type="hidden" name="userNo">
                        </div>
                    </div>
                    
                </form>
                
            </div>
        </div>
    </div>
	<jsp:include page="common/footer.jsp" />
</body>
</html>