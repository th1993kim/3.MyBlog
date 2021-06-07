<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style>
.login-container{
	border:2px outset gray;
	width: 500px;  
	height:300px;
	margin: 0 auto;
	display:flex;
	justify-content: center;
	font-family: 'Open Sans';
	align-items:center; 
}
.inText{
	width:350px;
	height:40px;
	border:1px solid gray;
	margin:5px;
	border-radius: 5px;
}
.inButton{
	width:350px;
	height:45px;
	font-weight:600;
	font-size:25px;
	margin:5px;
	border-radius: 5px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login-container" data-aos="fade-up">
		<form id="loginForm" action="${contextPath}/member/login" method="post">
			<div class="id-container">
			  <input type="text" name="member_id" class="inText id" placeholder="아이디를 입력하세요" />
			</div>
			<div class="pwd-container">
				<input type="text" name="member_pwd" class="inText pwd" placeholder="비밀번호를 입력하세요" />
			</div>
			<div class="login-button">
				<input type="submit" value="Login" name="login" class="inButton btn-primary"/>			
			</div>
		</form>
	</div>
</body>
</html>