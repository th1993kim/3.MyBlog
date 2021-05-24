<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- List 사이즈 , 개행문자 처리  --%>
<% pageContext.setAttribute("replaceChar","\n"); %>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.detailTable pre{
	margin:0;
}

</style>
<script>
	//이전페이지 가기 함수
	function goBack(){
		window.history.back();
	}
	
	$(function(){
		//버튼클릭시 이전페이지 가기
		$('#beforPageButton').click(function(){
			goBack();				
		});
	});
	
</script>
</head>
<body>
	<div class="studyDetail-container">
		<table class="detailTable">
			<tr>
				<th>글 제목</th><td>${study.study_title}</td>
			</tr>
			<tr>
				<th>작성일</th><td>${study.study_date}</td>
			</tr>
			<tr>
				<th>작성자</th><td>${study.member_id}</td>
			</tr>
			
			<c:set var="listSize" value="${max_order_length}" /> <!-- for문 돌릴 size구하기 -->
			<c:forEach var ="i" begin="0" end="${listSize}" step="1">
				<c:forEach var="scontent" items="${scontentList}">
					<c:if test="${scontent.scontent_order_no==i}" >
						<tr>
							<td colspan="2">
								<pre style="color:${scontent.scontent_color};font-size:${scontent.scontent_size};font-weight:${scontent.scontent_weight};">${scontent.scontent_content}</pre>
							</td>
						</tr> 
					</c:if>
				 </c:forEach>
				 <c:forEach var="simg" items="${simgList}">
				 	<c:if test="${simg.simg_order_no==i}">
				 		<tr>
				 			<td colspan="2">
				 				<img src="${simg.simg_name}" style="width:${simg.simg_width};height:${simg.simg_height};">
				 			</td>
				 		</tr>
				 	</c:if>
				 </c:forEach>
			</c:forEach>
		</table>
		<input type="button" id="beforPageButton" value="이전 페이지">
		<input type="button" id="studyModify" value="수정하기" onClick="location.href='${contextPath}/study/studyModifyForm?study_no=${study.study_no}'">
	</div>
</body>
</html>