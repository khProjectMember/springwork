<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>樂受文化 악수문화센터</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/serviceReply.css">


</head>
<body>
<jsp:include page="../common/header.jsp" />   
  
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="list" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">고객센터</a></li>
                            <li><a href="#">고객게시판</a></li>
                        </ul>                            
                    </div>                     
                </div>
                <div class="innersection">
                    <h2>고객게시판</h2>
                    <div class="notiBoxArea">
                        <ul>
                            <li>
                                · 1:1문의의 내용은 이메일에서 보실 수 있습니다.
                            </li>
                            <li>
                                · 자주하는문의에 없는 질문은 1:1문의를 해주시면 빠른 시일 안에 답변을 보내드리겠습니다.
                            </li>
                        </ul>
                        <a href="board.qa" class="btn btnBlack btnType04">
                        	<span>자주하는 문의보기</span>
                        </a>                        
                    </div>
                </div>
                <div class="basicDataTable mb30 inquiry">
                    <table>
                        <!-- <caption>1:1문의 목록</caption> -->
                            <colgroup>
                                <col style="width:20%%;">
                                <col style="width:auto;">
                                <col style="width:20%;">                          
                                <col style="width:20%;">                                
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">순서</th>                                 
                                    <th scope="col">제목</th>                                  
                                    <th scope="col">답변상태</th>
                                    <th scope="col">공개상태</th>
                                </tr>
                            </thead>
                            <tbody>
                               
		                            <c:choose>
	                                	<c:when test="${ empty list }">
	                                	 <tr>
	                                		<td colspan="4">등록된 1:1 문의가 없습니다.</td>
	                                	  </tr>
	                                	</c:when>                                	
	                                	<c:otherwise>
		                                	<c:forEach var="l" items="${ list }">
		                                	<tr>
			                                    <td>${l.qnaNo}</td>
			                                    <td><a href="qnaDetail.bo?qnaNo=${l.qnaNo}">${l.qnaTitle}</a></td>
			                                    <td>
			                                    <c:choose>                                                                         	
					                                <c:when test="${l.qnaReplyStatus == 1}">
					      							답변완료
					      							</c:when>
					      							<c:when test="${l.qnaReplyStatus == 0}">
					      							답변대기
					      							</c:when>                                   
											    </c:choose>
											    </td>
			                                    <td>
			                                    <c:choose>                                                                         	
					                                <c:when test="${l.qnaStatus == 1}">
					      							공개
					      							</c:when>
					      							<c:when test="${l.qnaStatus == 0}">
					      							비공개
					      							</c:when>                                   
											     </c:choose>
			                                    </td>
			                                </tr>	                               	
			                                </c:forEach>
	                                	</c:otherwise>
						          	</c:choose>						          
                               
                            </tbody>
                    </table>
                </div>
                     <div class="btnArea">
                    <div class="rightArea">                        
                            <button type="button" style="color:white; background:black; padding:13px;"onclick="location.href='sendQa.qa'">문의하기</button>
                    </div>
                </div>
            </div>            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
    	
          
    </script>
</body>
</html>