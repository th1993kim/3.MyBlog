<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- List 사이즈 , 개행문자 처리  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 시간,숫자 형식 --%>
<% pageContext.setAttribute("replaceChar","\n"); %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<style>
.study h2{
	margin-left:150px;
} 
.studyItem{
	display:flex;
	flex-flow:row wrap; 
	justify-content: center;
}
.studyItem>table{
	width:400px; 
	margin:20px 30px; 
}
.table th,td{ 
	padding:6px 10px !important; 
}
.project h2{
	margin-left:150px;
}
.project-list{
	display:flex;
	padding:15px 150px; 
	justify-content: center;
	flex-flow:row wrap;
}
.card-img-top{
	padding:5px; 
	border-radius: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-container">
		<div class="study">
			<h2>STUDY</h2>
			<div class="studyItem">
				<table class="table table-bordered">
					<tr><th>JAVA</th></tr>
					<c:forEach items="${JAVAList}" var="java" >
						<tr>
							<td><a href="${contextPath}/study/studyDetail?study_no=${java.study_no}">${java.study_title}</a></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(JAVAList)<5}">
						<c:forEach begin="0" end="${4-fn:length(JAVAList)}" step="1">
							<tr><td>작성한글이 없습니다.</td></tr>  
						</c:forEach>
					</c:if>
				</table>
				<table class="table table-bordered">
					<tr><th>SPRING</th></tr>
					<c:forEach items="${SPRINGList}" var="spring" >
						<tr>
							<td><a href="${contextPath}/study/studyDetail?study_no=${spring.study_no}">${spring.study_title}</a></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(SPRINGList)<5}">
						<c:forEach begin="0" end="${4-fn:length(SPRINGList)}" step="1">
							<tr><td>작성한글이 없습니다.</td></tr> 
						</c:forEach>
					</c:if>
				</table>
				<table class="table table-bordered">
					<tr><th>ORACLE</th></tr>
					<c:forEach items="${ORACLEList}" var="oracle" >
						<tr>
							<td><a href="${contextPath}/study/studyDetail?study_no=${oracle.study_no}">${oracle.study_title}</a></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(ORACLEList)<5}">
						<c:forEach begin="0" end="${4-fn:length(ORACLEList)}" step="1">
							<tr><td>작성한글이 없습니다.</td></tr> 
						</c:forEach>
					</c:if>		
				</table>
				<table class="table table-bordered">
					<tr><th>CSS</th></tr>
					<c:forEach items="${CSSList}" var="css" >
						<tr>
							<td><a href="${contextPath}/study/studyDetail?study_no=${css.study_no}">${css.study_title}</a></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(CSSList)<5}">
						<c:forEach begin="0" end="${4-fn:length(CSSList)}" step="1">
							<tr><td>작성한글이 없습니다.</td></tr> 
						</c:forEach>
					</c:if>				
				</table>
			</div>
		</div>
		
		<div class="project">	
			<h2>PROJECT</h2>
			<div class="project-list">
				<div class="card deck">
					<c:forEach items="${projectList}" var="project" >
				    	<div class="card">
							<a href="${contextPath}/study/studyDetail?study_no=${project.study_no}"><img src="${contextPath}/thumbnail?study_no=${project.study_no}" class="card-img-top" /></a>
							<div class="card-body">
								<h5 class="card-title"><a href="${contextPath}/study/studyDetail?study_no=${project.study_no}">${project.study_title}</a></h5>
							</div>
							<div class="card-footer"> 
								<small class="text-muted"><fmt:formatDate type="date" pattern="yyyy년 MM월 dd일" value="${project.study_date}" ></fmt:formatDate></small>
							</div>
						</div> 
					</c:forEach>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>