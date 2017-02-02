<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
</head>
<body>
<form action="board_update.do" method="post">
	<input type="hidden" name="num" id="num" value="${dto.num }" />
	<input type="hidden" name="writer" id="writer" value="${dto.writer }"/><br/>
	<input type="hidden" name="b_group" value="${dto.b_group }" />
	
	<label for="writer">작성자</label>
	<input type="text" value="${dto.writer }" disabled/><br/>
	<label for="title">제목</label>
	<input type="text" name="title" id="title" value="${dto.title }"/><br/>
	<label for="content">내용</label>
	<textarea name="content" id="content" cols="50" rows="10">${dto.content }</textarea>
	
	<c:set var="tmp1" value="${fn:substring(dto.image, fn:length(dto.image)-4, fn:length(dto.image)-3)}"/>
	<c:set var="tmp2" value="${fn:substring(dto.image, fn:length(dto.image)-5, fn:length(dto.image)-4)}"/>
	<c:if test="${tmp1 eq '.'}">
		<div class="imgContents">
			<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${dto.image}" />
		</div><br/><br/>
	</c:if>
	<c:if test="${tmp2 eq '.'}">
		<div class="imgContents">
			<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${dto.image}" />
		</div><br/><br/>
	</c:if>
	<button type="submit">저장</button>
</form>
</body>
</html>

























