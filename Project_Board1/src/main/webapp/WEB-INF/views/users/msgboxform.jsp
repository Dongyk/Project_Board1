<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>msgboxform.jsp</title>
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
	.reTable {
		float: left;
		width: 100%;
		display: none;
	}
	.sendTable{
		float: left;
		width: 100%;
		display: none;
	}
</style>
</head>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="m_contents"><br />
		<button id="mBtn" onclick="toggle()" class="btn btn-md">받은 메세지함</button>
			<div class="reTable">
				<h3>받은 메세지함</h3>
				<table class="table table-bordered">
					<tr>
						<th>보낸 아이디</th>
						<th>내용</th>
					</tr>
					<c:forEach var="tmp" items="${list }">
						<c:choose>
							<c:when test="${tmp.from_id eq id }">
							
							</c:when>
							<c:otherwise>
								<tr>
									<td>${tmp.from_id }</td>
									<td>${tmp.msg }</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</div>	
			<div class="sendTable">
				<h3>보낸 메세지함</h3>
				<table class="table table-bordered">
					<tr>
						<th>내용</th>
						<th>보낸 아이디</th>
					</tr>
					<c:forEach var="tmp" items="${list }">
						<c:choose>
							<c:when test="${tmp.to_id eq id }">
							
							</c:when>
							<c:otherwise>
								<tr>
									<td>${tmp.msg }</td>
									<td>${tmp.from_id }</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	function toggle(){
		if($("#mBtn").text() == "보낸 메세지함"){
			$("#mBtn").text("받은 메세지함");
			$(".sendTable").css("display","inline");
			$(".reTable").css("display","none");
		}else{
			$("#mBtn").text("보낸 메세지함");
			$(".reTable").css("display","inline");
			$(".sendTable").css("display","none");
		}
		
	}
</script>
</body>
</html>