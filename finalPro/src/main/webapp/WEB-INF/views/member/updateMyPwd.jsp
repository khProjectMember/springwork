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

<style>

	* {
	    box-sizing: border-box;
	    font-family: "Noto Sans KR", sans-serif;
	}
</style>
    <script>

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

          <h2 class="mb-3">비밀번호 수정</h2>

          <!-- 폼시작 -->
          <form method="post" action="updateMyPwdInfo.me" id="updateForm" name="updateForm">
            
            <!-- 아이디 -->
            <div class="mb-3">
              <label for="memId">아이디</label>
              <input type="text" name="memId" id="memId" class="form-control" style="width:315px" value="${ loginUser.memId}" maxlength="12" readonly>
              <font id="checkResult" style="font-size:0.8em; display:none"></font>
            </div>

            <!-- 이전 비밀번호 -->
            <div class="mb-3">
              <label for="currentPwd">이전 비밀번호</label>
              <input type="password" id="currentPwd" name="currentPwd" class="form-control" placeholder="비밀번호 찾기에서 발급받은 임시비밀번호를 입력해주세요." style="width:435px" required>
              
            </div>

            <!-- 새 비밀번호 -->
            <div class="mb-3">
              <label for="memPw">새 비밀번호</label>
              <input type="password" id="memPw" name="newPwd" class="form-control" placeholder="영문자, 숫자, 특수문자로 총 8~15자로 입력해주세요." style="width:435px;" required>
              <font id = "pwdMsg" size = "2"></font>
            </div>
            
			      <div class="mb-3">
              <label for="memRpw">비밀번호 확인</label>
              <input type="password" id="memRpw" name="memRpw" class="form-control" placeholder="위의 비밀번호와 일치하게 입력하시오." style="width:435px;" required>
              <font id = "pwdError" size = "2"></font>
            </div>
            

            <hr style="width:435px;">
            
            <!-- 가입완료 버튼 -->
            <button class="btn btn-primary btn-lg btn-block" type="submit" style="background-color: #434950; border-color : #d9dcdf; width:438px;">수정 완료</button>
            <button class="btn btn-primary btn-lg btn-block" type="reset" style="background-color: #434950; border-color : #d9dcdf; width:438px;">다시 쓰기</button>
            </form> <!--form class="enrollForm"-->
            
    </div> <!--class="container"-->
  </div><!--id="main"-->
</div>
  <!--footer-->
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>