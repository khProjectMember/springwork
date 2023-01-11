<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강좌목록</title>
<link rel="stylesheet" href="resources/css/lect_list.css">
</head>
<body>
<jsp:include page="common/header.jsp" />


	<div id="wrap">
	     <div id="content">
	          <div class="inner">
	          <form id="" method="post" action="list.le">
		          <div class="prodList">
					<ul>
					<c:forEach var="l" items="${list }">
					   <li>
			              <div class="prodItem">
			                 <a href="" class="" >
			                        <div class="thum">
			                            <img src="resources/uploadFiles/ex1.jpg"
			                                alt="예시1">
			                        </div>
			                        <div class="info">
			                            <div class="tagArea">
			                                <span class="icoTag type02">접수중</span>
			                                <span class="data">
			                                    <span>아동강좌 </span>
			                                    <span class="icoTag typeBlack">${l.lecBcatg }</span>
			                                </span>
			                            </div>
			                            <div class="txtBox">
			                                <span class="subject" title="예시1">${l.lecName }</span>
			                                <div class="subTxt">
			                                    <span class="name">베토벤</span>
			                                    <span class="semester">겨울</span>
			                                    <span class="time">(일) ${l.lecStime} ~ ${l.lecEtime}</span>
			                                </div>
			                                <div class="price">
			                                    <span class="blind">가격</span>
			                                    <em>${l.lecPrice }</em>원
			                                    <span>(총 ${l.lecCount }회)</span>
			                                </div>
			                            </div>
			                        </div>
			                    </a>
			                    <div class="btnProd">
			                        <a href="" 
			                        class="btnCart dCartBtn" data-strcd="0006" data-status="2" data-kisuno="101" data-classcd="7130"data-clsfee="10000">
			                        <span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_cart_w.png">장바구니 담기</span></a>
                        			<a href=""
                            		class="btnPayment dPaymentBtn" data-strcd="0006" data-status="2" data-kisuno="101"data-classcd="7130" data-ismember="false">
                            		<span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_pay_w.png">결제하기</span></a>
			                   </div>
			                </div>
		           	   </li>
		           	</c:forEach>
		           	<!-- 
					<c:forEach begin="1" end="6" step="1">
						<c:set var="i" value="${i+1 }"/>
					   <li>
			              <div class="prodItem">
			                    <a href="" class="" >
			                        <div class="thum">
			                            <img src="resources/uploadFiles/ex${i }.jpg"
			                                alt="예시1">
			                        </div>
			                        <div class="info">
			                            <div class="tagArea">
			                                <span class="icoTag type02">접수중</span>
			                                <span class="data">
			                                    <span>아동강좌 </span>
			                                    <span class="icoTag typeBlack">음악</span>
			                                </span>
			                            </div>
			                            <div class="txtBox">
			                                <span class="subject" title="예시1">강좌예시 1</span>
			                                <div class="subTxt">
			                                    <span class="name">베토벤</span>
			                                    <span class="semester">겨울</span>
			                                    <span class="time">(일) 13:00 ~ 14:00</span>
			                                </div>
			                                <div class="price">
			                                    <span class="blind">가격</span>
			                                    <em>10,000</em>원
			                                    <span>(총 1회)</span>
			                                </div>
			                            </div>
			                        </div>
			                    </a>
			                    <div class="btnProd">
			                        <a href="" 
			                        class="btnCart dCartBtn" data-strcd="0006" data-status="2" data-kisuno="101" data-classcd="7130"data-clsfee="10000">
			                        <span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_cart_w.png">장바구니 담기</span></a>
                        			<a href=""
                            		class="btnPayment dPaymentBtn" data-strcd="0006" data-status="2" data-kisuno="101"data-classcd="7130" data-ismember="false">
                            		<span><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_pay_w.png">결제하기</span></a>
			                   </div>
			                </div>
		           	   </li>
		           	</c:forEach>
		           	-->
		          	</ul>
	          	</div>
	          	</form>
	          </div>
	     </div>
	</div>


<jsp:include page="common/footer.jsp" />
</body>
</html>