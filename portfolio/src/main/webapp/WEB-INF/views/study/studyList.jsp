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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="studyList-container">
		<form id="studyDelete" action="/study/delete" method="get">
			<table class="listTable">
				<tr>
					<th><input type="checkBox" class="checkAll"></th>
					<th>글번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${studyList}" var="study">
					<tr>
						<td><c:if test="${!empty loginMember}"><input type="checkBox" class="check" name="board_no" value="${study.study_no}"></c:if> </td>
						<td>${study.study_no}</td>
						<td>${study.member_id}</td>
						<td><a href="${contextPath}/study/studyDetail?study_no=${study.study_no}">${study.study_title}</a></td>
						<td>${study.study_date}</td>  
					</tr>
				</c:forEach>
			</table>
			<input type="submit"  value="삭제" id="deleteBtn" />
		</form>
	</div>
	<div>
		<form action="${contextPath}/study/studyList"> 
			<input type="hidden" name="so_no" value="${search.so_no}" />
			<input type="hidden" name="dae_no" value="${search.dae_no}" />
			<input type="text" placeholder="글제목을 입력하세요" name="search_title" />
			<input type="submit" value="검색">
		</form>
	</div>
	<div>
	 페이징처리
	</div>
	<div> 
		<input type="button" value="글쓰기" class="inputBtn" onClick="location.href='${contextPath}/study/studyWriteForm?so_no=${search.so_no}&dae_no=${search.dae_no}'" />
	</div>
</body>
</html>