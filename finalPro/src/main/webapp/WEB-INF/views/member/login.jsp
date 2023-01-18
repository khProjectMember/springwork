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
    <link rel="stylesheet" href="resources/css/login.css">
      
    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="js/exam(kangho).js"></script>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    
<style>

    .idpwSearch{
        display: flex;
        justify-content: center;
    }
</style>
</head>
    
    <body>  
     <!--header--> 
 	<jsp:include page="../common/header.jsp"/>
	
	<!-- body -->
    <div id="main">
        <div id="container">
        <div id="content" class="login">
        <h2>로그인</h2>
        <a href="#" target="_blank" title="새창" class="logo">
        <img src="resources/img/moonhwa.png" alt="문화회관" style="margin-right:-10px; margin-top:5px;" >
        </a>        
            <form action="login.me" method="post" id="loginFrm">
                <fieldset style="border:0;">
                    <legend class="skip">로그인양식</legend>
                    <ul class="loginList" style="padding-top:30px;">
                        <li>
                            <input id="memId" name="memId" type="text" title="아이디또는 이메일 입력" placeholder="아이디를 입력해주세요.">
                        </li> 
                        <li>
                            <input id="memPw" name="memPw" type="password" title="비밀번호를 입력" placeholder="비밀번호를 입력해주세요." autocomplete="off">
                        </li> 
                    </ul>
                    <div class="btm">
                        <p>
                            <label>
                                <input type="checkbox" name="login_y" id="login_y">
                                <span>자동로그인</span>
                            </label>
                        </p>                      
                    </div>
                    <button type="submit" id="login_btn">로그인</button>
                </fieldset>
            </form>
            

            <form action="${ contextPath }/login.me" method = "post">
            <div class="idpwSearch">
                <a id="dFindId" href="findId.me" title="아이디찾기" target="_blank">
                    <span>아이디찾기</span>
                </a>
            </form>

            <form action="${ contextPath }/login.me">
                <a id="dFindPw" href="findPwd.me" title="비밀번호찾기" target="_blank">
                    <span>비밀번호찾기</span>
                </a>
            </div>
            </form>
            <div class="loginTip">
                <dl>
                    	악수문화센터에 처음 오셨나요?   
                </dl>             
                <dd>
                    	수강신청 관련 서비스를 이용하시려면
                    <br>
                    	회원가입 해주세요.
                </dd>
                
                <a href="enrollForm.me" title="회원가입" class="btn btnType01 btnBlue">
                    <span>회원가입</span>
                </a>
            </div>        
        </div>
    </div>
    </div>
    <!--footer-->
  	<jsp:include page="../common/footer.jsp"/>
</body>
</html>