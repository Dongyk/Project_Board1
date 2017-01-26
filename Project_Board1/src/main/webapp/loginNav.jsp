<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 로그인 창 -->
<a id="login-link" title="Login" href="#login">
	<c:choose>
		<c:when test="${empty id }">로그인</c:when>
		<c:otherwise>${id }님</c:otherwise>
	</c:choose>	
</a>
   <div id="login-panel" style="width: 300px;">
   	<c:choose>
   		<c:when test="${empty id }">
    		<form action="${pageContext.request.contextPath }/users/signin.do" method="post">
	            <label>아이디: <input type="text" name="id" style="color: black;"/> </label>
	            <label>비밀번호: <input type="password" name="pwd" style="color: black;"/> </label>
	            <button type="submit" class="btn" style="color: black;">로그인</button>
	            <p>If you're not a user click sign up!</p><button id="signupBtn" class="btn" type="submit" style="color: black;">회원가입</button> <small>Press ESC to close</small>
	        </form>
   		</c:when>
   		<c:otherwise>
   			<form action="${pageContext.request.contextPath }/users/signout.do" method="post">
    			<input class="col-xs-4" type="submit" name="submit" id="infoBtn" value="내 정보" style="color: black;" />
    			<input class="col-xs-4" type="submit" name="submit" value="로그아웃" style="color: black;"/>
    			<input class="col-xs-4" type="submit" name="submit" id="msgBtn" value="메세지함" style="color: black;"/>
   			</form>
   		</c:otherwise>
   	</c:choose>
       
   </div>
<!-- Header -->
<header class="head">
	<div class="box">
		<img src="${pageContext.request.contextPath }/resources/image/3.png">
	</div>
</header>
<!-- navi bar -->
<nav class="cd-stretchy-nav">
	<a class="cd-nav-trigger" href="#0">
		<span aria-hidden="true"></span>
	</a>
	<ul>
		<li><a href="${pageContext.request.contextPath }/board/total_board.do"><span style="color:#008299;">전체보기</span><i></i></a></li>
		<li>
			<c:choose>
				<c:when test="${empty id }">
					<a href="javascript:login()"><span style="color:#008299;">메시지</span><i></i></a>
					<script></script>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/users/messageform.do"><span style="color:#008299;">메시지</span><i></i></a>
				</c:otherwise>
			</c:choose>
		</li>
		<li><a href="${pageContext.request.contextPath }/board/gallery.do"><span style="color:#008299;">갤러리</span><i></i></a></li>
		<li><a href="${pageContext.request.contextPath }/board/board1.do?b_group=1"><span style="color:#008299;">게시판1</span><i></i></a></li>
		<li><a href="${pageContext.request.contextPath }/board/board1.do?b_group=2"><span style="color:#008299;">게시판2</span><i></i></a></li>
		<li><a href="${pageContext.request.contextPath }/board/board1.do?b_group=3"><span style="color:#008299;">게시판3</span><i></i></a></li>
	</ul>
	<span aria-hidden="true" class="stretchy-nav-bg"></span>
</nav>
<script>
	$("#signupBtn").click(function(){
		location.href="${pageContext.request.contextPath }/users/signupform.do";
		return false;
	});
	
	$("#infoBtn").click(function(){
		location.href="${pageContext.request.contextPath }/users/private/infoform.do?id=${id}"
		return false;
	})
	
	$("#msgBtn").click(function(){
		location.href="${pageContext.request.contextPath }/users/msgboxform.do?id=${id}";
		return false;
	});
	
	function login(){
            $("#login-panel").slideToggle(200);
            $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    }
	
	function pagestart() {
		window.setTimeout("pagereload()", 300000);
	}
	function pagereload() {
		location.reload();
	}
	$("body").attr("onload","pagestart()");

</script>