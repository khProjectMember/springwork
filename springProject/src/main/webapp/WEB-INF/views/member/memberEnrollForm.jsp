<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                 <div class="form-group">
                    <label for="userId">* ID :</label>
                    <input class="form-control" id="userId" name="userId" placeholder="Please Enter ID"><br>
                    <div id="checkResult" style="font-size:0.8em; display:none;"></div>

                    <label for="userPwd">* Password:</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Password" required><br>

                    <label for="checkPwd">* Password Check :</label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Repassword" required><br>

                    <label for="userName">* Name :</label>
                    <input class="form-control" id="userName" name="userName" placeholder="Please Enter Name" required><br>

                    <label for="email">&ensp; Email :</label>
                    <input class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>

                    <label for="age">&ensp; Age :</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Please Enter Age"><br>

                    <label for="phone">&ensp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone(-없이)"><br>

                    <label for="address">&ensp; Address :</label>
                    <input class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>

                    &ensp; Gender : &emsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &emsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary disabled">회원가입</button>&emsp;
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    <script>
    	$(function(){
    		const $idInput = $("#enrollForm input[name=userId]");
    		$idInput.keyup(function(){
    			//최소 5글자 이상 입력되었을때만 ajax요청하게 함
    			if($idInput.val().length >= 5){
    				$.ajax({
    					url:"idCheck.me",
    					data:{checkId:$idInput.val()} ,
    					success:function(result){
    						if(result == "NNN"){
    							 $("#checkResult").show();
    							 $("#checkResult").css("color","red").text("중복된 아이디가 존재합니다. 다시 입력해 주세요");
    							 $("#enrollForm :submit").attr("disabled",true);
    						} else {
    							$("#checkResult").show();
    							$("#checkResult").css("color","green").text("멋진 아이디 입니다.");
    							$("#enrollForm :submit").attr("disabled",false);
    						}
    					},
    					error:function(){
    						console.log("아이디 중복체크 ajax통신 실패");
    					}
    				});
    			} else {
    				$("checkResult").hide();
    				$("#enrollForm :submit()").attr("disabled",true);
    			}
    		})
    	})
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>