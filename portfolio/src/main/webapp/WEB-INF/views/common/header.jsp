<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<c:set var="contextPath" value ="${pageContextPath.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header-container">
		<ul>
		<a href="${contextPath}/member/loginFrm">로그인</a></ul>
		<ul><a href="${contextPath}/member/logout">로그아웃</a></ul>
		<ul>개념정리
			<li>
				<a href="${contextPath}/study/spring">스프링</a>
			</li>
			<li>
				<a href="${contextPath}/study/db">DB</a>
			</li>
			<li>
				<a href="${contextPath}/study/html">HTML</a>
			</li>
			<li>
				<a href="${contextPath}/study/css">CSS</a>
			</li>
			<li>
				<a href="${contextPath}/study/javascript">JAVASCRIPT</a>
			</li>
			<li>
				<a href="${contextPath}/study/algorithm">ALGORITHM</a>
			</li>
			<li>
				<a href="#">그외</a>
			</li>
		</ul>
		<ul>게시판
			<li><a href="${contextPath}/study/project">프로젝트</a></li>
			<li><a href="#">게시판(싱글톤)</a></li>
			<li><a href="#">게시판(싱글톤)</a></li>
			<li><a href="#">게시판(싱글톤)</a></li>
		</ul>
</div>
</body>
</html>