 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />   	
<!-- 댓글의 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right"></button>
				</div>
				<div class="panel-body">
					<ul class="chat">
						<!--  ajax로 데이터를 가져와서 chat에 empty()를 이용해서 비운다음 append로 -->
					</ul>
				</div>
				<div class="panel-footer" id="footer_pagination">
				</div>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<textarea rows="3" name="reply" class="form-control" id="modalReply"></textarea>
				</div>
				<div class="form-group">
					<label>Replyer</label>
					<input name="replyer" class="form-control id="modalReplyer">
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-warning" id="modalUpdateBtn">Update</button>
				<button class="btn btn-danger" id="modalDeleteBtn">Delete</button>
				<button class="btn btn-primary" id="modalRegisterBtn">Register</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
			</div>
		</div>
			
		</div>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>