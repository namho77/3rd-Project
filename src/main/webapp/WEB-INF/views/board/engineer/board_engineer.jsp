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

<title>board_engineer_list</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- JS FILES(자바스크립트 연결부분) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/list.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

	
</head>

<body>
<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">
	<!-- header section -->
		<!-- header navigation(탑1 부분) -->
			<%@ include file="../../common/top1.jsp"%>
		<!-- header navigation(탑1 부분) -->
		
		<!-- 네비게이션 탑2 부분 -->
			<header id="header" class="fixed">
				<div class="header-content clearfix">
					<nav class="navigation" role="navigation">
						<ul class="primary-nav">
							<li><a href="#works" class="field">건축</a></li>
							<li><a href="#teams" class="field">IT</a></li>
							<li><a href="#testimonials" class="field">자동차</a></li>
							<li><a href="#contact" class="field">교육</a></li>
						</ul>
					</nav>
				</div>
			</header>
	
	<!-- 내용 -->
	

	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="col-lg-1 col-md-1 col-sm-1 work"></div>
			
			<div class="col-lg-2 col-md-2 col-sm-2 work">카테고리영역</div>
			
			<div class="col-lg-1 col-md-1 col-sm-1 work"></div>
			
			<!-- Contents영역 -->
			<div class="col-lg-7 col-md-7 col-sm-7 work">
				
				<div class="row" style="padding:0 10px;" id="boardHTML">
					<h2 style="text-align:center;">게시글 리스트</h2>
				</div>
				
			</div>
		
			<div class="col-lg-1 col-md-1 col-sm-1 work"></div>
		</div>
	</div>
	
	
	<!-- Footer section(하단부분) -->
	<footer class="footer">
		<%@ include file="../../common/bottom.jsp"%>
	</footer>
	<!-- Footer section(하단부분) -->
</div>
</body>
</html>
