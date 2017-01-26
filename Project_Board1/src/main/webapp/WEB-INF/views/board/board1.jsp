<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>views/board/board1.jsp</title>
</head>
<style>
	.contents6{
		top: 100px;
		height: 800px;
	}
	
	@MEDIA (max-width: 992px) {
		.contents6{
			width: 870px;
		}
	}
	
	.newBtn{
		margin-top: 10px;
		margin-left: 10px;
	}
</style>
<jsp:include page="/myresource.jsp"></jsp:include>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="contents6">
			<button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom newBtn" onclick="location.href='insertform.do?b_group=${b_group}'">새글 추가</button>	  
	    	<c:forEach var="tmp" items="${list }">
	    	<div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
	        	<span class="w3-right w3-opacity">${tmp.regdate }</span> <!--//작성 시간 출력-->
	        	<h4>${tmp.writer } 님 ${tmp.title }</h4><br>
	       		<hr class="w3-clear">
	        	<p>${tmp.content }</p>
	        	<c:set var="tmp1" value="${fn:substring(tmp.image, fn:length(tmp.image)-4, fn:length(tmp.image)-3)}"/>
	    		<c:set var="tmp2" value="${fn:substring(tmp.image, fn:length(tmp.image)-5, fn:length(tmp.image)-4)}"/>
	    		<c:if test="${tmp1 eq '.'}">
	          	<div class="imgContents">
					<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
				</div><br/><br/>
				</c:if>
				<c:if test="${tmp2 eq '.'}">
	          	<div class="imgContents">
					<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
				</div><br/><br/>
				</c:if>
	        	<button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom" onclick="commend();">댓글</button> 			
	   			<button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom" onclick="location.href='board_update.do?num=${tmp.num}';">수정</button> 
	   			<button type="button" class="w3-btn w3-theme-d3 w3-margin-bottom" onclick="location.href='board_delete.do?num=${tmp.num}';">삭제</button> 
	   		</div>
			</c:forEach>
			
				<input type="hidden" id="hasParam" value="${param }">
				<button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom addBtn"
				onclick="location.href='board1.do?b_group=${b_group }&endPageNum=${endPageNum+1 }'">더보기</button>   
	   	</div>   
	</div>
</div>
</body>
<script>
function commend(){
//	$(".commend_div").hide();
	alert($(this).val());
};
function update(){
	
};
function del(){
	
};
</script>
</html>