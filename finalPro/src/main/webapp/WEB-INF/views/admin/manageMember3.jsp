<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>회원 관리</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    
    <!-- Bootstrap core CSS -->
	<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.category {
		margin-bottom: 50px;
	}
	.deleteMember:hover {
		cursor: pointer;
		text-decoration: underline;
		font-weight: bold;
	}
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
	}
	
	@media ( min-width : 768px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}
	
	.btn-danger { -
		-bs-btn-bg: #CD5C5C !important;
	}
	
	.btn-outline-danger { -
		-bs-btn-color: #CD5C5C !important; -
		-bs-btn-border-color: #CD5C5C !important; -
		-bs-btn-hover-color: #fff; -
		-bs-btn-hover-bg: #CD5C5C !important; -
		-bs-btn-hover-border-color: #CD5C5C !important; -
		-bs-btn-focus-shadow-rgb: 220, 53, 69; -
		-bs-btn-active-color: #fff; -
		-bs-btn-active-bg: #CD5C5C !important; -
		-bs-btn-active-border-color: #CD5C5C !important; -
		-bs-btn-active-shadow: inset 0 3px 5pxrgba(0, 0, 0, 0.125); -
		-bs-btn-disabled-color: #CD5C5C !important; -
		-bs-btn-disabled-bg: transparent; -
		-bs-btn-disabled-border-color: #CD5C5C !important; -
		-bs-gradient: none;
	}
	table tr {
		text-align: center;
	}
	
	.form-select {
    	display: inline-block !important;
    	width: 10%;
    }
    .form-control {
    	display: inline-block;
    	width: 30% !important;
    }
</style>

    
    <!-- Custom styles for this template -->
    <link href="resources/assets/dist/css/dashboard.css" rel="stylesheet">
</head>
<body>
	<header class="navbar navbar-expand-lg navbar-light bg-light shadow-lg sticky-top">
		<div class="container-xxl">
			<a href="${contextPath }/" class="navbar-brand align-middle">
				<h3 class="m-0">
					<img src="resources/image/logo.png" alt="Logo" height="36px">
					<span class="text-danger">CINETALK</span>
				</h3>
			</a>
			<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
			  <span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-nav">
			   	<div class="nav-item text-nowrap">
			    	<a class="nav-link px-3" href="#">Sign out</a>
			   	</div>
			</div>
		</div>
	</header>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
          			<li class="nav-item">
			            <a class="nav-link" aria-current="page" href="${contextPath }/admin.ad">
							<span data-feather="home"></span>
							대시보드
			            </a>
          			</li>
          			<li class="nav-item">
			            <a class="nav-link active" aria-current="page" href="${contextPath }/manageMember.ad">
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
          			<li class="nav-item">
			            <a class="nav-link" aria-current="page" href="${contextPath }/manageReport.ad">
							<span data-feather="home"></span>
							신고 관리
			            </a>
					</li>
				</ul>
		</div>
	</nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<div>
			<h1 style="color:#CD5C5C">회원 관리</h1>
			<h6 class="text-muted">${mCount }명의 회원이 있습니다.</h6>
		</div>
	</div>
	<form action="${contextPath }/searchMember.ad">
		<select name="category" class="form-select" aria-label="Default select example" width="30">
			<option selected value="all">전체</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="nickName">닉네임</option>
		</select>
		<input class="form-control me-2" type="search" name="searchValue" placeholder="Search" aria-label="Search" required>
		<button class="btn btn-outline-danger" type="submit">Search</button>
	</form><br>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">가입일자</th>
				<th scope="col">작성한 리뷰</th>
				<th scope="col">가입상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${mList }" varStatus="r">
				<tr class="member">
					<td class="id">${m.id }</td>
					<td>${m.name }</td>
					<td>${m.nickName }</td>
					<td>${m.enrollDate }</td>
					<td>${rCountList[r.index] }</td>
					<td>
						<c:if test="${m.status eq 'Y' }">
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-outline-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								정상회원
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">상세정보 조회</a></li>
								<li><a class="dropdown-item deleteMemberButton" data-bs-toggle="modal" data-bs-target="#deleteMemberModal">
									회원탈퇴<span style="display:none">${m.id }</span>
								</a></li>
							</ul>
						</div>
						</c:if>
						<c:if test="${m.status eq 'N' }">
							<button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" disabled>
								탈퇴회원
							</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<!-- 모달 -->
	<div id="deleteMemberModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원탈퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>정말 회원을 탈퇴시키시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">탈퇴취소</button>
					<form action="${contextPath }/deleteMember.ad" method="post">
						<input type="hidden" name="id">
						<button id="modalDeleteButton" type="button" class="btn btn-sm btn-outline-danger">회원탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	</main>
	
	<script>
		const trs = $(".member");
		for(const tr of trs) {
			// 회원 상세정보 조회
			tr.addEventListener("click", function(){
// 				console.log($(this).find(".id").text());
			});
		}
		// 회원 탈퇴 정보 넘기기
		const btns = $(".deleteMemberButton");
		for(const btn of btns) {
			btn.addEventListener("click", function(){
				const id = $(this).find("span").text();
				$("input[name=id]").val(id);
			});
		}
		
		// 회원 탈퇴
		$("#modalDeleteButton").on("click", function(){
			$("form").submit();
		});
	</script>

	<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="resources/dist/js/dashboard.js"></script>
</body>
</html>