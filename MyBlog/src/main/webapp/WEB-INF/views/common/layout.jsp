<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--  tiels관련xml문서에서 정의한 
       <put-attribute name="title"	value="~~~~" />을 적용하는 부분  --%>
<title><tiles:insertAttribute name="title" /></title>
<style>
html{
	height:100%;
}
body{
	height:100%;
}
#outer_wrap{
	height:100%; 
}
#wrap{
	position:relative;
	min-height:100%;
} 
#wrap>article{
	margin:250px auto 0 auto;   
	padding-bottom:250px;   
}
#wrap>footer{
	position:absolute;
    bottom:0;
    width:100%;
}
</style>
</head>
<body> 
<div id="outer_wrap">
		<div id="wrap">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<aside>
				<tiles:insertAttribute name="side" />
			</aside>
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
			<footer>
				<tiles:insertAttribute name="footer" />
        	</footer>
		</div>
		 <%-- 스크롤바의 위치를 따라서 이동되는 부분 : 가장 최근에 본 상품내용이 보인다 --%>
		<%--  <tiles:insertAttribute name="quickMenu" /> --%>
    </div>  
</body>
</html>