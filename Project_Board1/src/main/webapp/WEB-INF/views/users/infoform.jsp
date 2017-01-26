<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>users/infoform.jsp</title>
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
			<div id="signup"><h4>내정보</h4></div>
			<form action="info.do" class="form-horizontal" method="post">
				<fieldset>
	
			<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="user_name">이름</label>  
				  		<div class="col-xs-4">
				  			<input id="user_name" name="name" type="text" placeholder="이름" class="form-control input-md" value="${dto.name }" required/>
				  			<span class="help-block">이름을 입력하세요.</span>  
				  		</div>
					</div>
	
				<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="emailadress">Email</label>  
				  		<div class="col-xs-4">
				  			<input id="emailadress" name="email" type="text" placeholder="Email" class="form-control input-md" value="${dto.email }" required/>
				  			<span class="help-block">Email 주소를 입력하세요.</span>  
				  		</div>
					</div>
	
				<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="user_id">ID</label>  
				  		<div class="col-xs-3">
				  			<input type="hidden" name="id" value="${dto.id }"/>
				  			<input id="user_id" type="text" placeholder="ID" class="form-control input-md" value="${dto.id }" disabled/>
				  		</div>
					</div>
	
				<!-- Password input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="passwordinput">비밀번호</label>
				  		<div class="col-xs-4">
				    		<input id="passwordinput" name="pwd" type="password" placeholder="비밀번호" class="form-control input-md" value="${dto.pwd }" required/>
				    		<span class="help-block">비밀번호를 입력하세요.</span>
				  		</div>
					</div>
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="passwordcheck">비밀번호 확인</label>
				  		<div class="col-xs-4">
				    		<input id="passwordinput2" name="pwd2" type="password" placeholder="비밀번호 확인" class="form-control input-md" required/>
				    		<span class="help-block">비밀번호를 확인하세요.</span>
				  		</div>
					</div>
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="sex">성별</label>
				  		<div class="col-xs-2">  
				  				<input type="hidden" name="gender" value="${dto.gender }" />
								<input value="${dto.gender }" disabled/>
						</div>	
					</div>	
	
	
				<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="phonenum">핸드폰번호</label>
				  		<div class="col-xs-3">  
				  			<input type="text" value="${dto.name }" name="phone"/>
						</div>				  		 
					</div>
	
				<!-- Button -->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="signup_recruiter"></label>
				  		<div class="col-xs-4">
				    		<button id="signup_recruiter" name="signup_recruiter" class="btn btn-primary">수정완료</button>
				  		</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script src="../resource/js/jquery-3.1.1.js"></script> 
<script>
	$("#signup_recruiter").click(function(){
		if($("#passwordinput").val() != $("#passwordinput2").val()){
			alert("비밀번호를 확인해 주세요");
			$("#passwordinput").val("").focus();
			$("#passwordinput2").val("");
			return false;
		}else{
			return true;
		}
	});
</script>

</body>
</html>