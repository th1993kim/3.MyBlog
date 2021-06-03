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
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Rapid Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/venobox/venobox.css" rel="stylesheet">  
  <link href="${contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
 
  <!-- Template Main CSS File -->
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Rapid - v2.3.1
  * Template URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
 
	<header id="header" class="fixed-top header-transparent">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo mr-auto"><a href="${contextPath}/main">THweb</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo mr-auto"><img src="${contextPath}/resources/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav class="main-nav d-none d-lg-block">
	        <ul> 
	          <li class="active"><a href="${contextPath}/main">Home</a></li>
	   		  <li>
				<c:if test="${empty loginMember}">		
					<a href="${contextPath}/member/loginForm">Login</a>
				</c:if>
				<c:if test="${!empty loginMember}">	
					<a href="${contextPath}/member/logout">Logout</a> 
				</c:if> 
			  </li>
	          <li><a href="#about">About Me</a></li>
	          <li><a href="#why-us">My History</a></li> 
			  <c:forEach items="${daeList}" var="dae" > 
			  <li class="drop-down"><a href="#${dae.dae_name}">${dae.dae_name}</a>
					<ul>
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
	      </nav><!-- .main-nav-->
	    </div>
	 </header>
</body>
  <!-- Vendor JS Files -->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>
  <script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/resources/vendor/counterup/counterup.min.js"></script>
  <script src="${contextPath}/resources/vendor/venobox/venobox.min.js"></script>
  <script src="${contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${contextPath}/resources/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${contextPath}/resources/vendor/aos/aos.js"></script>
</html>