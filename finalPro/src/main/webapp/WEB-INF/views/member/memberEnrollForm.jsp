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

    <!-- css -->
    <link rel="stylesheet" href="../css/exam.css">
    <!--<link rel="stylesheet" href="../css/memberEnrollForm.css">-->
    <!-- <link rel="stylesheet" href="../css/exam research(kangho).css"> -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="../js/exam research(kangho).js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

    <script>
    
      // 주소찾기 기능
      function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
				document.getElementById('memZipcode').value = data.zonecode;
				/* document.getElementById('addr').value = data.roadAddress; */
				/* document.getElementById('addr').value = data.jibunAddress; */
				/* document.getElementById('addr').value = roadAddr; 로도 쓸 수 있음 (변수 roadAddr 설정)  */
				roadAddr = data.roadAddress;
				jibunAddr = data.jibunAddress;
				extraAddr = '';
				
				if(roadAddr != ''){
					if(data.bname != '') { // bname =동이름
						extraAddr += data.bname;
					}
					if(data.buildingName != '') {
						extraAddr += (extraAddr != '') ? ', ' +	data.buildingName : data.buildingName;
					}
					
					roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
					document.getElementById('memAddress').value = roadAddr;
				} else if(jibunAddr != '') {
					document.getElementById('memAddress').value = jibunAddr;
				}
				enrollForm.memDetailAddress.focus();
	        }
	    }).open();
	}
      //아이디 중복체크
      //<!-- idCheck ajax -->
    	$(function(){
    		const $idInput = $("#enrollForm input[name=memId]");
    		$idInput.keyup(function(){
    			// 최소 5글자 이상 입력되었을때만 ajax요청하도록 함
				if($idInput.val().length >= 5) {
					$.ajax({
						url:"idCheck.me",
						data: {checkId:$idInput.val()}, //key: checkId, value: $idInput.val()
						success: function(result){
							if(result == "NNN"){
								$("#checkResult").show();
								$("#checkResult").css("color","#f82a2aa3").text("중복된 아이디가 존재합니다. 다시 입력해 주세요");
								$("#enrollForm :submit()").attr("disabled",true);
							} else {
								$("#checkResult").show();
								$("#checkResult").css("color","#199894b3").text("사용가능한 아이디입니다.");
								$("#enrollForm :submit()").attr("disabled",false);
							}
						},
						error:function(){
							console.log("아이디 중복체크 ajax통신 실패");
						}
					});
				} else{ // 5글자 보다 작았으면
					$("checkResult").hide();
					$("#enrollForm :submit()").attr("disabled", true);
				}
    			
    		})
    	})
    	
    	// 닉네임 중복체크
    	$(function(){
    		const $nickNameInput = $("#enrollForm input[name=memNickname]");
    		$nickNameInput.keyup(function(){
    			// 최소 2글자 이상 입력되었을때만 ajax요청하도록 함
				if($nickNameInput.val().length >= 2) {
					$.ajax({
						url:"nicknameCheck.me",
						data: {checkNickname:$nickNameInput.val()}, //key: checkId, value: $nickNameInput.val()
						success: function(result){
							if(result == "NNN"){
								$("#checkNickResult").show();
								$("#checkNickResult").css("color","#f82a2aa3").text("중복된 닉네임이 존재합니다. 다시 입력해 주세요");
								$("#enrollForm :submit()").attr("disabled",true);
							} else {
								$("#checkNickResult").show();
								$("#checkNickResult").css("color","#199894b3").text("사용가능한 닉네임입니다.");
								$("#enrollForm :submit()").attr("disabled",false);
							}
						},
						error:function(){
							console.log("닉네임 중복체크 ajax통신 실패");
						}
					});
				} else{ // 3글자 보다 작았으면
					$("checkNickResult").hide();
				
					$("#enrollForm :submit()").attr("disabled", true);
				}
    			
    		})
    	})
    	
    	//비밀번호 유효성 검사
    	$(function() {
    		$('#memPw').on('focus', function() {
    			$('#pwdMsg').html('최소 8 자 이상, 하나 이상의 문자와 숫자를 포함해 주세요.<br>');
    		});
    		
    		$('#memPw').focusout(function() {
    			var pwd = $('#memPw').val();
          var reg = /^[a-z\d!@#$%^&*]{8,15}$/i;
        		if(!reg.test(pwd)) {
    				$('#pwdMsg').attr('color', '#f82a2aa3');
        			return false;
        		} else {
        			$('#pwdMsg').html('');
        		}
    		});
    	});


      //비밀번호 일치검사
      $(function() {
    		$('#memPw').keyup(function() {
    			$('#pwdError').html('');
    		});
    		$('#memRpw').keyup(function() {
    			if($('#memPw').val() != $('#memRpw').val()) {
    				$('#pwdError').html('비밀번호 불일치<br>');
    				$('#pwdError').attr('color', '#f82a2aa3');
    				$('#memRpw').css('outline', 'red');
    				return false;
    			} else {
    				$('#pwdError').html('비밀번호 일치<br>');
    				$('#pwdError').attr('color', '#199894b3');
    			}
    		});
    		
    		
    	});
    </script>

</head>

<body>
  <!--header--> 
  <jsp:include page="../common/header.jsp"/>
    
  <!--body-->
  <div id="main">
    <div class="container" style="width:700px; padding-left:170px;">

      <div class="input-form-backgroud row" style="margin-top:50px;">
        <div class="input-form col-md-12 mx-auto">

          <h2 class="mb-3">회원가입</h2>

          <!-- 폼시작 -->
          <form method="post" action="insert.me" id="enrollForm" name="enrollForm">

            <!-- 아이디 -->
            <div class="mb-3">
              <label for="memId">* 아이디</label>
              <input type="text" name="memId" id="memId" class="form-control" style="width:315px" placeholder="최소 5글자 이상 입력해주세요." maxlength="12" required>
              <!--  <input type="button" value="ID중복확인"  class="form-control" style="width:115px; margin-top: -38px; margin-left:320px";>-->
              <font id="checkResult" style="font-size:0.8em; display:none"></font>
              
            </div> 

            <!--유효성 검사-->
            <div class="invalid-feedback">
             	 이름을 입력해주세요.
            </div>
            
            <!-- 성명 -->
            <div class="mb-3">
              <label for="memName">* 성명</label>
              <input class="form-control" id="memName" name="memName" style="width:315px" required>
            </div>

            <!-- 닉네임 -->
            <div class="mb-3">
              <label for="memNickname">* 닉네임</label>
              <input class="form-control" id="memNickname" name="memNickname" style="width:315px" placeholder="최소 2글자 이상 입력하세요." required>
              <font id="checkNickResult" style="font-size:0.8em; display:none"></font>
              
              
              <!-- <input type="button" value="중복확인"  class="form-control" style="width:115px; margin-top: -38px; margin-left:320px";>-->
              <input type="hidden" name="idbtncheck" value="idUncheck"> 
            </div>
            
            <!-- 비밀번호 -->
            <div class="mb-3">
              <label for="memPw">* 비밀번호</label>
              <input type="password" id="memPw" name="memPw" class="form-control" placeholder="영문자, 숫자, 특수문자로 총 8~15자로 입력해주세요." style="width:435px" required>
              <font id = "pwdMsg" size = "2"></font>
            </div>

            <!-- 비밀번호 확인-->
            <div class="mb-3">
              <label for="memRpw">* 비밀번호 확인</label>
              <input type="password" id="memRpw" name="memRpw" class="form-control" placehoder="위의 비밀번호와 일치하게 입력하시오." style="width:435px" required>
              <font id = "pwdError" size = "2"></font>
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
              <label for="memEmail">* 이메일</label>
              <input type="email" class="form-control" id="memEmail" name="memEmail" placeholder="aksumoonwha@moonwha.com" style="width:300px"required>
              
              
              <!--<input type="button" value="이메일 인증"  class="form-control" style="width:130px; margin-top: -38px; margin-left:305px";>
              <input type="hidden" name="idbtncheck" value="idUncheck">-->
            </div> <!--class="mb-3"-->

            <!--유효성 검사-->
            <div class="invalid-feedback">
                	이메일을 입력해주세요.
            </div>
            
            <!-- 우편번호 -->
            <div class="mb-3">
              <label for="memZipcode">* 우편번호</label>
              <input name="zipcode" class="form-control" id="memZipcode" name="memZipcode" style="width:300px;" readonly>
              <input type="button" class="form-control" value="우편번호 찾기" onClick="findAddr();" style="width:130px; margin-top: -38px; margin-left:305px;" >
            </div> <!--class="mb-3"-->

            <!--유효성 검사-->
            <div class="invalid-feedback">
              	주소를 입력해주세요.
            </div>
            
            <!-- 주소 -->
            <div class="mb-3">
              <label for="memAddress">주소<span class="text-muted"></span></label>
              <input type="text" class="form-control" id="memAddress" name="memAddress" placeholder="주소" style="width:438px;">
            </div>

            <!-- 상세주소 -->
            <div class="mb-3"> 
              <label for="memDetailaddress">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
              <input type="text" class="form-control" id="memDetailaddress" name="memDetailAddress" placeholder="상세주소를 입력해주세요." style="width:438px">
            </div>

            <!-- 생년월일 -->
            <div class="mb-3"> 
              <label for="memBirthday">생년월일<span class="text-muted">&nbsp;</span></label>
              <input type="text" class="form-control" id="memBirthday" name="memBirthday" placeholder="주민번호 앞자리 여섯자리를  입력해주세요." style="width:438px">
            </div>

            <!-- 휴대전화 -->
            <div class="mb-3">
              <label for="memPhone">휴대전화</label>
              <input type="text" id="memPhone" name="memPhone" placeholder="휴대전화번호를 입력해주세요." class="form-control" style="width:438px" >            
            </div>

            <!--성별-->
            <div class="mb-3">
              	성별<br>
              <input type ="radio" id ="Male" name = "memGender" value="M" checked>
              	<label for="Male">남</label>&emsp;&emsp;&emsp;&emsp;&emsp;
              <input type ="radio" id ="Female" name = "memGender" value="F">
              	<label for="Female">여</label>
            </div>

            <!-- 서류첨부 -->
            <div class="mb-3">
                <label for="memPaper">* 취약계층 유형(필요시)</label><br>
                <select name="memPaper" id="memPaper">
                  <option value="1">해당없음</option>
                  <option value="2">65세 이상 고령자</option>
                  <option value="3">장애인</option>
                  <option value="4">한부모가정 보호대상자</option>
                  <option value="5">저소득자</option>
                  <option value="6">고용촉진장려금 지급대상 청년</option>
                  <option value="7">범죄구조피해자</option>
                  <option value="8">그밖에 고용노동부장관이 인정한 자</option>
                </select>
                <!--<input type="file" name="memPaper" id="memPaper">-->
                <!-- <input type="button" value="서류첨부"  class="form-control" style="width:440px;"> -->
            </div>

        </div> <!--class="input-form col-md-12 mx-auto"-->
      </div> <!--class="input-form-backgroud row"-->

      <!--hidden 부분-->
      <input type="hidden" name="memStatus" value="Y">
      <input type="hidden" name="isAdmin" value="N">
      <input type="hidden" name="memCarno" value="서울12가3456">


            <hr style="width:435px;">
  			
            <!-- 가입완료 버튼 -->
            <button class="btn btn-primary btn-lg btn-block" type="submit" style="background-color: #434950; border-color : #d9dcdf; width:438px;">가입 완료</button>
            <button class="btn btn-primary btn-lg btn-block" type="reset" style="background-color: #434950; border-color : #d9dcdf; width:438px;">다시 쓰기</button>
            </form> <!--form class="enrollForm"-->
            
    </div> <!--class="container"-->
  </div><!--id="main"-->

  <!--footer-->
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>