<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>樂受文化 악수문화센터 마이페이지</title>
	
		<!-- jQuery 라이브러리 지우지 마세용!-->
		<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
		
		<!-- myPage탈퇴기능 modal창 관련 부트스트랩에서 제공하고 있는 스타일 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<!-- myPage탈퇴기능 modal창 관련 부트스트랩에서 제공하고 있는 스크립트 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="resources/js/main3.js"></script>
    <style>
        .content_fir {width: 100%; display: flex; justify-content: flex-end;}
        .content_fir .nav_box {margin: 50px 0;}
        .content_fir .nav_box ul {display: flex;}
        .content_fir .nav_box ul li a {font-size: 14px; color: #666; font-weight: 400; padding: 0 7px; overflow: hidden; white-space: nowrap;}
        .content_fir .nav_box ul li .nav_a {border-right: 1px solid #bdbdbd;}
        .content_fir .nav_box ul li a img {width: 20px; height: 20px; vertical-align: bottom; overflow: hidden; white-space: nowrap;}
        /* .location{
            position: relative; 
            text-align: right;
        } */
        .innerMemberModify .name{
            font-size: 52px;
            margin-bottom: 20px;
        }
        .innerMemberModify .changeDay{
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #000;
        }
        .myInfoArea{
            display: flex;
        }
        .myInfoArea .leftArea{
            margin-right: 100px;
        }
        .myInfoArea .leftArea dl dt span {
            font-size: 16px;
            padding-left:30px;
        }
        .myInfoArea .rightArea{
            margin-left: 630px;
        }
        .memberInfoTable th,td{
            text-align: left;
            padding: 20px;
        }
        .memberInfoTable th{
            background-color: #f4f4f4;
            border-bottom: 1px solid #e5e5e5;
        }
        .rightArea li{
            display: inline-block;
            text-align: center;
        }
        .rightArea li a .txt{
            display: block;
        }
        .inner2 .title{
            margin-top: 60px;
        }
        .inner2 h3{
            font-size: 22px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #000;
        }
        .inner2 caption {
            text-indent: -9999em;
        }
        .btnArea{
        	display: flex;
        	justify-content: flex-end;
            text-align: right;
        }
        
        .inner3 .title{
            margin-top: 60px;
        }
        .inner3 h3{
            font-size: 22px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #000;
        }
        .inner3 {
            /* padding: 30px; */
            margin-bottom: 30px;
            border-top: 1px solid #000;
            border-bottom: 1px solid #ccc;
            position: relative;
        }
        .inner3 .btnType04{
            position: absolute;
            top:135px;
            right: 84px;
        }

        .inner4{
            position: relative;
        }
        .inner4 .btnType04{
            position: absolute;
            top:73px;
            right: 84px;
        }
        .inner4 .title{
            margin-top: 60px;
            
        }
        .inner4 h3{
            font-size: 22px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #000;
        }
        .parkingDetail .txt{
            margin-top: -10px;
        }
        .inner4-1{
            display: flex;
        }
        .memberExit {
            text-align: right;
        }
        /*확대기능*/

        /* 감싸는 div */
        .wrap {
            position: relative;
            width: 500px;
            height: 500px;
            margin: 0 auto;
        }
        /* 확대될 타겟이미지*/
        .target {
            display: block;
            width: 100%;
        }
        /* 돋보기 */
        .magnifier {
            width: 100px;
            height: 100px;
            position: absolute;
            border-radius: 100%;
            box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
            display: none;
        }


    </style>
    <script>
 	// 닉네임 중복체크
	$(function(){
		const $nickNameInput = $("#updateForm input[name=memNickname]");
		$nickNameInput.keyup(function(){
			// 최소 2글자 이상 입력되었을때만 ajax요청하도록 함
			if($nickNameInput.val().length >= 2) {
				$.ajax({
					url:"nicknameCheck.me",
					data: {checkNickname:$nickNameInput.val()}, //key: checkId, value: $nickNameInput.val()
					success: function(result){
						if(result == "NNN"){
							$("#checkNickResult").show();
							$("#checkNickResult").css("color","#f82a2aa3").text("중복된 닉네임이 존재합니다.");
							$("#updateForm :submit()").attr("disabled",true);
						} else {
							$("#checkNickResult").show();
							$("#checkNickResult").css("color","#199894b3").text("사용가능한 닉네임입니다.");
							$("#updateForm :submit()").attr("disabled",false);
						}
					},
					error:function(){
						console.log("닉네임 중복체크 ajax통신 실패");
					}
				});
			} else{ // 3글자 보다 작았으면
				$("checkNickResult").hide();
			
				$("#updateForm :submit()").attr("disabled", true);
			}
			
		})
	})
	

    </script>
    </head>
<body>
    <!--header--> 
    <jsp:include page="../common/header.jsp"/>

    <!--body-->
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="inner1">
                    <div class="content_fir">
                        <div class="nav_box">
                            <ul>
                                <li><a href="goHome.le" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                                <li><a href="myPage.me" class="nav_a">마이페이지</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- <div class="location">
                        <a href="#"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/common/btn_home.png">home</a>
                        <a href="#">마이페이지</a>
                        <a href="#">회원정보변경</a>
                    </div> -->
                    <div class="innerMemberModify">
                        <h2 class="name">
                            <span>
                                	${loginUser.memName }
                            </span>
                        </h2>
                        <p class="changeDay">
                            	최근수정일자 : ${loginUser.memDdate }
                        </p>
                    </div> <!--innerMemberModify-->
                    <div class="myInfoArea">
                        <div class="leftArea">
                            <dl>
                                <dt>
                                    &emsp;<a href="#"><img src="resources/img/icons8-하트-50.png" alt="찜" style="width:40px;"><span style="color: black;">나의 관심분야</span></a><br><br>
                                </dt>
                            </dl>
                            <dl>
                                <dt>
                                    &emsp;<a href="#"><img src="resources/img/icons8-달력-32.png" alt="찜" style="width:40px;"><span style="color: black;">나의 일정관리</span></a>
                                </dt>
                            </dl>        
                        </div>
                        <div class="rightArea">
                            <ul>
                                <li>
                                    <a href="#"><img src="resources/img/icons8-하트-50.png" alt="찜" style="width:40px;"><span class="txt">찜목록</span>
                                    <span class="num">0</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_my_class_info02.png">
                                    <span class="txt">수강내역</span>
                                    <span class="num">0</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_my_class_info05.png">
                                    <span class="txt">수강후기</span>
                                    <span class="num">0</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_my_class_info06.png" alt="">
                                    <span class="txt">수강후기</span>
                                    <span class="num">0</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="recentPage.me"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_my_class_info02.png">
                                    <span class="txt">최근작성목록</span>
                                    <span class="num">0</span>
                                    </a>
                                </li>
                            </ul>
                        </div><!--rightArea-->
                    </div><!--myInfoArea-->
                </div> <!-- class=inner1-->
                <div class="inner2">
                    <div class="title">
                        <h3>회원정보</h3>
                    </div>

                    <form action="update.me" method="post" id="updateForm">
	                    <div class="memberInfoTable">
	                        <table style="border-spacing: 0;">
	                            <caption>회원정보</caption>
	                            <colgroup>
	                                <col style="width:170px;">
	                                <col style="width:auto;">
	                                <col style="width:170px;">
	                                <col style="width:auto;">
	                            </colgroup>
	                            <tr>
	                                <th>이름</th>
	                                <td style="padding-right: 554px;"><input id="memName" name="memName" value="${loginUser.memName }" readonly></td>
	                                <th>아이디</th>
	                                <td><input id="memId" name="memId" value="${loginUser.memId}" readonly></td>
	                            </tr>
	                            <tr>
	                                <th>닉네임</th>
	                                <td style="padding-right: 554px;"><input id="memNickname" name="memNickname" value="${loginUser.memNickname }">
	                                <font id="checkNickResult" style="font-size:0.8em; display:none"></font></td>
	                                <th>생년월일</th>
	                                <td><input id="memBirthday" name="memBirthday" value="${loginUser.memBirthday }"></td>
	                            </tr>
	                            <tr>
	                                <th>휴대전화</th>
	                                <td><input id="memPhone" name="memPhone" value="${loginUser.memPhone }"></td>
	                                <th>E-mail</th>
	                                <td><input id="memEmail" name="memEmail" value="${loginUser.memEmail }"></td>
	                            </tr>
	                            <tr>
	                                <th>주소</th>
	                                <td colspan="3">
	                                	<input id="memAddress" name="memAddress" value="${loginUser.memAddress }" size="40">
	                                	<input id="memDetailAddress" name="memDetailAddress" value="${loginUser.memDetailAddress }" size="30">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>취약계층 유형
                                        <td>
                                            <select name="memPaper" id="memPaper" name="memPaper">
                                                <option value ="1" <c:if test="${loginUser.memPaper eq 1 }"> selected</c:if>>해당없음</option>
                                                <option value ="2" <c:if test="${loginUser.memPaper eq 2 }"> selected</c:if>>65세 이상 고령자</option>
                                                <option value ="3" <c:if test="${loginUser.memPaper eq 3 }"> selected</c:if>>장애인</option>
                                                <option value ="4" <c:if test="${loginUser.memPaper eq 4 }"> selected</c:if>>한부모가정 보호대상자</option>
                                                <option value ="5" <c:if test="${loginUser.memPaper eq 5 }"> selected</c:if>>저소득자</option>
                                                <option value ="6" <c:if test="${loginUser.memPaper eq 6 }"> selected</c:if>>고용촉진장려금 지급대상 청년</option>
                                                <option value ="7" <c:if test="${loginUser.memPaper eq 7 }"> selected</c:if>>범죄구조피해자</option>
                                                <option value ="8" <c:if test="${loginUser.memPaper eq 8 }"> selected</c:if>>그밖에 고용노동부장관이 인정한 자</option>
                                           
                                        </select>
                                        </td>    
	                                </th>
	                                <td colspan="2"></td>
	                            </tr>
	                        </table>
	                    </div> <!--class=memberInfo-->
					
                    <div class="btnArea">
                        <button type="submit" style="margin-right:10px;"><span style="margin:10px;">회원정보수정</span></button>
                    </form>
                    
                    <form action="updateMyPwd.me">
                        <button type="submit"><span style="margin:10px;">비밀번호 변경</span></button>
                    </form>
                    </div> <!--class=btnArea-->
                </div> <!-- class=inner2-->
				
                <div class="inner3">
                    <div class="title">
                        <h3>문화센터 마케팅 수신동의</h3>
                    </div>
                    <div class="checkBox">
                        <input type="hidden" id="emailOld" value="N">
                        <input type="hidden" id="smsOld" value="N">
                        <span class="bxCheck"><input type="checkbox" id="email" title="E-Mail 수신동의 선택" value="Y"><label for="email">E-Mail</label></span>
                        <span class="bxCheck"><input type="checkbox" id="sms" title="SMS 수신동의 선택" value="Y"><label for="sms">SMS</label></span>
                    </div>
                    <p class="txt" style="color:black">문화센터 강좌수강 및 학습활동과 관련된 정보 및 소식을 받아보실 수 있습니다.</p>
                    <a id="dEmEditSave" href="#" class="btn btnType04 btnBlack"><span>저장</span></a>
                    <div class="btnArea aRight mt14">
                    <p class="inTxt" style="color:black">
                    <div>  
                        <span id="emChgDt">수신동의 변경일자: 2022.05.20</span>
                    </div> 
                    </p>
            </div>
                </div><!--inner3-->
				
				
	                <div class="inner4">
	                    <h3>배려주차장 차량번호 등록</h3>
	                    <div class="inner4-1">
	                        <div class="checkBox">
	                            <p>
	                            	<form action="updateCar.me">
	                                <label for="" style="font-size: 16px;color: #222;text-align: left;padding: 11px 5px 10px 5px;height: 66px;font-weight: normal;">차량번호</label>
	                                
	                                <input type="text" maxlength="20" id="memCarno" placeholder="※예시) [서울12가3456]" value="${loginUser.memCarno}">
	                        		<input type="hidden" name="memId" id="memId" class="form-control" style="width:315px" value="${ loginUser.memId}" maxlength="12" readonly>
	                                <label for="">차량번호 수집동의</label>
	                                <span><input type="checkbox"></span>
	                                <button type="submit" class="btn btnType04 btnBlack"><span>저장</span></button>
	                                </form>
	                            </p>
	                        </div><!--class=checkBox-->
	                    </div> <!--class=inner4-1-->   
				
                        <div class="parkingDetail">
                            <p class="txt" style="color:black">배려주차장등록 서비스 이용을 위해 아래와 같이 알려드립니다.</p>
                            <p class="txt" style="color:black">배려주차장은 영유아동승자, 노약자, 임산부 등 다양한 교통약자를 위한 주차공간입니다.</p>
                            <p class="txt" style="color:black">1. 수집목적: 주차요금 무료 정산처리</p>
                            <p class="txt" style="color:black">2. 수집항목: 차량번호</p>
                            <p class="txt" style="color:black">3. 보유기간: 별도 등록 해제 또는 등록해체 요청시까지</p>
                            <p class="txt" style="color:black">4. 정보수집 거부시, 서비스 이용이 불가합니다.</p>
                            <p class="txt" style="color:black">5. 차량번호의 모든자리를 띄어쓰기 없이 입력&emsp;&emsp;※예시) [서울12가3456]</p>
                            <p class="txt" style="color:black">6. 차량번호 입력 오류시 자동주차정산 불가</p>
                        </div><!--class=parkingDetail-->
                    
                </div><!--class=inner4-->
                <div class="memberExit">
                    <button type="button" data-toggle="modal" data-target="#deleteForm" style="color:black; padding:5px;">악수문화센터 탈퇴하기</button>
                </div>
            </div><!--inner-->
        </div> <!-- id=content-->
    </div>
	
	<!-- - 회원탈퇴 버튼 클릭시 보여질 - Modal. -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal-Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times; </button>
                </div>

                <!-- Modal body --->
                <div class="modal-body" align="center">
                    <p><b>
			                        탈퇴 후 복구가 불가능합니다. <br>
			                        정말로 탈퇴 하시겠습니까?
                    </b></p>

                    <form action="delete.me" method="post">
                 		비밀번호 : <input type="password" name="memPw" required>
              			<input type="hidden" name="memId" value="${loginUser.memId}">
                        <button type="submit" style="color: black; padding-right: 3px; padding-left: 3px;">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
     <!--footer-->
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>