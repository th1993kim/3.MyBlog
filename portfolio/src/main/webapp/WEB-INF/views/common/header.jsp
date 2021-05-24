<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />

<%-- category DB가져옴  --%>
<tiles:importAttribute name="soList" />
<tiles:importAttribute name="daeList" />

<!DOCTYPE html>
<html>
<head>
<style>
.header-container{
	max-width:1180px;
	width:90%;
	margin: 0 auto;
}
@media screen and (min-width: 768px){
	.header-container{
	 display:flex;
	}
	.homepage-name{
		flex-grow: 1;
	}
} 
.hide{
	display:none;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$('.menu').click(function(){
		var submenu = $(this).children("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();
		}else{
			submenu.slideDown();  
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header-container">
	<h1 class="homepage-name">THweb</h1>
	<ul>
		<li>
			<c:if test="${empty loginMember}">		
				<ul>
					<a href="${contextPath}/member/loginForm">로그인</a>
				</ul>
			</c:if>
			<c:if test="${!empty loginMember}">	
				<ul>
					<a href="${contextPath}/member/logout">로그아웃</a> 
				</ul>
			</c:if>
		</li>
		<c:forEach items="${daeList}" var="dae" >
			<li class="menu"><h3>${dae.dae_name}</h3>
				<c:forEach items="${soList}" var="so" >
					<c:if test="${so.dae_no==dae.dae_no}">
						<ul class="study hide">
							<li>
								<a href="${contextPath}/study/studyList?dae_no=${so.dae_no}&so_no=${so.so_no}">${so.so_name}</a>
							</li>
						</ul>
					</c:if>
				</c:forEach>
			</li>
		</c:forEach>	
	</ul>
	
</div>
</body>
</html>