<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 시간,숫자 형식 --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style>
/* 글쓰기 위치 */
.studyWrite{
	float:right;
	margin: 20px auto;
}
/* 검색창 위치 */
.searchPosition{
	text-align:center;
}
/* 페이징 처리 위치  */
.pagingPosition{ 
	text-align:center; 
	margin: 20px; 
}
.btnNone{
	background-color: black !important;
}
.listTable a{
	text-decoration: none;
	color:black;
}
.listTable a:hover{ 
	color:skyblue;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="studyWrite"> 
		<input type="button" value="글쓰기" class="inputBtn btn btn-outline-secondary" onClick="location.href='${contextPath}/study/studyWriteForm?so_no=${search.so_no}&dae_no=${search.dae_no}'" />
	</div>
	<div class="studyList-container">
		<form id="studyDelete" action="/study/delete" method="get">
			<table class="listTable table">
				<thead class="thead-dark">
					<tr>
						<th><input type="checkBox" class="checkAll"></th>
						<th>글번호</th>
						<th>작성자</th>
						<th>글제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${studyList}" var="study">
					<tr>
						<td><c:if test="${!empty loginMember}"><input type="checkBox" class="check" name="board_no" value="${study.study_no}"></c:if> </td>
						<td>${study.study_no}</td>
						<td>${study.member_id}</td>
						<td><a href="${contextPath}/study/studyDetail?study_no=${study.study_no}">${study.study_title}</a></td>
						<td>
							<fmt:formatDate type="date" pattern="yyyy년 MM월 dd일" value="${study.study_date}" ></fmt:formatDate>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<input type="submit"  value="삭제" id="deleteBtn" class="btn btn-outline-danger" />
		</form>
	</div>
	<div class="searchPosition">
		<form action="${contextPath}/study/studyList"> 
			<input type="hidden" name="so_no" value="${search.so_no}" />
			<input type="hidden" name="dae_no" value="${search.dae_no}" />
			<input type="hidden" name="dae_no" value="${search.currentPage}" />
			<input type="text" placeholder="글제목을 입력하세요" name="search_title" />
			<input type="submit" value="검색" class="btn btn-dark">
		</form>
	</div>
	<div class="pagingPosition">
		<div class="btn-group">
		 	<c:if test="${studyPage.total!=0}"> 
		 		<!-- 페이징 처리 11페이지보다 클때 이전 누르면 10페이지 앞으로온다.(앞의 끝페이지) -->
		 		<c:if test="${studyPage.currentPage>=11}">
		 				<a class="btn btn-secondary" href="${contextPath}/study/studyList?currentPage=${studyPage.startPage-1}&dae_no=${search.dae_no}&so_no=${search.so_no}&search_title=${search.search_title}">&lt;&lt;</a>
		 		</c:if>
		 		
		 		<c:forEach begin="${studyPage.startPage}" end="${studyPage.endPage}" step="1" var="i"> 
		 			<c:if test="${studyPage.currentPage!=i}">
		 				<a class="btn btn-secondary" href="${contextPath}/study/studyList?currentPage=${i}&dae_no=${search.dae_no}&so_no=${search.so_no}&search_title=${search.search_title}">${i}</a>
		 			</c:if>
		 			<c:if test="${studyPage.currentPage==i}">
		 				<span class="btn btn-secondary btnNone">${i}</span>
		 			</c:if>
		 		</c:forEach>
		 		<!-- 페이징 처리 총페이지가 끝페이지보다 클때 10페이지 앞으로 간다. 다음 10페이지영역의 첫페이지로 간다. -->
		 		<c:if test="${studyPage.endPage<studyPage.totalPage}">
		 				<a class="btn btn-secondary" href="${contextPath}/study/studyList?currentPage=${studyPage.endPage+1}&dae_no=${search.dae_no}&so_no=${search.so_no}&search_title=${search.search_title}">&gt;&gt;</a>
		 		</c:if>
		 	</c:if>
		</div>
	</div>
	
</body>
</html>