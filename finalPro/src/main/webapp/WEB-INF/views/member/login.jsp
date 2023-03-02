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

    <!-- css 지우지마세용 -->
    <link rel="stylesheet" href="resources/css/login1.css">
      
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
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div id="main">
                    <div id="container">
                        <div class="login">
                            <div class="headTitle">
                                <h2>로그인</h2>
                                <a href="#" target="_blank" title="새창" class="logo">
                                    <img src="resources/img/moonhwa.png" alt="문화회관" style="margin-right:-10px; margin-top:5px;" >
                                </a>
                            </div>
                            <form action="login.me" method="post" id="loginFrm">
                                <fieldset style="border:0;">
                                    <legend class="skip">로그인양식</legend>
                                    <ul class="loginList" style="padding-top:30px;">
                                        <li>
                                            <img src="resources/img/human.png" alt="사람모양">
                                            <input id="memId" name="memId" type="text" title="아이디또는 이메일 입력" placeholder="아이디를 입력해주세요.">
                                        </li> 
                                        <li>
                                            <img src="resources/img/secret.png" alt="쉿">
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
                            
            
                            
                            <div class="idpwSearch">
                                <form action="${ contextPath }/login.me" method = "post">
                                    <a id="dFindId" href="findId.me" title="아이디찾기" target="_blank">
                                        <span>아이디찾기</span>
                                    </a>
                                </form>
            
                                <form action="${ contextPath }/login.me">
                                    <a id="dFindPw" href="findPwd.me" title="비밀번호찾기" target="_blank">
                                        <span>비밀번호찾기</span>
                                    </a>
                                </form>
                            </div>
                            
                            
                                
                                    <!-- 카카오 로그인 지우지마세용!!
                                    <div class="col-lg-12 text-center mt-3">
                                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=93579955c5d3578c1d0e9bbe9e39cfdb&redirect_uri=http://localhost:8060/spring">
                                            <img alt="카카오로그인" src="resources/img/kakao_login_large_wide.png" onclick="kakaoLogin()">
                                    </a>
                                    </div>
                                    -->
                                
                            <!-- 카카오 로그인 지우지마세용!! -->
                            <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
                            <script type="text/javascript">
                                $(document).ready(function(){
                                    Kakao.init('63c59d1e89ba1a45783c818122143787');
                                    Kakao.isInitialized();
                                });
                            
                                function loginWithKakao() {
                                    Kakao.Auth.authorize({ 
                                    redirectUri: 'http://localhost:8060/spring/kakaoEnroll.me' 
                                    }); // 등록한 리다이렉트uri 입력
                                }
                                
                                
                            //카카오로그인(ajax)
                                function kakaoLogin(){
                                    $.ajax({
                                        url: '/kakaoEnroll.me',
                                        type: 'get',
                                        async: false,
                                        dataType: 'text',
                                        success: function (res) {
                                            location.href = res;
                                        }
                                    });
                                
                                }
                                
                                //카카오로그아웃  
                                function kakaoLogout() {
                                    if (Kakao.Auth.getAccessToken()) {
                                    Kakao.API.request({
                                        url: '/v1/user/unlink',
                                        success: function (response) {
                                            console.log(response)
                                        },
                                        fail: function (error) {
                                        console.log(error)
                                        },
                                    })
                                    Kakao.Auth.setAccessToken(undefined)
                                    }
                                }  
                            </script>
                            <div class="loginTip">
                                <dl>
                                        악수문화센터에 처음 오셨나요?   
                                </dl>             
                                <dd>
                                        수강신청 관련 서비스를 이용하시려면 회원가입 해주세요.
                                </dd>                                
                                <a href="enrollForm.me" title="회원가입" class="btn btnType01 btnBlue">
                                    <span>회원가입</span>
                                </a>
                            </div>        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--footer-->
  	<jsp:include page="../common/footer.jsp"/>
</body>
</html>