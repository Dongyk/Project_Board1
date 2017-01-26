<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<title>photogallery.html</title>
</head>
<style>
.w3-quarter img{margin-bottom: -6px; cursor: pointer}
.w3-quarter img:hover{opacity: 0.6; transition: 0.3s}
#modal01{
  opacity: 0.6%;
}
</style>
<jsp:include page="/myresource.jsp"></jsp:include>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="contents6">
	    	<c:forEach var="tmp" items="${list }">
	    	<c:set var="tmp1" value="${fn:substring(tmp.image, fn:length(tmp.image)-4, fn:length(tmp.image)-3)}"/>
	    	<c:set var="tmp2" value="${fn:substring(tmp.image, fn:length(tmp.image)-5, fn:length(tmp.image)-4)}"/>
	    	<c:if test="${tmp1 eq '.'}">
	    	<div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
				<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;"
				 onclick="onClick(this)" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
	   		</div>
	   		</c:if>
	    	<c:if test="${tmp2 eq '.'}">
	    	<div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
				<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;"
				 onclick="onClick(this)" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
	   		</div>
	   		</c:if>
			</c:forEach>
	   	</div>   
	</div>
</div>

<div id="modal01" class="w3-modal w3-black w3-padding-0" onclick="this.style.display='none'">
    <span class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
</div>
<script>
function onClick(element) {
  	document.getElementById("img01").src = element.src;
  	document.getElementById("modal01").style.display = "block";
  	var captionText = document.getElementById("caption");
  	captionText.innerHTML = element.alt;
}
</script>	
</body>
</html>