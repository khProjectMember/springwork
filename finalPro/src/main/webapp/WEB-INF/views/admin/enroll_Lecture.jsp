<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
  	 
    .content2{
        width: 80%;
        margin: auto;
    }
    .innerOuter{
    	align: center;
        width: 80%;
        margin: auto;
        padding: 5% 10%;
        background:white;
    }
    #enrollForm>table{width: 100%; border: 1px solid lightgray; 
    background-color: rgb(247, 245, 245);}
    #enrollForm>table *{ margin:3px; padding: 6px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

	<div id="wrap">
		<div id="content">
			<div id="inner">
				<div class="content2">
					<div class="innerOuter">
						<h2>강좌 등록</h2>
            <br>

            <form id="enrollForm" method="post" action="lecinsert.le" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">강의명</label></th>
                        <td><input class="form-control" name="lecName" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의시작날짜</label></th>
                        <td><input class="form-control" name="lecSdate" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의종료날짜</label></th>
                        <td><input class="form-control" name="lecEdate" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의시작시간</label></th>
                        <td><input class="form-control" name="lecStime" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의종료시간</label></th>
                        <td><input class="form-control" name="lecEtime" required></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의횟수</label></th>
                        <td><input class="form-control" name="lecCount" required></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">강의사진</label></th>
                        <td><input type="file" class="form-control-file border" name="upfile"></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의대분류</label></th>
                          
                        <td><select id="select1" name="lecBcatg" onchange="itemChange(this)">
	                        	<option value="컴퓨터">컴퓨터</option>
							    <option value="언어">언어</option>
							    <option value="음식" >음식</option>
							    <option value="음악">음악</option>
                        	</select></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의소분류</label></th>
                        <td><select id="select2" name="lecScatg">
                        	 </select></td>
                    </tr>
                     <tr>
                        <th><label for="title">강의가격</label></th>
                        <td><input class="form-control" name="lecPrice" required></td>
                    </tr>
                    
                    <!--  <tr>
                        <th><label for="title">강의평점</label></th>
                        <td><input class="form-control" name="lecGrade" placeholder="평점" type="number" readonly ></td>
                    </tr> -->
                    
                   <!-- <tr>
                        <th><label for="title">접수인원</label></th>
                        <td><input class="form-control" name="lecJnum" required></td>
                    </tr>  -->
                    
                     <tr>
                        <th><label for="title">수강인원</label></th>
                        <td><input class="form-control" name="lecCnum" required></td>
                    </tr>
                    
                    <tr>
                   		<th><label for="title">강의설명</label></th>       
                        <td><textarea class="form-control" name="lecInfo" rows="10" cols="50" style="resize:none" required ></textarea></th>
                    </tr>
                    <tr>
                        <th><label for="title">강사</label></th>
                        	<td><select id="select3" name="teaNo">
                        			<c:forEach var="t" items="${tlist}">
	                        			<option value="${t.teaNo }">${t.teaName }</option>
									</c:forEach>
                        	</select></td>
                    </tr>
                    <tr>
                        <th><label for="title">강의실</label></th>
                        <td><select id="select4" name="locNo">
                        <c:forEach var="l" items="${Llist}">
                        		<option value="${l.locNo }">${l.locName }</option>
						</c:forEach>
                        	 </select></td>
                    </tr>
                   <!--  <tr>
                        <th><label for="title">강의실</label></th>
                        <td><select id="select4" name="locNo">
                        		<option value="1">다목적강의반</option>
                        		<option value="2">무궁화관</option>
							    <option value="3">진달래관</option>
							    <option value="4">개나리관</option>
							    <option value="5">장미관</option>
							    <option value="6">튤립관</option>
							    <option value="7">들국화관</option>
                        	 </select></td>
                    </tr> -->
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
	</div>
</div>
</div>
</div>
	<script>
          
		function itemChange(e) {

			var computer = [ "무관" ];
			var language = [ "무관", "영어", "일본어", "중국어" ];
			var food = [ "무관", "한식", "일식", "양식", "바리스타" ];
			var music = [ "무관", "피아노", "바이올린", "기타" ]
			var target = document.getElementById("select2");

			if (e.value == "컴퓨터")
				var d = computer;
			else if (e.value == "언어")
				var d = language;
			else if (e.value == "음식")
				var d = food;
			else if (e.value == "음악")
				var d = music;

			target.options.length = 0;

			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
 
</html>