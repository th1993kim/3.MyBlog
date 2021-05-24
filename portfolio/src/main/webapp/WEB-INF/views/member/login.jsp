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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login-container">
		<form id="loginForm" action="${contextPath}/member/login" method="post">
			<div class="id-container">
				ID : <input type="text" name="member_id" class="inText id" placeholder="아이디를 입력하세요" />
			</div>
			<div class="pwd-container">
				PWD :<input type="text" name="member_pwd" class="inText pwd" placeholder="비밀번호를 입력하세요" />
			</div>
			<div class="login-button">
				<input type="submit" value="로그인" name="login" class=""/>			
			</div>
		</form>
	</div>
</body>
</html>