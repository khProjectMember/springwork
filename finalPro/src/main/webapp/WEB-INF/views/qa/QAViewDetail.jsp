<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>樂受文化 악수문화센터</title>

<!-- css -->


<body>
<jsp:include page="../common/header.jsp" />	
		<div class="main" style="margin-top:55px;">
		<form id="frm" method="POST" action="updateQna.bo">
			<table>
				<ul>
				<li>				
					<label style="padding-left:500px;"><input type="hidden" name="qnaNo" value="${qna.qnaNo}"></label>			
				</li>
				<li>
				<label style="padding-left:500px;">제목</label> <input type="text" name="qnaTitle" value="${qna.qnaTitle}">
				</li>
				<li>
				<label style="padding-left:500px;">내용</label>
				<p>${qna.qnaContent}</p>
				</li>
				<div class="review_text" style="padding-left:955px;">
        			<div class="review_area">
            			<div class="home_btn" style="padding-10px;">
                    		<a href="list.qa" style="padding:10px; background:black; color:white; border:none; margin-right:5px;" >목록</button>
                			<a href="javascript:qaFrmno();" style="padding:10px; background:black; color:white; border:none; margin-right:5px;" >수정</button>
                			<a href="delete.bo?qnaNo=${qna.qnaNo}" id="delete" style="padding:10px;color:white;background:red; border:none;">삭제</a>
                		</div>
            		</div>
            	</div>
            	
            </table>
            <input type="hidden" name="qnaNo" value="${qna.qnaNo}">
            </ul>
        </form>
        </div>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
	  
 <script type="text/javascript">
  function qaFrmno(){
	  $('#frm').submit();
  }
  
  
  
</script>
<jsp:include page="../common/footer.jsp" />	

</body>
</html>