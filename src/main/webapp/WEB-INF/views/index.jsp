<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="메인">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인|OUR PLANNERS</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<!-- JS FILES(자바스크립트 연결부분) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/retina.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>	
	
</head>

<body>
	<!-- header section -->
	<section class="banner" role="banner">
		<!-- header navigation(탑1 부분) -->
			<%@ include file="common/top.jsp"%>
		<!-- header navigation(탑1 부분) -->
		<!-- banner text -->
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<div class="banner-text text-center">
					<h1>Our Planners</h1>
					<p>기획을 중점으로 요청자와 기술자들을 연결시켜 기획의 결실을 맺는 교류시스템</p>
					<nav role="navigation">
						<a href="#services" class="banner-btn"><img
							src="${pageContext.request.contextPath}/resources/images/down-arrow.png" alt=""></a>
					</nav>
				</div>
				<!-- banner text -->
			</div>
		</div>
	</section>
	
	<section id="test">
	<div class="container">
		<h2>git도 사용할 줄 모르던 바보들 드디어 깨우치다!!!!!!</h2>
		<div class="row">
			<ul>
				<li><a href="./member/join" target="_blank">회원가입</a></li>
				<li><a href="./member/login" target="_blank">로그인</a></li>
				<li><a href="./board/engineer" target="_blank">요청자 게시판 리스트</a></li>
				<li><a href="./board/client" target="_blank">의뢰인 게시판 리스트2</a></li>
			</ul>
		</div>
	</div>
	</section>
	
	
	<!-- header section -->
	<!-- keyword section(키워드부분) -->
	<section id="intro" class="section intro no-padding">
		<div class="container-fluid">
			<div class="row no-gutter">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 1</a>
								</div>
							</div>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 2</a>
								</div>
							</div>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 3</a>
								</div>
							</div>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 4</a>
								</div>
							</div>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 5</a>
								</div>
							</div>
							<div class="col-md-2">
								<div class="avatar">
									<a href="#"><img src="${pageContext.request.contextPath}/resources/images/intro-img1.jpg" alt=""
										class="img-responsive">keyword 6</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- keyword section(키워드부분) -->
	<div style="padding-top: 100px;"></div>

	<!-- category section(분야별 부분) -->
	<section id="works" class="works section no-padding">
		<div class="container-fluid">
			<div class="row no-gutter">
				<!-- 건축분야 -->
				<div class="col-lg-3 col-md-3 col-sm-3 work">
					<a href="${pageContext.request.contextPath}/resources/images/work-1.jpg" class="work-box"> <img
						src="${pageContext.request.contextPath}/resources/images/work-1.jpg" alt="">
						<div class="overlay">
							<div class="overlay-caption">
								<p>
									<span class="icon icon-magnifying-glass"></span>
								</p>
							</div>
						</div> 
					</a>
				</div>
				<!-- IT분야 -->
				<div class="col-lg-3 col-md-3 col-sm-3 work">
					<a href="${pageContext.request.contextPath}/resources/images/work-2.jpg" class="work-box"> <img
						src="${pageContext.request.contextPath}/resources/images/work-2.jpg" alt="">
						<div class="overlay">
							<div class="overlay-caption">
								<p>
									<span class="icon icon-magnifying-glass"></span>
								</p>
							</div>
						</div> 
					</a>
				</div>
				<!-- 자동차분야 -->
				<div class="col-lg-3 col-md-3 col-sm-3 work">
					<a href="${pageContext.request.contextPath}/resources/images/work-3.jpg" class="work-box"> <img
						src="${pageContext.request.contextPath}/resources/images/work-3.jpg" alt="">
						<div class="overlay">
							<div class="overlay-caption">
								<p>
									<span class="icon icon-magnifying-glass"></span>
								</p>
							</div>
						</div> 
					</a>
				</div>
				<!-- 교육분야 -->
				<div class="col-lg-3 col-md-3 col-sm-3 work">
					<a href="${pageContext.request.contextPath}/resources/images/work-4.jpg" class="work-box"> <img
						src="${pageContext.request.contextPath}/resources/images/work-4.jpg" alt="">
						<div class="overlay">
							<div class="overlay-caption">
								<p>
									<span class="icon icon-magnifying-glass"></span>
								</p>
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
			<h2>engineer board</h2>
			<div class="row">
				
			</div>
		</div>
	</section>
	<!-- engineer section(기술자 게시글부분) -->
	<!-- buyer section(요청자 게시글부분) -->
	<section id="teams" class="section teams">
		<div class="container">
			<h2>buyer board</h2>
			<div class="row">
				
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

</body>
</html>
