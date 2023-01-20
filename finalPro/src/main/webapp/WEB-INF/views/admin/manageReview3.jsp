<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>리뷰 관리</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    
    <!-- Bootstrap core CSS -->
	<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.category {
		margin-bottom: 50px;
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
			            <a class="nav-link" aria-current="page" href="${contextPath }/manageMember.ad">
							<span data-feather="home"></span>
							회원 관리
			            </a>
          			</li>
          			<li class="nav-item">
			            <a class="nav-link active" aria-current="page" href="${contextPath }/manageReview.ad">
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
			<h1 style="color:#CD5C5C">리뷰 관리</h1>
			<h6 class="text-muted">${rCount }개의 리뷰가 있습니다.</h6>
		</div>
	</div>
	<form action="${contextPath }/searchReview.ad">
		<select name="category" class="form-select" aria-label="Default select example" width="30">
			<option selected value="all">전체</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input class="form-control me-2" type="search" name="searchValue" placeholder="Search" aria-label="Search" required>
		<button class="btn btn-outline-danger" type="submit">Search</button>
	</form><br>
	<input type = "button" value = "삭제" class = "btn btn-outline-danger" onclick="deleteValue();">
	<table class="table">
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">리뷰번호</th>
				<th scope="col">작성자</th>
				<th scope="col">영화</th>
				<th scope="col">별점</th>
				<th scope="col">제목</th>
				<th scope="col">작성일자</th>
			</tr>
		</thead>
		<tbody class="newReviewList">
			<c:forEach items="${rList }" var="r" varStatus="m">
				<tr class="review">
					<td><input name = "selectDelete" type = "checkbox" value = "${r.boardId }"/></td>
					<td class="boardId">${ r.boardId }</td>
					<td class="nickName">${r.nickName }</td>
					<td class="movieTitle">${mList[m.index] }</td>
					<td class="movieRating">${r.movieRating }</td>
					<td class="boardTitle"><a href="<c:url value='/movieReviewDetail.re?boardId=${r.boardId}&writer=${r.nickName}&movieTitle=${mList[m.index]}'/>">${r.boardTitle }</a></td>
					<td class="createDate">${r.createDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	</main>
	
	<script>
		/* const trs = $(".review");
		for(tr of trs) {
			tr.addEventListener("click", function(){
				console.log($(this).find(".boardId").html());
				const boardId = $(this).find(".boardId").text();
				const writer = $(this).find(".nickName").text();
				const movieTitle = $(this).find(".movieTitle").text();
				location.href = "${contextPath}/movieReviewDetail.re?boardId="+boardId+"&writer="+writer+"&movieTitle="+movieTitle;
			});
		} */
		
		function deleteValue() {
			var deleteArr = new Array(); //삭제할 리뷰 리스트
			var list = $("input[name='selectDelete']"); //체크된 리스트
			//console.log(list);
			for(var i = 0; i < list.length; i++) {
				if(list[i].checked) {
					deleteArr.push(list[i].value); //boardId 값 들어감
					//console.log(deleteArr);
				}
			}
			if(deleteArr.length == 0) {
				alert('선택된 글이 없습니다.');
			} else {
				var msg = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url: "${contextPath}/deleteMovieReview.ad",
					type: 'POST',
					data: {
						deleteArr: deleteArr
					},
					success: function(data) {
						alert("삭제되었습니다.");
						history.go(0);
					}
				});
			}
		}
	</script>
	

	<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="resources/dist/js/dashboard.js"></script>
</body>
</html>