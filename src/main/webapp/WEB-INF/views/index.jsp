
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material/material-kit.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Owl Stylesheets -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<!-- JS FILES(자바스크립트 연결부분) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

</head>

<body>

	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- header section -->
		<!-- header navigation(탑1 부분) -->
		<%@ include file="common/top_main.jsp"%>
		<!-- header navigation(탑1 부분) -->
		<!-- header section -->
		<section class="banner" role="banner">
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<div class="banner-text text-center">
						<h1>Our Planners</h1>
						<p>기획을 중점으로 요청자와 기술자들을 연결시켜 기획의 결실을 맺는 교류시스템</p>
						<nav role="navigation">
							<a href="#services" class="banner-btn"><img src="#" alt=""></a>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<section id="wordcloud">

			<%@ include file="wordcloud/wordcloud.jsp"%>
			<%@ include file="common/modal_msg.jsp"%>

			<div class="modal fade " id="service-search-modal" tabindex="-1" role="dialog" aria-labelledby="layer_msg_title" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">

							<div>

								<h1>"${searchWord }"에 대한 검색 결과가 없습니다.</h1>

								<h1>다음 서비스를 찾고 있나요?</h1>

							</div>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>

							<h4 class="modal-title" id="layer_msg_title">알림</h4>
						</div>
						<div class="modal-body" id="layer_msg_content">

							<div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/hire/영어"> 영어 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/수학"> 수학 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/피아노키보드"> 피아노/키보드 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/비즈니스-영어"> 비즈니스 영어 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/보컬"> 보컬 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/국어"> 국어 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/과학"> 과학 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/시창청음화성학"> 시창청음/화성학 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/작곡-편곡"> 작곡/편곡 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/음악-편집-및-제작"> 음악 편집 및 제작 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/기타"> 기타 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/BGM-사운드-제작"> BGM/사운드 제작 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/toeic"> TOEIC/speaking/writing 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/중국어"> 중국어 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/일본어일어"> 일본어(일어) 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/퍼스널트레이닝"> 퍼스널트레이닝(PT) </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/미디컴퓨터작곡"> 미디/컴퓨터작곡 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/비즈니스-중국어"> 비즈니스 중국어 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/소묘-드로잉"> 소묘/드로잉 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/사회"> 사회 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/미술-회화"> 미술 회화 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/연기"> 연기 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/일러스트-디자인"> 일러스트 디자인 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/영어-번역"> 영어 번역 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/축가"> 축가 요청 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/바이올린"> 바이올린 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/비즈니스-일본어"> 비즈니스 일본어 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/성악"> 성악 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/명함-디자인"> 명함 디자인 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/로고-디자인"> 로고 디자인 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/논술"> 논술 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/인쇄물-디자인"> 인쇄물 디자인 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/개인용-사진-촬영"> 개인용 사진 촬영 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/toefl"> TOEFL 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/기업-상업용-사진-촬영"> 기업/상업용 사진 촬영 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/방송댄스"> 방송댄스 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/검정고시"> 검정고시 과외 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/프로그래밍"> 프로그래밍/코딩 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/사진촬영"> 사진 촬영/편집 레슨 </a></li>
									<li><a href="${pageContext.request.contextPath}/hire/스트릿-댄스"> 스트릿댄스 레슨 </a></li>
								</ul>
							</div>

						</div>
						<div class="modal-footer">

							<div>
								<div class="other-cat-desc">
									<p>다른 이름으로 서비스가 존재할 수 있어요.</p>
									<p>다음 카테고리에서 찾아보시는 건 어떠세요?</p>
								</div>
								<ul>
									<li><a href="/레슨"> 레슨 </a></li>
									<li><a href="/홈-리빙"> 홈/리빙 </a></li>
									<li><a href="/이벤트"> 이벤트 </a></li>
									<li><a href="/비즈니스"> 비즈니스 </a></li>
									<li><a href="/디자인-개발"> 디자인/개발 </a></li>
									<li><a href="/건강-미용"> 건강/미용 </a></li>
									<li><a href="/기타"> 기타 </a></li>
								</ul>
							</div>

							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</section>

		<!-- category section(분야별 부분) -->
		<section id="works" class="works section no-padding">
			<div class="container-fluid">
				<div class="row no-gutter">
					<!-- 건축분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a href="${pageContext.request.contextPath}/board/engineer?category=1" class="work-box"> <img src="${pageContext.request.contextPath}/resources/images/categorie1.jpg" alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>건축</p>
								</div>
							</div>
						</a>
					</div>

					<!-- 자동차분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a href="${pageContext.request.contextPath}/board/engineer?category=2" class="work-box"> <img src="${pageContext.request.contextPath}/resources/images/categorie3.jpg" alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>자동차</p>
								</div>
							</div>
						</a>
					</div>

					<!-- IT분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a href="${pageContext.request.contextPath}/board/engineer?category=3" class="work-box"> <img src="${pageContext.request.contextPath}/resources/images/categorie2.jpg" alt="">
							<div class="overlay">
								<div class="overlay-caption">
									<p>IT</p>
								</div>
							</div>
						</a>
					</div>

					<!-- 교육분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a href="${pageContext.request.contextPath}/board/engineer?category=4" class="work-box"> <img src="${pageContext.request.contextPath}/resources/images/categorie4.jpg" alt="">
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
		<section id="hot_engineer_board" class="section teams">
			<div class="container">
				<h2>[hot ★★★★★] engineer board</h2>
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide multi-item-carousel" id="theCarousel">
							<div class="carousel-inner">

								<div class="item active">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url(&quot;http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg&quot;); opacity: 1;"></div>
												<div class="ripple-container"></div>
											</div>

											<div class="card-content">
												<h6 class="category text-info">Enterprise</h6>
												<h4 class="card-title">
													<a href="#pablo">Autodesk looks to future of 3D printing with Project Escher</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog8.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url('http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg'); opacity: 1;"></div>
												<div class="ripple-container"></div>
											</div>
											<div class="card-content">
												<h6 class="category text-success">Startups</h6>
												<h4 class="card-title">
													<a href="#pablo">Lyft launching cross-platform service this week</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog7.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url(&quot;http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog7.jpg&quot;); opacity: 1;"></div>
											</div>

											<div class="card-content">
												<h6 class="category text-danger">Enterprise</h6>
												<h4 class="card-title">
													<a href="#pablo">6 insights into the French Fashion landscape</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>



							</div>
							<a class="left carousel-control" href="#theCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a> <a class="right carousel-control" href="#theCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- engineer section(기술자 게시글부분) -->
		<!-- buyer section(요청자 게시글부분) -->
		<section id="hot_client_board" class="section teams">
			<div class="container">
				<h2>[hot ★★★★★] buyer board</h2>
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide multi-item-carousel" id="theCarousel2">
							<div class="carousel-inner">

								<div class="item active">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url(&quot;http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg&quot;); opacity: 1;"></div>
												<div class="ripple-container"></div>
											</div>

											<div class="card-content">
												<h6 class="category text-info">Enterprise</h6>
												<h4 class="card-title">
													<a href="#pablo">Autodesk looks to future of 3D printing with Project Escher</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog8.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url('http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog6.jpg'); opacity: 1;"></div>
												<div class="ripple-container"></div>
											</div>
											<div class="card-content">
												<h6 class="category text-success">Startups</h6>
												<h4 class="card-title">
													<a href="#pablo">Lyft launching cross-platform service this week</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-md-4">
										<div class="card card-blog">
											<div class="card-image">
												<a href="#pablo"> <img class="img img-raised" src="http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog7.jpg">
												</a>
												<div class="colored-shadow" style="background-image: url(&quot;http://demos.creative-tim.com/bs3/material-kit-pro/assets/img/examples/blog7.jpg&quot;); opacity: 1;"></div>
											</div>

											<div class="card-content">
												<h6 class="category text-danger">Enterprise</h6>
												<h4 class="card-title">
													<a href="#pablo">6 insights into the French Fashion landscape</a>
												</h4>
												<p class="card-description">
													Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses.<a href="#pablo"> Read More </a>
												</p>
											</div>
										</div>
									</div>
								</div>



							</div>
							<a class="left carousel-control" href="#theCarousel2" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a> <a class="right carousel-control" href="#theCarousel2" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
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
