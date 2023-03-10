<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	table{width: 100%; }
    table *{ margin:5px;}
</style>
</head>
<body>
 	<jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right" href="list.bo">목록으로</a>
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="20%">제목</th>
                    <td colspan="3">${ b.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td width="30%">${ b.boardWriter }</td>
                    <th width="20%">작성일</th>
                    <td width="30%">${ b.createDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
	                    <c:choose>
	                    	<c:when test="${ b.originName }">
	                       		파일이 없습니다.
	                        </c:when>
	                        <c:otherwise>
	                        	<a href="${ b.changeName }" download="${ b.originName }">${ b.originName }</a>
	                        </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ b.boardContent }</p></td>
                </tr>
            </table>
            <br>
			
			<c:if test="${ loginUser.userId eq b.boardWriter }">
	            <div align="center">
	                <!---수정하기, 삭제하기 버튼은 이글이 본인 글일 경우만 보여져야됨 -->
	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
	            </div><br><br>
            </c:if>
            
            <!-- 수정, 삭제시 post방식으로 넘겨주기 -->
			<form action="" method="post" id="postForm">
				<input type="hidden" name="bno" value="${ b.boardNo }">
				<input type="hidden" name="filePath" value="${ b.changeName }">
			</form>
			
			<script>
				function postFormSubmit(num){
					if(num == 1){
						$("#postForm").attr("action","updateForm.bo").submit();
					} else {
						$("#postForm").attr("action","delete.bo").submit();
					}
				}
			</script>
			
            <!-- 댓글 기능 -->
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:choose>
                    		<c:when test="${ empty loginUser }">
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none" readonly>로그인한 사용자만 이용가능합니다.</textarea>
		                        </th>
		                        <th style="vertical-align: middle">
		                            <button class="btn btn-secondary" disabled>등록하기</button>
		                        </th>
	                        </c:when>
	                        <c:otherwise>
	                            <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none"></textarea>
		                        </th>
		                        <th style="vertical-align: middle">
		                            <button class="btn btn-secondary" onclick="addReply();">등록하기</button>
		                        </th>
	                        </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td colspan="3">댓글 (<span id="rcount">0</span>) </td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
    
    <!-- 댓글 ajax -->
	<script>
		$(function(){
			selectReplyList();
		})
		
		function selectReplyList(){
			$.ajax({
				url:"rlist.bo",
				data: {bno:${b.boardNo}},
				success:function(list){
					let value = "";
					for(let i in list){
						value += "<tr>"
							  +		"<th>" + list[i].replyWriter + "</th>"
							  +		"<th>" + list[i].replyContent + "</th>"
							  +		"<th>" + list[i].createDate + "</th>"
							  +	 "</tr>;"
					}
					$("#replyArea tbody").html(value);
					$("#rcount").text(list.length);
				},
				error:function(){
					console.log("댓글리스트 조회용 ajax 통신 실패");
				}
			});
		}
		function addReply(){
			if($("#content").val().trim().length != 0){
				$.ajax({
					url:"rinsert.bo",
					data: {
						refBno:${b.boardNo},
						replyContent:$("#content").val(),
						replyWriter:"${loginUser.userId}"
					},
					success: function(result){
						if(result == "success"){
							selectReplyList();
							$("#content").val("");
						}
					},
					error: function(){
						console.log("댓글작성 ajax 통신 실패")
					}
				});
			} else {
				alertify.alert("댓글 작성후 등록해주세요");
			}
		}
	</script>
	
    <jsp:include page="../common/footer.jsp" />
</body>
</html>