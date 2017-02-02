<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>views/board/board1.jsp</title>
</head>
<style>
	.contents6{
		top: 100px;
		height: 800px;
	}
	
	@MEDIA (max-width: 992px) {
		.contents6{
			width: 870px;
		}
	}
	
	.newBtn{
		margin-top: 10px;
		margin-left: 10px;
	}

	.commend_list{
		
	}
</style>
<jsp:include page="/myresource.jsp"></jsp:include>
<body>
<div class="containers">
	<jsp:include page="/loginNav.jsp"></jsp:include>
	<div class="m_body">
		<div class="contents6">
		<c:if test="${!empty id }">
			<button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom newBtn" onclick="location.href='insertform.do?b_group=${b_group}'">새글 추가</button>	  
	    </c:if>
	    	<c:forEach var="tmp" items="${list }">
	    	<div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
	        	<span class="w3-right w3-opacity">${tmp.regdate }</span> <!--//작성 시간 출력-->
	        	<h4>${tmp.writer } 님 ${tmp.title }</h4><br>
	       		<hr class="w3-clear">
	        	<p>${tmp.content }</p>
	        	<c:set var="tmp1" value="${fn:substring(tmp.image, fn:length(tmp.image)-4, fn:length(tmp.image))}"/>
	    		<c:set var="tmp2" value="${fn:substring(tmp.image, fn:length(tmp.image)-5, fn:length(tmp.image))}"/>
	    		<c:if test="${tmp1 eq '.png' || tmp1 eq '.jpg'}">
	          	<div class="imgContents">
					<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
				</div><br/><br/>
				</c:if>
				<c:if test="${tmp2 eq '.jpeg'}">
	          	<div class="imgContents">
					<img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;" src="${pageContext.request.contextPath }/upload/${tmp.image}" />
				</div><br/><br/>
				</c:if>
				<div class="commend_div" style="display:none;">
					<input class="col-lg-6 col-md-6 col-sm-6 col-xs-6" type="text" id="content" name="content" maxlength="14"/>
					<button id="enrollBtn">등록</button>	
	   				
	   				
	   				<input type="hidden" id="writer" value="${id }"/>
	   				<input type="hidden" id="ref_group" value="${tmp.num }"/>
	   				<input type="hidden" id="target_id" value="${tmp.writer }"/>
				</div>
				<div class="commend_list" style="display:none;">
				
				</div>
				<c:if test="${id ne null}">
	        	<button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom" id="commBtn">댓글</button> 
	   			</c:if>
	   			<c:if test="${id eq tmp.writer }">
	   			<button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom" onclick="location.href='board_updateform.do?num=${tmp.num}';">수정</button> 
	   			<button type="button" class="w3-btn w3-theme-d3 w3-margin-bottom" onclick="location.href='board_delete.do?num=${tmp.num}';">삭제</button> 
	   			</c:if>
	   		
	   			
	   		</div>
			</c:forEach>
			<c:if test="${endPageNum lt endRowNum }">
				<input type="hidden" id="hasParam" value="${param }">
				<button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom addBtn"
				onclick="location.href='board1.do?b_group=${b_group }&endPageNum=${endPageNum+1 }'">더보기</button>   
   			</c:if>
	   	</div>   
	</div>
</div>
</body>
<script>
$("#commBtn").on('click', function(){
	var object = $(this).siblings(".commend_div");
	var ref_group = $(this).siblings(".commend_div").children("#ref_group").val();
	
	if(object.css("display") == "none"){

		object.show();
		$(this).siblings(".commend_list").show();
		$.ajax({
			url:"comm_list.do",
			method:"post",
			dataType:"JSON",
			data:{
				ref_group:ref_group			
			},
			success:function(data){
				console.log(data);
			}
			,error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
		
	}else{
		object.hide();
		$(this).siblings(".commend_list").hide();
	}	
});

$("#enrollBtn").on("click", function(){
	var object = $(this).parent().siblings(".commend_list");
	
	var writer = $(this).siblings("#writer").val();
	var ref_group = $(this).siblings("#ref_group").val();
	var target_id = $(this).siblings("#target_id").val();
	var content = $(this).siblings("#content").val();
	
	if(content != null && content != ""){
		$.ajax({
			url:"comm_insert.do",
			method:"get",
			dataType:"JSON",
			data:{
				writer:writer,
				ref_group:ref_group,
				target_id:target_id,
				content:content					
			},
			success:function(){
				$(this).siblings("#content").val("");
				object.append("<span>${id}"+content+
					"<a href=''>수정</a><a href=''>삭제</a></span>");
			}	
		});
	}else{
		alert("내용을 입력해주세요");
	}
});

</script>
</html>