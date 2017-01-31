<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
</head>
<body>
<form action="upload_comm.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="writer" id="writer" value="${id }"/><br/>
	<input type="hidden" name="b_group" id="b_group" value="${b_group }"/>
	<label for="writer">작성자</label>
	<input type="text" value="${id }" disabled/><br/>
	<label for="title">제목</label>
	<input type="text" name="title" id="title"/><br/>
	<label for="content">내용</label>
	<textarea name="content" id="content" cols="50" rows="10"></textarea>
	<label for="image">첨부파일</label>
	<input type="file" name="mFile" id="image"/>
	<br/>
	<button type="submit">저장</button>
</form>
</body>
</html>