<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>관리자 페이지</title>

    <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/"> -->
    
    <!-- Bootstrap core CSS -->
	<link href="resources/nak/assets/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="wrap">
	<div id="content">
		<div class="inner">
			<div class="container-fluid">
				<div class="row">
					<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
						<div class="position-sticky pt-3">
							<ul class="nav flex-column">
			          			<li class="nav-item">
						            <a class="nav-link active" aria-current="page" href="#">
										<span data-feather="home"></span>
										대시보드
						            </a>
			          			</li>
			          			<li class="nav-item">
						            <a class="nav-link" aria-current="page" href="${contextPath }/manageMember.ad">
										<span data-feather="home"></span>
										회원 관리
						            </a>
			          			</li>
			          			<li class="nav-item">
						            <a class="nav-link" aria-current="page" href="${contextPath }/manageReview.ad">
										<span data-feather="home"></span>
										리뷰게시판 관리
						            </a>
			          			</li><li class="nav-item">
						            <a class="nav-link" aria-current="page" href="${contextPath }/manageHangout.ad">
										<span data-feather="home"></span>
										모임게시판 관리
						            </a>
			          			</li>
							</ul>
							
							<!-- 
							<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
								<span>Saved reports</span>
								<a class="link-secondary" href="#" aria-label="Add a new report">
									<span data-feather="plus-circle"></span>
								</a>
			        		</h6>
			        		 -->
						<!-- 
						<ul class="nav flex-column mb-2">
							<li class="nav-item">
								<a class="nav-link" href="#">
									<span data-feather="file-text"></span>
									Current month
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">
									<span data-feather="file-text"></span>
									Current month
								</a>
							</li>
						</ul> 
						-->
						
					</div>
					</nav>
			
			    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
						<h1 style="color:#CD5C5C">대시보드</h1>
					</div>
					<div id="newMember" class="table-responsive category">
						<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
							<div>
								<h4>새로운 회원</h4>
								<h6 class="text-muted">${mCount }명의 새로운 회원이 있습니다.</h6>
							</div>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">닉네임</th>
									<th scope="col">가입일자</th>
									<th scope="col">작성한 리뷰</th>
								</tr>
							</thead>
							<tbody class="newMemberList">
								<tr>
									<td class="id"></td>
									<td class="name"></td>
									<td class="nickName"></td>
									<td class="enrollDate"></td>
									<td class="reviewCount"></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div id="newReview" class="table-responsive category">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
						<div>
							<h4>새로운 리뷰</h4>
							<h6 class="text-muted">${rCount }개의 새로운 리뷰가 있습니다.</h6>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">작성자</th>
								<th scope="col">별점</th>
								<th scope="col">제목</th>
								<th scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody class="newReviewList">
							<tr>
								<td class="boardId"></td>
								<td class="nickName"></td>
								<td class="movieTitle"></td>
								<td class="movieRating"></td>
								<td class="boardTitle"></td>
								<td class="createDate"></td>
							</tr>
						</tbody>
					</table>
				</div>
				</main>
				<script>
						$.ajax({
							url: "${contextPath}/selectNewMember.ad",
							success: (data)=>{
								var div = $('.newMemberList').clone();
								$(".newMemberList").html("");
								for(const m of data) {
									console.log(m);
									div.find('.id').text(m.id);
									div.find('.name').text(m.name);
									div.find('.nickName').text(m.nickName);
									div.find('.enrollDate').text(m.enrollDate);
									div.find('.reviewCount').text(m.reviewCount);
									
									
									$(".newMemberList").append(div.html());
								}
							},
							error: (data)=>{
								console.log(data);
							}
						});
						
						$.ajax({
							url: "${contextPath}/selectNewReview.ad",
							success: (data)=>{
								var div = $('.newReviewList').clone();
								$(".newReviewList").html("");
								for(const r of data) {
									div.find('.boardId').text(r.boardId);
									div.find('.nickName').text(r.nickName);
									div.find('.movieTitle').text(r.movieTitle);
									div.find('.movieRating').text(r.movieRating);
									div.find('.boardTitle').text(r.boardTitle);
									div.find('.createDate').text(r.createDate);
									
									$(".newReviewList").append(div.html());
								}
							},
							error: (data)=>{
								console.log(data);
							}
						});
				</script>
			
				<script src="resources/nak/assets/js/bootstrap.bundle.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
				<script src="resources/nak/assets/js/dashboard.js"></script>
				</div>
			</div>
	    </div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>