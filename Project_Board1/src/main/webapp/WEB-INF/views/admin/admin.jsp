<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/admin/admin.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
</head>
<body>
<h3>관리자 페이지</h3>
<p>유저 목록</p>
<button id="usersListBtn">목록보기</button>
<table id="listTable" style="display: none;" border="1">
	<thead>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>email</th>
			<th>gender</th>
			<th>phone</th>
			<th>regdate</th>
			<th>작성한 글</th>
		</tr>
	</thead>
	<tbody id="pp">
		
	</tbody>
</table>
<script>
	$("#usersListBtn").click(function(){
	
		$.ajax({
			url:"usersListAjax.do",
			method:"post",
			dataType:"JSON",
			success:function(data){
				$("#listTable").show();
				$("#pp").children().remove();
				for(var i = 0; i<data.length; i++){
					$("<tr>").appendTo("#pp");
					$("<td/>").appendTo("#pp").text(data[i].id);
					$("<td/>").appendTo("#pp").text(data[i].name);
					$("<td/>").appendTo("#pp").text(data[i].email);
					$("<td/>").appendTo("#pp").text(data[i].gender);
					$("<td/>").appendTo("#pp").text(data[i].phone);
					$("<td/>").appendTo("#pp").text(data[i].regdate);
					$("<td/>").appendTo("#pp").text(data[i].getBoardCount+" 개");
					$("</tr>").appendTo("#pp");
				}
			}
		});		
	});
</script>
</body>
</html>