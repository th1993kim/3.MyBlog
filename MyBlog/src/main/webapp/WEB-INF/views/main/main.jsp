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
<link rel="stylesheet" href="${contextPath}/resources/css/timeline.css" />
<meta charset="UTF-8">
<style>
.row{
	justify-content: center !important;
}
.project h2{
	margin-left:150px;
}
.project-list{
	display:flex; 
	padding:15px 50px;  
	justify-content: center;
	flex-flow:row wrap;
}
.card-img-top{
	padding:5px; 
	border-radius: 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>
 <!-- ======= Hero Section ======= -->
  <section id="hero" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center" data-aos="fade-up">
        <div class="col-md-6 intro-info order-md-first order-last" data-aos="zoom-in" data-aos-delay="100">
          <h2>THWEB에 오신것을 <br><span>환영합니다.</span></h2>
          <div>
            <a href="#about" class="btn-get-started scrollto">About me</a>
          </div> 
        </div>

        <div class="col-md-6 intro-img order-md-last order-first" data-aos="zoom-out" data-aos-delay="200">
          <img src="${contextPath}/resources/img/intro-img.jpg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-6">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="${contextPath}/resources/img/about-img.jpg" alt="">
            </div> 
          </div>

          <div class="col-lg-7 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>About me</h2> 
              <h3>"끊임없이 나를 개발하는 개발자"</h3>
              <p>안녕하세요. 주니어 백엔드 개발자 김태현입니다.</p>
              <p>저는 항상 사용자의 입장에서 설계하는 개발자이며, 사용자가 범할 수 있는 오류들에 대해 항상 생각합니다.</p>
              <p>팀과의 의사소통을 중요시하며, 동료와의 교류를 통해 서로 발전할 수 있다고 생각하며 개발하고 있습니다.</p>
              <p>새로운 기술을 추구하며, 레거시 코드를 답습해봅니다. 레거시 코드를 알아야 새로운 기술의 이용이 편리하다고 생각합니다.</p>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>My Skills</h3>
        </header> 
  
	       <div class="row">
	
	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/java.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">Java</a></h4> 
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/javascript.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">JavaScript</a></h4> 
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/spring.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">SPRING</a></h4> 
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/mybatis.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">MyBatis</a></h4> 
	            </div>
	          </div>

	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/oracle.svg" style="width:120px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">Oracle</a></h4>   
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/mysql.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">MySQL</a></h4> 
	            </div>
	          </div> 
   	          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
	            <div class="box"> 
	              <div class="logoIcon"><img src="${contextPath}/resources/img/skills/gibhub.png" style="width:70px;height:70px; margin:0 0 20px 0" /></div>
	              <h4 class="title"><a href="#">GitHub</a></h4> 
	            </div>
	          </div> 
	      </div>

      </div> 
    </section><!-- End Services Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container-fluid" data-aos="fade-up">

        <header class="section-header">
          <h3>My History</h3>
        </header>
        <div class="row">
			<ul class="timeline" id="timeline">
			  <li class="li complete">
			    <div class="timestamp">
			      <span class="date">~ 2018/08</span>
			    </div>
			    <div class="status">
			      <h4> 단국대학교 산업공학과 졸업</h4>
			    </div>
			  </li>
			  <li class="li complete">
			    <div class="timestamp">
			      <span class="date">2018/03 ~ 2020/10</span>
			    </div> 
			    <div class="status">
			      <h4> GSE엘리베이터 근무</h4>
			    </div>
			  </li>
			  <li class="li complete">
			    <div class="timestamp">
			      <span class="date">2020/11~2021/05</span>
			    </div>
			    <div class="status">
			      <h4> 경영기술개발원 교육수료</h4>
			    </div>
			  </li>
			 </ul>
       		</div>
     	</div>
    </section><!-- End Why Us Section -->
<!-- ======= Clients Section ======= -->
	<section id="PROJECT" >
    <section id="clients" class="clients section-bg">
      <div class="container" data-aos="zoom-in">
        <header class="section-header">
          <h3>My Project</h3>
        </header>
	 		<div class="project">	
				<div class="project-list">
					<div class="card-deck">
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
    </section>
    </section>
    <!-- End Clients Section -->
  </main><!-- End #main -->
</body>
  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/main.js"></script>
</html>