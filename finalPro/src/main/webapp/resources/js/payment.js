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