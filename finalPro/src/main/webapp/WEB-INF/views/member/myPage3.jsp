<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

		<!-- myPage탈퇴기능 modal창 관련 부트스트랩에서 제공하고 있는 스타일 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<!-- myPage탈퇴기능 modal창 관련 부트스트랩에서 제공하고 있는 스크립트 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>

            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="userId">* ID :</label>
                    <input class="form-control" id="userId" name="userId" value="${loginUser.userId}" readonly><br>

                    <label for="userName">* Name : </label>
                    <input class="form-control" id="userName" name="userName" value="${loginUser.userName}" required><br>

                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${loginUser.email}"><br>

                    <label for="age"> &nbsp; Age:</label>
                    <input type="number" class="form-control" id="age" name="age" value="${loginUser.age}"><br>

                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${loginUser.phone}"><br>

                    <label for="address"> &nbsp; Address : </label>
                    <input class="form-control" id="address" name="address" value="${loginUser.address}"><br>

                    &nbsp; Gender: &emsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &emsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                    
                    <script>
                    	$(function(){
                    		if("${loginUser.gender}" != "") {
                    			$("input[value=${loginUser.gender}]").attr("checked",true);
                    		}
                    	})
                    </script>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>&emsp;
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
        <br><br>
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
                 		비밀번호 : <input type="password" name="userPwd" required>
              			<input type="hidden" name="userId" value="${loginUser.userId}">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
           
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>