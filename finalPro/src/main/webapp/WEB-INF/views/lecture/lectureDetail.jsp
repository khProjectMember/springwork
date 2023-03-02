<%@page import="com.siot.IamportRestClient.IamportClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="memNo" value="${ memNo}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	
	<!-- 결제 -->
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
            name : '${lecture.lecName}',
            amount : '${lecture.lecPrice}',
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
    	    	  alert("결제가 성공적으로 수행되었습니다.")
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
       
    function add_lecs(lecNo, memNo){
    	$.ajax({
    		type : 'post',
    		url : '${contextPath}/addLecsInWish.wi',
    		data : ({lecNo:lecNo, memNo:memNo}),
    		success : function(data, textStatus){
    			if(data.trim()=='add_success'){
    				alert("찜목록에 등록되었습니다.")
    			}else if(data.trim()=='already_existed'){
    				alert("이미 찜목록에 등록된 강의입니다.")}
    			},
    			error : function(data,textStatus){
    				alert("에러가 발생했습니다,"+data);
    			}
    	});
    }
    
    function apply_lecs(lecNo, memNo){
    	$.ajax({
    		type : 'post',
    		url : '${contextPath}/addLecsInApply.ap',
    		data : ({lecNo:lecNo, memNo:memNo}),
    		success : function(data, textStatus){
    			if(data.trim()=='add_success'){
    				alert("신청목록에 등록되었습니다.")
    			}else if(data.trim()=='already_existed'){
    				alert("이미 신청목록에 등록된 강의입니다.")}
    			},
    			error : function(data,textStatus){
    				alert("에러가 발생했습니다,"+data);
    			}
    	});
    }
    </script>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/lectureDetail.css">

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
                <div class="util_array">
                    <div class="util_box">
                        <ul>
                            <li><a href="goHome.le" class="util_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="myApplyList.ap" class="util_a">수강신청</a></li>
                            <li><a href="list.le">강좌검색</a></li>
                        </ul>
                    </div>
                    
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
                            <td rowspan="2"><button type="button" class="btn_mine" onclick="add_lecs(${lecture.lecNo }, ${loginUser.memNo})" >찜하기</button></td>
                            <td rowspan="2"><button type="button" class="btn_go" onclick="apply_lecs(${lecture.lecNo },${loginUser.memNo})" >신청하기</button></td>
                        </tr>
                    </table>
                </div>
                <div class="class_info">
                    <table class="info_table">
                        <tr>
                            <td class="td_info_box">
                                <div class="img_box_info">
                                    <img src="${lecture.lecFilename}" alt="사진">
                                </div>
                                <div class="lec_box_info">
                                    <p>${lecture.lecInfo} </p>
                                </div>
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
                                        <td class="teacher_name_td"><a href="" class="teacher_info">${lecture.teacher.teaName }</a></td>
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
                                        <td>${lecture.lecJnum } / ${lecture.lecCnum }</td>
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
                                        <td>${lecture.lecPrice} 원</td>
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
                
                <form action="" method="post" id="postForm">
				<input type="hidden" name="lecNo" value="${ lecture.lecNo}">
				<input type="hidden" name="filePath" value="${ lecture.lecFilename}">
				</form>
			<c:if test="${ loginUser.isAdmin eq 'Y' }">
	            <div align="center">
	                <!---수정하기, 삭제하기 버튼은 이글이 본인 글일 경우만 보여져야됨 -->
	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	            </div><br><br>
            </c:if>
	                <script>
						function postFormSubmit(num){
							if(num == 1){
								$("#postForm").attr("action","updateForm.le").submit();
							} 
						}
					</script>
                <div class="class_regi">
                    <div class="regi_box">
                        <a href=""><h1> 수강후기 보러가기👀 </h1></a>
                        
                    </div>
                    <div class="regi_box">
                        <button onclick="location.href='list.le'" class="regi_list">목록</button>    
                        <button onClick="requestPay()" class="nowpayBtn">즉시결제</button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
	    <jsp:include page="../common/footer.jsp" />
</body>
</html>