<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//ajax json데이터 캐쉬 방지
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="메인">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인|OUR PLANNERS</title>

<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- JS FILES(자바스크립트 연결부분) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/main.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

</head>

<body>

	<!-- PRELOADER -->
	<img id="preloader"
		src="${pageContext.request.contextPath}/resources/images/preloader.gif"
		alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- header section -->
		<section class="banner" role="banner">
			<!-- header navigation(탑1 부분) -->
			<%@ include file="common/top_main.jsp"%>
			<!-- header navigation(탑1 부분) -->
			<!-- banner text -->
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<div class="banner-text text-center">
						<h1>Our Planners</h1>
						<p>기획을 중점으로 요청자와 기술자들을 연결시켜 기획의 결실을 맺는 교류시스템</p>
						<nav role="navigation">
							<a href="#services" class="banner-btn"><img src="#" alt=""></a>
						</nav>
					</div>
					<!-- banner text -->
				</div>
			</div>
		</section>
		<!-- header section -->


		<!-- keyword section(키워드부분) -->
		<!-- keyword section(키워드부분) -->
		<div style="padding-top: 100px;"></div>


		<!-- category section(분야별 부분) -->
		<section id="works" class="works section no-padding">
			<div class="container-fluid">
				<div class="row no-gutter">
					<!-- 건축분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a
							href="${pageContext.request.contextPath}/resources/images/categorie1.jpg"
							class="work-box"> <img
							src="${pageContext.request.contextPath}/resources/images/categorie1.jpg"
							alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>건축</p>
								</div>
							</div>
						</a>
					</div>
					<!-- IT분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a
							href="${pageContext.request.contextPath}/resources/images/categorie2.jpg"
							class="work-box"> <img
							src="${pageContext.request.contextPath}/resources/images/categorie2.jpg"
							alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>컴퓨터</p>
								</div>
							</div>
						</a>
					</div>
					<!-- 자동차분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a
							href="${pageContext.request.contextPath}/resources/images/categorie3.jpg"
							class="work-box"> <img
							src="${pageContext.request.contextPath}/resources/images/categorie3.jpg"
							alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>자동차</p>
								</div>
							</div>
						</a>
					</div>
					<!-- 교육분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a
							href="${pageContext.request.contextPath}/resources/images/categorie4.jpg"
							class="work-box"> <img
							src="${pageContext.request.contextPath}/resources/images/categorie4.jpg"
							alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>교육</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>
		<!-- category section(분야별 부분) -->

		<!-- engineer section(기술자 게시글부분) -->
		<section id="teams" class="section teams">
			<div class="container">
				<h2>[hot ★★★★★] engineer board</h2>
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide multi-item-carousel" id="theCarousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/f44336/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/e91e63/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/9c27b0/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/673ab7/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/4caf50/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/8bc34a/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<!-- add  more items here -->
								<!-- Example item start:  -->

								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/8bc34a/000000"
											class="img-responsive"></a>
									</div>
								</div>

								<!--  Example item end -->
							</div>
							<a class="left carousel-control" href="#theCarousel"
								data-slide="prev"><i
								class="glyphicon glyphicon-chevron-left"></i></a> <a
								class="right carousel-control" href="#theCarousel"
								data-slide="next"><i
								class="glyphicon glyphicon-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- engineer section(기술자 게시글부분) -->
		<!-- buyer section(요청자 게시글부분) -->
		<section id="teams" class="section teams">
			<div class="container">
				<h2>[hot ★★★★★] buyer board</h2>
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide multi-item-carousel" id="theCarousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/f44336/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/e91e63/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/9c27b0/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/673ab7/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/4caf50/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/8bc34a/000000"
											class="img-responsive"></a>
									</div>
								</div>
								<!-- add  more items here -->
								<!-- Example item start:  -->

								<div class="item">
									<div class="col-xs-4">
										<a href="#1"><img
											src="http://placehold.it/300/8bc34a/000000"
											class="img-responsive"></a>
									</div>
								</div>

								<!--  Example item end -->
							</div>
							<a class="left carousel-control" href="#theCarousel"
								data-slide="prev"><i
								class="glyphicon glyphicon-chevron-left"></i></a> <a
								class="right carousel-control" href="#theCarousel"
								data-slide="next"><i
								class="glyphicon glyphicon-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- buyer section(요청자 게시글부분) -->

		<!-- video section(홍보영상 분분) -->
		<section id="testimonials" class="section testimonials no-padding">
			<div class="container-fluid">
				<div class="row no-gutter">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="col-md-12">
									<blockquote>
										<h1>홍보영상 1</h1>
										<p>건축 타일 기술자 이주찬</p>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="col-md-12">
									<blockquote>
										<h1>홍보영상 2</h1>
										<p>프론트 개발자 박세창</p>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="col-md-12">
									<blockquote>
										<h1>홍보영상 3</h1>
										<p>자동차 복구기술자 박상화</p>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="col-md-12">
									<blockquote>
										<h1>홍보영상 4</h1>
										<p>발표 교육자 김남호</p>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- video section(홍보영상 분분) -->

		<!-- up section(위로가기 부분) -->
		<section id="contact" class="section quote">
			<div class="container">
				<div class="col-md-8 col-md-offset-2 text-center">
					<h3>어떤 분야를 찾고 계십니까? 분야별 이미지를 클릭해주세요!</h3>
					<a href="#" class="btn btn-large">위로가기</a>
				</div>
			</div>
		</section>
		<!-- up section(위로가기 부분) -->

		<!-- Footer section(하단부분) -->
		<footer class="footer">
			<%@ include file="common/bottom.jsp"%>
		</footer>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
