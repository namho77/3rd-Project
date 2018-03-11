<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인정보취급방침|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script>
	$(document).ready(function() {

	});
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">
	
	<!-- header1(네비게이션 탑1) -->
		<%@ include file="../common/commonTop_1.jsp"%>
	<!-- header1(네비게이션 탑1) -->
	<!-- header2(네비게이션 탑2) -->
		<%@ include file="../common/commonTop_2_mypage.jsp"%>
	<!-- header2(네비게이션 탑2) -->
	

		<!-- HOME -->
		<section id="main" class="section" style="margin-top: 120px;">

			<!-- CONTAINER -->
			<section class="section team-section">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab-team1" data-toggle="tab">Managers &amp; CEO</a></li>
								<li><a href="#tab-team2" data-toggle="tab">Web Designers</a></li>
								<li><a href="#tab-team3" data-toggle="tab">Developers</a></li>
								<li><a href="#tab-team4" data-toggle="tab">Community Support</a></li>
								<li><a href="#tab-team5" data-toggle="tab">Marketing</a></li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab-team1">
									<div class="row">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-102.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Jay Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Jay Doe"> ... </a>
													</h3>
													<h5>Team Manager</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-107.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Mark Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Mark Doe"> ... </a>
													</h3>
													<h5>C.E.O.</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-team2">
									<div class="row mb50">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-103.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Alex Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Alex Doe"> ... </a>
													</h3>
													<h5>Web Designer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-104.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Sophia Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Sophia Doe"> ... </a>
													</h3>
													<h5>Graphic Designer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-101.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Cecillia Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Cecillia Doe"> ... </a>
													</h3>
													<h5>Web Designer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-105.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														John Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about John Doe"> ... </a>
													</h3>
													<h5>Web Designer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-team3">
									<div class="row mb50">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-102.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Jay Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Jay Doe"> ... </a>
													</h3>
													<h5>Web Developer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-103.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Justin Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Justin Doe"> ... </a>
													</h3>
													<h5>Frontend Developer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-107.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Joe Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Joe Doe"> ... </a>
													</h3>
													<h5>Backend Developer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-team4">
									<div class="row mb50">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-103.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Alex Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Alex Doe"> ... </a>
													</h3>
													<h5>Forum Support</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-104.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Sophia Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Sophia Doe"> ... </a>
													</h3>
													<h5>Knowledgebase writer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-101.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Cecillia Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Cecillia Doe"> ... </a>
													</h3>
													<h5>Email Support</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-105.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														John Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about John Doe"> ... </a>
													</h3>
													<h5>Community Manager</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-team5">
									<div class="row">
										<div class="col-sm-6 xs-box2">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-102.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Jay Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Jay Doe"> ... </a>
													</h3>
													<h5>Accountant</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="box-team">
												<div class="team-image">
													<img src="${pageContext.request.contextPath}/resources/images/team/t-104.jpg" alt="team">
													<div class="team-links">
														<ul class="social-icon circle">
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="team-info">
													<h3>
														Sophia Doe <a href="page_about_me.html" data-toggle="tooltip" title="" data-original-title="Find out more about Sophia Doe"> ... </a>
													</h3>
													<h5>Social Marketer</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum vitae tempora officiis reprehenderit expedita iure.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->

		<!-- Footer (하단부분) -->
		<%@ include file="../common/commonBottom.jsp"%>
		<!--// Footer (하단부분) -->
	</div>
</body>
</html>
