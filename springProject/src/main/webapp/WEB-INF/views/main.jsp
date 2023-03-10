<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="common/header.jsp" />
	
	<!-- 본문 -->
	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding: 5% 10%;">
            <h2>게시판Top5</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼 -->
           		<a class="btn btn-secondary" style="float:right" href="enrollForm.bo">글쓰기</a>
            	<br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 현재 조회수가 가장 높은 상위 5개를 조회하여 보여주기(ajax) -->
                </tbody>
            </table>
         </div>
    </div>
	
	<script type="text/javascript">
		$(function(){
			topBoardList();
			
			//동적으로 만들어진 요소는 이벤트 메소드 연동 불가
			/*
			$("boardList>tbody>tr").click(function(){
				location.href="detail.bo?bno="+ $(this).children().eq(0).text();
			});
			*/
			setInterval(topBoardList, 1000);
			$(document).on("click","#boardList>tbody>tr",function(){
				location.href="detail.bo?bno="+ $(this).children().eq(0).text();
			})
		});
		
		function topBoardList(){
			$.ajax({
				url:"topList.bo",
				success:function(list){
					let value = "";
					for(let i in list){
						value += "<tr>"
							   +	"<td>" + list[i].boardNo + "</td>"
							   +	"<td>" + list[i].boardTitle + "</td>"
							   +	"<td>" + list[i].boardWriter + "</td>"
							   +	"<td>" + list[i].count + "</td>"
							   +	"<td>" + list[i].createDate + "</td>"
							   +	"<td>";
							   if(list[i].originName != null){
								   value += "★";
							   }
						value += "</td></tr>";
					}
					$("#boardList tbody").html(value);
				},
				error:function(){
					console.log("조회수 top5게시글 조회 ajax통신 실패");
				}
			})
		}
	</script>
	
	<!-- footer -->
	<jsp:include page="common/footer.jsp" />
</body>
</html>