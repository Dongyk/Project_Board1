<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>messageform.jsp</title>
<jsp:include page="/myresource.jsp"></jsp:include>
<style>
.m_contents{
		top: 100px;
		height: 800px;	
	}
	.contents6{
		text-align: center;
	}
	
	@MEDIA (max-width: 992px) {
		.contents6{
			width: 870px;
		}
	}
</style>
</head>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="m_contents">
			<table class="table table-bordered">
				<tr>
						<th>아이디</th>
						<th>접속여부</th>
						<th>메세지보내기</th>
				</tr>
				<c:forEach var="tmp" items="${list }">
				<c:if test="${tmp.id ne id}">
					<tr>
						<td>${tmp.id }</td>
						<c:choose>
							<c:when test="${tmp.conn == 'login' }">
								<td style="background-color: #0f0"></td>
								<td><a href="${pageContext.request.contextPath }/users/messagesendform.do?toId=${tmp.id}">메세지쓰기</a></td>
							</c:when>
							<c:otherwise>
								<td style="background-color: #f00"></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<script>
	$("#signupBtn").click(function(){
		location.href="users/signupform.do";
		return false;
	});
	
	$("#infoBtn").click(function(){
		location.href="users/infoform.do?id=${id}"
		return false;
	})
	
	function login(){
            $("#login-panel").slideToggle(200);
    }
	
	function pagestart() {
		window.setTimeout("pagereload()", 60000);
	}
	function pagereload() {
		location.reload();
	}
	$("body").attr("onload","pagestart()");
		
</script>
</body>
</html>