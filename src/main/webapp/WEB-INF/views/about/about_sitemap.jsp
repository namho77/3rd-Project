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
<title>사이트맵|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

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

		<!-- HEADER -->

		<%@ include file="../common/top_main2.jsp"%>

		<!-- HOME -->
		<header class="titlebar titlebar1">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h1 class="page-title pull-left">Sitemap</h1>
						<ol class="breadcrumb pull-right">
							<li><a href="#">Home</a></li>
							<li><a href="#">Temaplate</a></li>
							<li class="active">Sitemap</li>
						</ol>
					</div>
				</div>
			</div>
		</header>
		<section class="page-sitemap section-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-4 sm-box">
						<h2 class="section-title-2">Blog</h2>
						<ul>
							<li><a href="#">Classic - Small</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
								</ul></li>
							<li><a href="#">Classic - Large</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
								</ul></li>
							<li><a href="#">Grid</a>
								<ul>
									<li><a href="#">2 Columns</a></li>
									<li><a href="#">3 Columns</a></li>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
								</ul></li>
							<li><a href="#">Post</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
									<li><a href="#">Full Width</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="col-sm-6 col-md-4 xs-box">
						<h2 class="section-title-2">Portfolio</h2>
						<ul>
							<li><a href="#">Filterable</a>
								<ul>
									<li><a href="#">2 Columns</a></li>
									<li><a href="#">3 Columns</a></li>
									<li><a href="#">4 Columns</a></li>
								</ul></li>
							<li><a href="#">Filterable Text</a>
								<ul>
									<li><a href="#">2 Columns</a></li>
									<li><a href="#">3 Columns</a></li>
									<li><a href="#">4 Columns</a></li>
								</ul></li>
							<li><a href="#">Sidebar</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Left Text</a></li>
									<li><a href="#">Sidebar Right</a></li>
									<li><a href="#">Sidebar Right Text</a></li>
								</ul></li>
							<li><a href="#">Single Project</a>
								<ul>
									<li><a href="#">Project Wide</a></li>
									<li><a href="#">Project Half</a></li>
									<li><a href="#">Project Sidebar</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="col-sm-6 col-md-4">
						<h2 class="section-title-2">Shop</h2>
						<ul>
							<li><a href="#">Grid</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
									<li><a href="#">Full Width</a></li>
								</ul></li>
							<li><a href="#">List</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
									<li><a href="#">Full Width</a></li>
								</ul></li>
							<li><a href="#">Product</a>
								<ul>
									<li><a href="#">Sidebar Left</a></li>
									<li><a href="#">Sidebar Right</a></li>
									<li><a href="#">Full Width</a></li>
								</ul></li>
							<li><a href="#">Account</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Cart</a></li>
							<li><a href="#">Confirmation</a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
