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
    
        <!-- css -->
        <link rel="stylesheet" href="../css/main.css">
    
        <!-- js -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    
    
    
        <!-- 폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    
    <style>
        .content_fir {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }
        .content_fir .nav_box ul li .nav_a {
            border-right: 1px solid #bdbdbd;
        }
        .content_fir .nav_box ul li a {
            font-size: 14px;
            color: #666;
            font-weight: 400;
            padding: 0 7px;
            overflow: hidden;
            white-space: nowrap;
            
        }
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
            margin-right: 300px;
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
            margin-top: 20px;
        }
        .inner4-1{
            display: flex;
        }
        .memberExit {
            text-align: right;
        }
    </style>
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
                                <li><a href="#" class="nav_a"><img src="../img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                                <li><a href="#" class="nav_a">마이페이지</a></li>
                                <li><a href="#">회원정보변경</a></li>
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
                                    &emsp;<img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_field.png"><span>나의 관심분야</span><br><br>
                                </dt>
                            </dl>
                            <dl>
                                <dt>
                                    &emsp;<img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_field.png"><span>나의 일정관리</span>
                                </dt>
                            </dl>        
                        </div>
                        <div class="rightArea">
                            <ul>
                                <li>
                                    <a href="#"><img src="../img/icons8-하트-50.png" alt="찜"><span class="txt">장바구니</span>
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
                                    <a href="#"><img src="https://culture.lotteshopping.com/LDCS/resources/normal/img/contents/icon_my_class_info02.png">
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
                                <th>성명</th>
                                <td style="padding-right: 554px;">${loginUser.memName }</td>
                                <th>생년월일</th>
                                <td>${loginUser.memBirthday }</td>
                            </tr>
                            <tr>
                                <th>휴대전화</th>
                                <td>${loginUser.memPhone }</td>
                                <th>E-mail</th>
                                <td>${loginUser.memEmail }</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td colspan="3">${loginUser.memAddress } ${loginUser.memDetailAddress }</td>
                            </tr>
                            <tr>
                                <th>문화센터 마케팅 수신동의</th>
                                <td><span class="bxCheck"><input type="checkbox"><label>E-mail</label></span>
                                <span class="bxCheck"><input type="checkbox"><label>SMS</label></span></td>
                                <td colspan="2"></td>
                            </tr>
                        </table>
                    </div> <!--class=memberInfo-->

                    <div class="btnArea">
                        <a href="#"><span>회원정보 확인 및 수정</span></a>
                        <a href="#"><span><span>비밀번호 변경</span></span></a>
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
                            <input type="hidden" id="carNoOld" value="">
                            <p>
                                <label for="" style="font-size: 16px;color: #222;text-align: left;padding: 11px 5px 10px 5px;height: 66px;font-weight: normal;">차량번호</label>
                                <input type="text" maxlength="20" id="" value="${loginUser.memCarno }">
                        		
                                <label for="">차량번호 수집동의</label>
                                <span><input type="checkbox"></span>
                                <a href="#" class="btn btnType04 btnBlack"><span>저장</span></a>
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
                    <a href="#">악수문화센터 탈퇴하기</a>
                </div>
            </div><!--inner-->
        </div> <!-- id=content-->
    </div>

     <!--footer-->
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>