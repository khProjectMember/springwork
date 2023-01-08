<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강좌목록</title>
<link rel="stylesheet" href="resources/css/lect_list3.css">
</head>
<body>
<jsp:include page="common/header.jsp" />

<form id="" method="" action="" enctype="multipart/form-data">
	<div id="wrap">
	     <div id="content">
	          <div class="inner">
				 <div class="container">
    <h1>강좌 목록</h1>
    <nav>
      <a class="tit-now" href="javascript:void(0)">필터1</a>
      <a class="tit-notOpen" href="javascript:void(0)">필터2</a>
      <a class="tit-boxoffice" href="javascript:void(0)">필터3</a>
    </nav>

    <ul class="cont-movie">
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="">
        <strong class="movieTitle">
          	강좌 1
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>판타지</dd>
          <dt>평점</dt>
          <dd>9.05</dd>
          <dt>개봉</dt>
          <dd>2021.03.27</dd>
          <dt>출연</dt>
          <dd>라이캣, 소울곰, 개리씨</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>

      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="눈떠보니 코딩테스트 전날">
        <strong class="movieTitle">
          눈떠보니 코딩테스트 전날
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>스릴러</dd>
          <dt>평점</dt>
          <dd>8.25</dd>
          <dt>개봉</dt>
          <dd>2021.04.01</dd>
          <dt>출연</dt>
          <dd>자바독, 개리씨, 빙키</dd>
        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="파이썬 부트캠프">
        <strong class="movieTitle">
          파이썬 부트캠프
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>드라마</dd>
          <dt>평점</dt>
          <dd>8.77</dd>
          <dt>개봉</dt>
          <dd>2021.04.12</dd>
          <dt>출연</dt>
          <dd>캣, 파이, 썬, 뮤라</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="파이큐티의 사랑">
        <strong class="movieTitle">
          파이큐티의 사랑
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>로맨스</dd>
          <dt>평점</dt>
          <dd>8.81</dd>
          <dt>개봉</dt>
          <dd>2021.04.08</dd>
          <dt>출연</dt>
          <dd>파이썬, 큐티</dd>
        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="NGINX의 춤">
        <strong class="movieTitle">
          NGINX의 춤
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>드라마</dd>
          <dt>평점</dt>
          <dd>9.88</dd>
          <dt>개봉</dt>
          <dd>2021.04.15</dd>
          <dt>출연</dt>
          <dd>NGINX, 노션</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="어쩌다 밋업">
        <strong class="movieTitle">
          어쩌다 밋업
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>드라마</dd>
          <dt>평점</dt>
          <dd>9.25</dd>
          <dt>개봉</dt>
          <dd>2021.04.17</dd>
          <dt>출연</dt>
          <dd>라이캣, 자바독, 소울곰</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="파이게임 어드벤처">
        <strong class="movieTitle">
          파이게임 어드밴처
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>판타지액션</dd>
          <dt>평점</dt>
          <dd>8.56</dd>
          <dt>개봉</dt>
          <dd>2021.04.05</dd>
          <dt>출연</dt>
          <dd>개리씨, 파이썬</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>
      <li class="item-movie">
        <img src="resources/img/ex1.jpg" alt="MBIT는 내 운명">
        <strong class="movieTitle">
          MBIT는 내 운명
        </strong>
        <dl>
          <dt>개요</dt>
          <dd>로맨스</dd>
          <dt>평점</dt>
          <dd>9.02</dd>
          <dt>개봉</dt>
          <dd>2021.04.12</dd>
          <dt>출연</dt>
          <dd>라이캣,개리씨, 자바독</dd>

        </dl>
        <div class="cont-btn">
          <button class="btn-ticket">예매하기</button>
          <button class="btn-teaser">예고편</button>
        </div>
      </li>

    </ul>
  </div>
	          </div>
	     </div>
	</div>
</form>

<jsp:include page="common/footer.jsp" />
</body>
</html>