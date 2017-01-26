<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>views/board/total_board.jsp</title>
<!-- <jsp:include page="/myresource.jsp"></jsp:include> -->
</head>
<style>
	.contents6{
		top: 100px;
		height: 800px;
		text-align: center;
	}
	
	@MEDIA (max-width: 992px) {
		.contents6{
			width: 870px;
		}
	}
	.findForm{
		margin: 0 auto;
		width: 600px;
	}
</style>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="contents6">
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
				<c:if test="${id } ne null">
	        	<button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom">댓글</button> 
	   			</c:if>
	   			<c:if test="${id } eq ${tmp.writer }">
	   			<button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom">수정</button> 
	   			<button type="button" class="w3-btn w3-theme-d3 w3-margin-bottom">삭제</button> 
	   			</c:if>
	   		</div>
			</c:forEach>
	


	
	<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="total_board.do?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="total_board.do?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="total_board.do?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="total_board.do?pageNum=${endPageNum+1 }">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a class="muted" href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<form action="total_board.do" method="post" id="keywordForm">
		<div class="findForm form-group">
			<div class="col-xs-2">
				<label class="label-control" for="condition">검색 조건</label>
			</div>
			<div class="col-xs-3">
				<select class="form-control" name="condition" id="condition">
					<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
					<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				</select>
			</div>
			<div class="col-xs-5">
			<input class="form-control" type="text" name="keyword" placeholder="검색어" 
				value="${keyword }"/>
			</div>
			<button type="submit" class="btn btn-md">검색</button>
		</div>
	</form>
	</div>
	</div>
</div>
</body>
</html>
















