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
<jsp:include page="../common/header.jsp" />


	<div id="wrap">
	    <div id="content">
	        <div class="inner">
	          	<form id="" method="post" action="list.le" class="formFrm">
					<div class="h1_box">
						<h1>강좌목록</h1>
					</div>

		          	<div class="prodList">
						<ul>
						<c:forEach var="l" items="${ list }">
						<li>
							<div class="prodItem">
								<a href="detail.le?lecNo=${l.lecNo }" class="" >
										<div class="thum">
											<img src="${l.lecFilename}"
												alt="예시1">
										</div>
										<div class="info">
											<div class="tagArea">
												<span class="icoTag type02">접수중</span>
												<span class="data">
													<span>${l.lecBcatg} </span>
													<span class="icoTag typeBlack">${l.lecScatg}</span>
												</span>
											</div>
											<div class="txtBox">
												<span class="subject" title="예시1">${l.lecName}</span>
												<div class="subTxt">
													<span class="name">${l.teacher.teaName}</span>
													<span class="semester">${l.lecSdate} ~ ${l.lecEdate}</span>
													<span class="time">${l.lecStime} ~ ${l.lecEtime}</span>
												</div>
												<div class="price">
													<span class="blind">가격</span>
													<em>${l.lecPrice}</em>원
													<span>(총 ${l.lecCount}회)</span>
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
						</ul>
	          		</div>
	          	</form>
	        </div>
	    </div>
	</div>


<jsp:include page="../common/footer.jsp" />
</body>
</html>