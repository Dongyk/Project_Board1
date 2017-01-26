<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>messagesendform.jsp</title>
<jsp:include page="/myresource.jsp"></jsp:include>
<style>
	.contntview{
		top: 350px;
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
	<div class="contntview">
		<div class="contents6">
		<h4>메세지 보내기</h4>
			<form action="messagesend.do" class="form-horizontal" method="post">
			<fieldset>
				<div class="message_form" style="margin-left: 100px;">
				<!-- Text input-->
					<div class="form-group" >
						<input type="hidden" name="toId" value="${param.toId }"/>
						<div class="col-md-8">
				  			<input id="toId" type="text" class="form-control input-md" value="${param.toId }" disabled/>
				  		</div>
					</div>
		
				<!-- Text input-->
					<div class="form-group">
						<input type="hidden" name="fromId" value="${id }"/>
						<div class="col-md-8">
				  			<input id="fromId" type="text" class="form-control input-md" value="${id }" disabled/>
				  		</div>
					</div>
		
				<!-- Text input-->
					<div class="form-group">
						<div class="col-md-8">
							<textarea id="msg" name="msg" class="form-control" rows="3"></textarea>
						</div>
					</div>
						<!-- Button -->
					<div class="form-group">
				  		<div class="col-md-1">
				    		<button id="messageSendBtn" name="messageSendBtn" class="btn btn-primary">전송</button>
				  		</div>
					</div>
				</div>
			</fieldset>
			</form>
		</div>
	</div>
</div>
<script>
	$("#messageSendBtn").click(function(){
		if($("#msg") ==null){
			alert("메세지를 입력하세요!");
			return false;
		}
		else{
			return true;
		}
	});
</script>
</body>
</html>