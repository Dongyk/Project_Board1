<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>users/signup.jsp</title>
<jsp:include page="/myresource.jsp"></jsp:include>
<style>
	.contntview{
		top: 350px;
		height: 800px;	
	}
	.contents6{
		text-align: center;
	}
	#signup{
		width: 200px;
	}
	
	.phone-div input[type="text"]{
		width: 70px;
	}
	.phone-div option{
		width: 90px;
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
			<div id="signup"><h4>회원가입</h4></div>
			<form action="signup.do" class="form-horizontal" method="post">
				<fieldset>
	
			<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="user_name">이름</label>  
				  		<div class="col-xs-4">
				  			<input id="user_name" name="name" type="text" placeholder="이름" class="form-control input-md" required/>
				  			<span class="help-block">이름을 입력하세요.</span>  
				  		</div>
					</div>
	
				<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="emailadress">Email</label>  
				  		<div class="col-xs-4">
				  			<input id="emailadress" name="email" type="text" placeholder="Email" class="form-control input-md" required/>
				  			<span class="help-block">Email 주소를 입력하세요.</span>  
				  		</div>
					</div>
	
				<!-- Text input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="user_id">ID</label>  
				  		<div class="col-xs-3">
				  			<input id="user_id" name="id" type="text" placeholder="ID" class="form-control input-md" required/>
				  			<span class="help-block">사용할 ID를 입력하세요.</span>  
				  		</div>
				  		<input type="button" class="btn btn-primary col-xs-1" onclick="javascript:idCheck()" value="중복확인"/>
					</div>
	
				<!-- Password input-->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="passwordinput">비밀번호</label>
				  		<div class="col-xs-4">
				    		<input id="passwordinput" name="pwd" type="password" placeholder="비밀번호" class="form-control input-md" required/>
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
				  			<select name="gender" id="sex" class="form-control" required>
								<option value="남자" selected>남자</option>
								<option value="여자">여자</option>
							</select>	
								<span class="help-block">성별을 선택하세요.</span>
						</div>	
					</div>	
	
	
				<!-- Text input-->
					<div class="form-group phone-div">
				  		<label class="col-xs-4 control-label" for="phonenum">핸드폰번호</label>
				  		<div class="col-xs-2" style="margin: 0;">  
				  			<select name="phone1" id="phone1" class="form-control" required>
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="070">070</option>
							</select>
						</div>
						<div class="col-xs-1"><input id="phone2" name="phone2" type="text" class="form-control" onkeypress="javascript:onlyNumber()" required /></div>	
						<div class="col-xs-1"><input id="phone3" name="phone3" type="text" class="form-control" onkeypress="javascript:onlyNumber()" required/></div>				  		 
					</div>
	
				<!-- Button -->
					<div class="form-group">
				  		<label class="col-xs-4 control-label" for="signup_recruiter"></label>
				  		<div class="col-xs-4">
				    		<button id="signup_recruiter" name="signup_recruiter" class="btn btn-primary">가입완료</button>
				  		</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script>
	function onlyNumber(){
		if((event.keyCode < 48) || (event.keyCode > 57)){
			alert("휴대폰번호에 숫자만 입력해 주세요");
			$("#phone2,#phone3").val("");
			event.returnValue = false;
		}
	}
		
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
		function idCheck(){
			var inputId = $("#user_id").val();
			if(inputId ==""){
				alert("아이디를 입력해주세요");
				$("#user_id").focus();
			}else{
				$.ajax({
				url:"idcheck.do",
				method:"get",
				dataType:"JSON",
				data:{inputId:inputId},
				success:function(data){
					if(data.canUse){
						alert("사용할 수 없습니다.");
					}else{
						alert("사용할 수 있습니다.");
					}
				}
			});
			}
		}
</script>
</body>
</html>