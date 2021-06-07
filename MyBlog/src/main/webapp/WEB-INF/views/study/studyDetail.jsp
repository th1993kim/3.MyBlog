<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- List 사이즈 , 개행문자 처리  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 시간,숫자 형식 --%>
<% pageContext.setAttribute("replaceChar","\n"); %>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.studyDetail-container{
	width:1180px;
	margin: 0 auto;
}
.detailTable pre{
	margin:0;
}
.textCenter{
}
.buttonAlign{ 
	text-align:center;
}
pre{ 
	font-family: 'Open Sans';
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
	<div class="studyDetail-container" data-aos="fade-up">
		<table class="detailTable table"> 
			<thead> 
				<tr class="font-weight-bold">
					<td>작성일</td><td><fmt:formatDate type="date" pattern="yyyy년 MM월 dd일" value="${study.study_date}" ></fmt:formatDate></td>
					<td>작성자</td><td>${study.member_id}</td> 
				</tr>
				<tr class="font-weight-bold"> 
					<td>글 제목</td><td colspan="3">${study.study_title}</td>
				</tr> 
			</thead>
			<tr> 
				<td class="textCenter" colspan="4">
					<c:set var="listSize" value="${max_order_length}" /> <!-- for문 돌릴 size구하기 -->
					<c:forEach var ="i" begin="0" end="${listSize}" step="1">
						<c:forEach var="scontent" items="${scontentList}">
							<c:if test="${scontent.scontent_order_no==i}" >
									<pre style="color:${scontent.scontent_color};font-size:${scontent.scontent_size};font-weight:${scontent.scontent_weight};">${scontent.scontent_content}</pre>
							</c:if>  
						 </c:forEach>
						 <c:forEach var="simg" items="${simgList}">
						 	<c:if test="${simg.simg_order_no==i}">
					 				<img src="${simg.simg_name}" style="width:${simg.simg_width};height:${simg.simg_height};">
						 	</c:if>
						 </c:forEach>
					</c:forEach>
			 	</td>
			</tr>  
		</table> 
		<div class="buttonAlign">
			<input type="button" id="beforPageButton" class="btn btn-outline-secondary" value="이전 페이지"> 
			<c:if test="${!empty loginMember}"><input type="button" id="studyModify" class="btn btn-outline-warning" value="수정하기" onClick="location.href='${contextPath}/study/studyModifyForm?study_no=${study.study_no}'"></c:if>
		</div>
	</div>
</body>
</html>