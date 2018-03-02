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
<meta name="description" content="메인">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인|OUR PLANNERS</title>

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

	
</head>

<body>

	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div id="wrapper" class="preloader_hide">

		<!-- header section -->
			<%@ include file="./common/commonTop_1.jsp"%>
		<!--// header section -->
		<!-- header section -->
			<%@ include file="./common/commonTop_2.jsp"%>
		<!--// header section -->
		

		<!-- 모달창 메시지 -->
			<%@ include file="common/modal_msg.jsp"%>
		<!--// 모달창 메시지 -->

		<section id="wordcloud" class="section">
			<!-- 검색, 핫 키워드 -->
			<%@ include file="wordcloud/wordcloud.jsp"%>
			<!--// 검색, 핫 키워드 -->
		</section>
	
		<!-- category section(분야별 부분) -->
		<section id="works" class="works section no-padding">
			<div class="container-fluid">
				<div class="row no-gutter">
					<!-- 건축분야 -->
					<div class="col-lg-3 col-md-3 col-sm-3 work">
						<a href="" class="work-box"> <img src="${pageContext.request.contextPath}/resources/images/categorie1.jpg" alt="">
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

		<%@ include file="board/hot/board_hot_list.jsp"%>

		<!-- video section(홍보영상 분분) -->

		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 xs-box2">
						<h2 class="section-title mb25 text-left st2">홍보영상</h2>
						<p class="mb25">이달의 기술자 소개 영상 입니다...</p>
						<p>
							<i class="fa fa-cloud-download"></i> &nbsp; 건축 타일 기술자
						</p>
						<p>
							<i class="fa fa-comments"></i> &nbsp; 이주찬
						</p>
						<p>
							<i class="fa fa-github-alt"></i> &nbsp; 저는 ~~~~~~~~~
						</p>
						<p class="mt30 mb0">
							<a href="#" class="btn voyo-btn-2 br2">자세히 보기</a>
						</p>
					</div>
					<div class="col-sm-6">
					
						<iframe class="rs-video" src="https://www.youtube.com/embed/_T_VPnwGrbk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</section>
		<!-- video section(홍보영상 분분) -->

		<!-- up section(위로가기 부분) -->
		<section class="section section-gray">
			<div class="container">
				<div class="col-md-8 col-md-offset-2 text-center">
					<h3>어떤 분야를 찾고 계십니까? 분야별 이미지를 클릭해주세요!</h3>
					<a href="#" class="btn btn-large">위로가기</a>
				</div>
			</div>
		</section>
		<!-- up section(위로가기 부분) -->

		<!-- Footer (하단부분) -->
		<%@ include file="./common/commonBottom.jsp"%>
		<!--// Footer (하단부분) -->

	</div>
	
	<!-- JS FILES(자바스크립트 연결부분) -->



</body>
</html>
