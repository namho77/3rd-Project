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
<title>사이트 이용약관|OUR PLANNERS</title>
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
			<div class="container">
				<div class="row margin-top-30">
					<div class="col-xs-2 padding-left-0">
						<ul class="list-unstyled">
							<li class="padding-top-0 padding-bottom-0">
								<h3 class="NGB">약관</h3>
							</li>
							<li>
								<h5 class="margin-bottom-0">
									<a class="plain" href="${pageContext.request.contextPath}/policy/provision">서비스 이용약관</a>
								</h5>
							</li>
							<li>
								<h5 class="margin-bottom-0">
									<a class="plain" href="${pageContext.request.contextPath}/policy/privacy">개인정보 취급방침</a>
								</h5>
							</li>
						</ul>
					</div>

					<div class="col-xs-10 padding-left-0">
						<div class="panel panel-default">
							<div class="panel-body padding-all-0 overflow-hidden border-solid">
								<div class="text-style">
									<iframe src="https://docs.google.com/document/d/1Uff93-fWc436X6ldmkE_smg3B_Lqry2gTYg58UzQ6Oo/pub?embedded=true" width="100%" style="height: 25250px;" border="0"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
