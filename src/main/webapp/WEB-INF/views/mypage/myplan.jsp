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
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<!-- CSS작업부분 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplan.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

</head>

<body id="body-bg">
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_1.jsp"%>
	</div>
	<!-- Top영역 2첫번째  (마이페이지부분의 탑2 적용)-->
	<div class="row">
		<%@ include file="../common/commonTop_2_mypage.jsp"%>
	</div>
	
	<!-- 몸체부분 -->
	<div class="container container-body">
		<div class="row myplan-title">
			<div class="col-xs-12 height-good">
				<h2>
					<b>나의 플레너스</b>
				</h2>
			</div>
		</div>
		<div class="row myplan-body">
			<div class="col-xs-3">
				<div class="row">
					<div class="col-xs-12 margin-top-10">
						<div class="panel panel-default border-radius-none margin-none " >
							<div class="panel-body position-relative padding-bottom-0" id="panel-body">
								<div class="row">
									<div class="col-xs-12 dashboard-profile text-center">
										<div class="dashboard-profile-body">
											<img id="thumbnail" class="border-round" src="${pageContext.request.contextPath}/resources/images/main_user_gray.png" title="dmacoder" onError="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/images/main_user_gray.png';">
											<div class="dashboard-profile-grade userProfileRanking NEW">
												<a href="${pageContext.request.contextPath}/grade"> <img src="/img/tools/grade/kmong_grade_NEW.png" data-toggle="tooltip" data-placement="right" title="" data-original-title=NEW>
												</a>
											</div>
										</div>
									</div>
									<div class="col-xs-12">
										<div class="row">
											<div id="satisfaction" class="col-xs-12 cursor">
												<h5 class="header-margin-none font-color-lighter menu-sotitle">
												만족도<span class="pull-right"><b>아직몰라요</b></span>
												</h5>
											</div>
										</div>
										<div class="row margin-top-10">
											<div class="col-xs-12">
												<h5 class="header-margin-none font-color-lighter menu-sotitle">
												평균응답시간<span class="pull-right"><b>아직몰라요</b></span>
												</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="row margin-top-20 dashboard-user-information">
									<div class="col-xs-12">
										<div data-toggle="tooltip" data-placement="right">
											<h5 class="header-margin-none menu-sotitle">
												응답률 <span class="pull-right"><b>40%</b></span>
											</h5>
										</div>
									</div>
								</div>
								<div class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
									<div class="padding-myplan">
										<div class="progress">
										    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
										    style="width:40%; text-align: center;">
										      	40%
										    </div>
									  	</div>
									</div>
								</div>

								<div class="row margin-top-20 dashboard-user-information">
									<div class="col-xs-12">
										<div data-toggle="tooltip" data-placement="right">
											<h5 class="header-margin-none menu-sotitle">
												주문 성공률 <span class="pull-right"><b>99%</b></span>
											</h5>
										</div>
									</div>
								</div>
								<div class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
									<div class="padding-myplan">
										<div class="progress">
										    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
										    style="width:99%; text-align: center;">
										      	99%
										    </div>
									  	</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xs-9">
				<div class="row margin-top-10">
					<div class="col-xs-12">
						<div class="panel panel-default margin-top-0 border-radius-0">
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter menu-sotitle">요청자 진행 건</h5>
										<a class="plain" href="${pageContext.request.contextPath}/seller/selling_history">
											<h4 class="header-margin-none margin-top-5">
												<b>0</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter menu-sotitle">요청자 완료 건</h5>
										<a class="plain" href="${pageContext.request.contextPath}/my_profits">
											<h4 class="header-margin-none margin-top-5">
												<b>0</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter menu-sotitle">기술자 진행 건</h5>
										<a class="plain" href="${pageContext.request.contextPath}/my_orders">
											<h4 class="header-margin-none margin-top-5">
												<b>0</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center">
										<h5 class="header-margin-none font-color-lighter menu-sotitle">기술자 완료 건</h5>
										<a class="plain" href="${pageContext.request.contextPath}/seller/profits_history">
											<h4 class="header-margin-none margin-top-5">
												<b>0</b>
											</h4>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 리스트 뿌려주는 부분 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="mylist-area" style="border: 1px solid red; height: 375px; text-align: center; background-color: white;">
							<br/><br/><br/><br/><br/><br/><br/>
							<b>나의 리스트정보를 뿌려주는 곳입니다.</b>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 몸체부분 -->
		

	<!-- 모달창 -->
	<%@ include file="../common/modal_msg.jsp"%>
	<!-- //모달창 끝 -->

	<!-- Footer section(하단부분) -->
	<%@ include file="../common/commonBottom.jsp"%>
	<!-- Footer section(하단부분) -->
	</div>
</body>
</html>


