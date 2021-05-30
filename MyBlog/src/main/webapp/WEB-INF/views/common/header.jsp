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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
.header-container{
	max-width:1180px;
	width:90%;
	margin: 0 auto 100px auto;
	display:flex;
	
}
.hide{
	display:none;
} 
.header-container ul,li{
 	list-style: none;
} 
.firstUl > li{ 
  display:inline-block;
  position:relative;
  margin: 10px;
  left:700px;
  cursor:pointer;
}
.firstUl > li:hover{
	color: skyblue; text-decoration: none;
}
.header-container a{
	color:black;
} 
.header-container a:visited { 
	color: black; text-decoration: none;
} 
.header-container a:hover { 
	color: skyblue; text-decoration: none;
}

.secondUl{
	position:absolute;
	padding:0px; 
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$('.slidemenu').click(function(){
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
	<h1 class="homepage-name"><a href="${contextPath}/main">THweb</a></h1>
	<ul class="firstUl"> 
		<li>
			<h3>
			<c:if test="${empty loginMember}">		
					<a href="${contextPath}/member/loginForm">로그인</a>
			</c:if>
			<c:if test="${!empty loginMember}">	
					<a href="${contextPath}/member/logout">로그아웃</a> 
			</c:if>
			</h3>
		</li>
		<c:forEach items="${daeList}" var="dae" >
			<li class="slidemenu"><h3>${dae.dae_name}</h3>
				<ul class="study hide secondUl">
					<c:forEach items="${soList}" var="so" varStatus="i">
						<c:if test="${so.dae_no==dae.dae_no}">
						<li>
							<a href="${contextPath}/study/studyList?dae_no=${so.dae_no}&so_no=${so.so_no}">${so.so_name}</a>
						</li>
						</c:if> 
					</c:forEach>
				</ul>
			</li>
		</c:forEach>	
	</ul>
</div>
</body>
</html>