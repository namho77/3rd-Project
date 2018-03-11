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
<title>서비스 소개|OUR PLANNERS</title>
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
		<section class="section page-services" style="margin-top: 120px;">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 col-md-3 sm-box">
						<ul class="nav nav-tabs vertical">
							<li class="active"><a href="#tab1" data-toggle="tab">HTML5 and CSS3</a></li>
							<li><a href="#tab2" data-toggle="tab">Wordpress</a></li>
							<li><a href="#tab3" data-toggle="tab">Joomla vs Drupal</a></li>
							<li><a href="#tab4" data-toggle="tab">Magento</a></li>
						</ul>
					</div>
					<div class="col-sm-8 col-md-9">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
								<h3 class="box-title bt2">What is HTML5?</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, distinctio omnis dolorum nostrum alias nulla placeat id sit debitis molestiae neque tenetur consequatur in unde aliquam optio quasi beatae veritatis rem delectus eveniet! Aliquid, minima, natus, odit cumque consequuntur ratione eligendi est pariatur maiores recusandae asperiores tenetur optio id cum?</p>
							</div>
							<div class="tab-pane fade" id="tab2">
								<h3 class="box-title bt2">How to create Wordpress themes?</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, distinctio omnis dolorum nostrum alias nulla placeat id sit debitis molestiae neque tenetur consequatur in unde aliquam optio quasi beatae veritatis rem delectus eveniet! Aliquid, minima, natus, odit cumque consequuntur ratione eligendi est pariatur maiores recusandae asperiores tenetur optio id cum?</p>
							</div>
							<div class="tab-pane fade" id="tab3">
								<h3 class="box-title bt2">Is Drupal better than Joomla?</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, distinctio omnis dolorum nostrum alias nulla placeat id sit debitis molestiae neque tenetur consequatur in unde aliquam optio quasi beatae veritatis rem delectus eveniet! Aliquid, minima, natus, odit cumque consequuntur ratione eligendi est pariatur maiores recusandae asperiores tenetur optio id cum?</p>
							</div>
							<div class="tab-pane fade" id="tab4">
								<h3 class="box-title bt2">Magento or OpenCart</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, distinctio omnis dolorum nostrum alias nulla placeat id sit debitis molestiae neque tenetur consequatur in unde aliquam optio quasi beatae veritatis rem delectus eveniet! Aliquid, minima, natus, odit cumque consequuntur ratione eligendi est pariatur maiores recusandae asperiores tenetur optio id cum?</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-3 section-gray mb0">
			<div class="container">
				<div class="row mb50">
					<div class="col-sm-6 col-md-3 sm-box">
						<a href="#" class="job-careers"> <i class="fa fa-html5 fa-5x"></i>
							<h3 class="box-title">Clean Code</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3 sm-box">
						<a href="#" class="job-careers"> <i class="fa fa-apple fa-5x"></i>
							<h3 class="box-title">Retina Ready</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3 xs-box">
						<a href="#" class="job-careers"> <i class="fa fa-android fa-5x"></i>
							<h3 class="box-title">Responsive Design</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3">
						<a href="#" class="job-careers"> <i class="fa fa-photo fa-5x"></i>
							<h3 class="box-title">Multipurpose Template</h3>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-3 sm-box">
						<a href="#" class="job-careers"> <i class="fa fa-bar-chart fa-5x"></i>
							<h3 class="box-title">Tons of elements</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3 sm-box">
						<a href="#" class="job-careers"> <i class="fa fa-support fa-5x"></i>
							<h3 class="box-title">Friendly Support</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3 xs-box">
						<a href="#" class="job-careers"> <i class="fa fa-cloud-download fa-5x"></i>
							<h3 class="box-title">Free Updates</h3>
						</a>
					</div>
					<div class="col-sm-6 col-md-3">
						<a href="#" class="job-careers"> <i class="fa fa-book fa-5x"></i>
							<h3 class="box-title">Detailed Documentation</h3>
						</a>
					</div>
				</div>
			</div>
		</section>
		<section class="large-padding section-dark m0 custom-bg custom-bg2 bg-left parallax" data-bg="../assets/images/demo/i-102.png">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-md-6 col-md-offset-6">
						<h2 class="section-title text-left st2 mb30">Even more</h2>
						<p class="mb40">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium voluptates, laboriosam eaque voluptatem vitae earum quos similique dolorum preset.</p>
						<p>
							<i class="fa fa-cloud-download fa-bg main-bg color-white"></i> &nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit facere, distinctio.
						</p>
						<p>
							<i class="fa fa-cloud-upload fa-bg main-bg color-white"></i> &nbsp; Laboriosam eaque voluptatem vitae earum quos similique dolorum.
						</p>
						<p class="mb0">
							<i class="fa fa-cloud fa-bg main-bg color-white"></i> &nbsp; Omnis dolorum nostrum alias nulla placeat id sit debitis molestiae neque
						</p>
					</div>
				</div>
			</div>
		</section>
		<section class="section-3 custom-section cs2 mt0">
			<div class="container animated" data-anim="bounceIn">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2 class="section-title st2 mb25">Showcase the main services to your customers!</h2>
						<a href="#" class="btn btn-primary">See more services</a>
					</div>
				</div>
			</div>
		</section>
		<section class="section">
			<div class="container">
				<div class="row mb30">
					<div class="col-sm-4 text-center xs-box">
						<img src="../assets/images/demo/bar-chart.png" alt="careers" class="img-careers">
					</div>
					<div class="col-sm-8">
						<div class="text-careers">
							<h3 class="box-title">We do not have rules. We have values.</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quidem modi facilis doloremque qui dicta, est, libero distinctio a explicabo adipisci, autem animi tempore excepturi numquam atque cum officia. Labore nisi minus odio quo vero, quaerat sit doloribus. Enim necessitatibus reprehenderit maiores inventore.</p>
						</div>
					</div>
				</div>
				<div class="row mb30">
					<div class="col-sm-4 text-center xs-box col-sm-push-8">
						<img src="../assets/images/demo/brightness.png" alt="careers" class="img-careers">
					</div>
					<div class="col-sm-8 col-sm-pull-4">
						<div class="text-careers">
							<h3 class="box-title">Be Bold. Be Open. Be you.</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quidem modi facilis doloremque qui dicta, est, libero distinctio a explicabo adipisci, autem animi tempore excepturi numquam atque cum officia. Labore nisi minus odio quo vero, quaerat sit doloribus. Enim necessitatibus reprehenderit maiores inventore.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 text-center xs-box">
						<img src="../assets/images/demo/compose.png" alt="careers" class="img-careers">
					</div>
					<div class="col-sm-8">
						<div class="text-careers">
							<h3 class="box-title">Work on important problems</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quidem modi facilis doloremque qui dicta, est, libero distinctio a explicabo adipisci, autem animi tempore excepturi numquam atque cum officia. Labore nisi minus odio quo vero, quaerat sit doloribus. Enim necessitatibus reprehenderit maiores inventore.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-3 section-gray mb0">
			<div class="container">
				<div class="row ">
					<div class="col-sm-4 xs-box2">
						<div class="box-content">
							<i class="fa fa-support fa-3x"></i>
							<h3 class="box-title br-dashed">Knowledgebase</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab corrupti, quasi? Beatae cumque maiores.</p>
						</div>
					</div>
					<div class="col-sm-4 xs-box2">
						<div class="box-content">
							<i class="fa fa-phone fa-3x"></i>
							<h3 class="box-title br-dashed">Phone Support</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab corrupti, quasi? Beatae cumque maiores.</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="box-content">
							<i class="fa fa-envelope fa-3x"></i>
							<h3 class="box-title br-dashed">Mail Support</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab corrupti, quasi? Beatae cumque maiores.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-3 section-dark mt0">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 xs-box">
						<h3 class="box-title color-white">Boxed / Wide Layout</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, error, ipsa assumenda cumque dicta deleniti quibusdam accusamus vitae ab impedit.</p>
						<p>
							<i class="fa fa-cloud-download fa-bg main-bg color-white"></i> &nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit facere.
						</p>
						<p class="mb0">
							<i class="fa fa-cloud fa-bg main-bg color-white"></i> &nbsp; Omnis dolorum nostrum alias nulla placeat id sit debitis molestiae.
						</p>
					</div>
					<div class="col-sm-6">
						<h3 class="box-title color-white">Our Skills</h3>
						<div class="progress">
							<div class="progress-bar" role="progressbar" data-percentage="85">
								<span><i class="fa fa-wordpress"></i> Wordpress 85%</span>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" data-percentage="70">
								<span><i class="fa fa-drupal"></i> Drupal 70%</span>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" data-percentage="100">
								<span><i class="fa fa-html5"></i> HTML 100%</span>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" data-percentage="60">
								<span><i class="fa fa-joomla"></i> Joomla 60%</span>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" data-percentage="100">
								<span><i class="fa fa-joomla"></i> CSS3 100%</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section mb30">
			<div class="container">
				<div class="row mb35">
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<img src="../assets/images/icons/one-color/64px/check.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Responsive Design</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<i class="fa fa-weixin"></i>
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Top notch Support</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="box-left">
							<img src="../assets/images/icons/full-color/64px/browser.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Wide / Boxed layout</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
				</div>
				<div class="row mb35">
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<img src="../assets/images/icons/one-color/64px/bookshelf.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Extensive Documentation</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<i class="fa fa-paint-brush"></i>
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Unimited colors</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="box-left">
							<img src="../assets/images/icons/full-color/64px/shop.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Shop Pages</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<img src="../assets/images/icons/one-color/64px/smartphone.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Retina Ready</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4 xs-box">
						<div class="box-left">
							<i class="fa fa-html5"></i>
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">95+ HTML files</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="box-left">
							<img src="../assets/images/icons/full-color/64px/star.png" alt="service">
						</div>
						<div class="box-right">
							<h3 class="box-title bt3">Free Updates</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, cumque sint officia.</p>
						</div>
					</div>
				</div>
			</div>


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
