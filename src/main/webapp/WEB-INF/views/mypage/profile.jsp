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
<!-- CSS작업부분 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<style type="text/css">

.header-top{
	height: 340px;
	background-color: #27CEA7;
}

.image-title{
	text-align: center;
}

.image-title>img{
	height: 100px;
	width: 100px;
	border-radius: 50%;
	margin-top: 110px;
}

.text-title{
	text-align: center;
}

.text-title>h4{
	margin-bottom: 8px;
}

.text-title>p{
	color: #5D5D5D;
	font-weight: bold;
	font-size: 14px;
}

.body-center{
	height: 700px;
	background-color: #FAFAFA;
}

.nav-title{
	width: 100%;
}

.nav-title>table{
	border: 1px solid #E1E1E1;
	background-color: white;
	height: 50px;
	width: 100%;
	text-align: center;
}

</style>

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
	<div class="preloader_hide">

	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_1.jsp"%>
	</div>
	
	<!-- 프로필 바디부분 -->
	<div class="container-fluid header-top">
		<div class="image-title">
			<img src="${pageContext.request.contextPath}/resources/images/main_user_gray.png">
		</div>
		<div class="text-title">
			<h4>kosmo1004</h4>
			<p>한줄소개를 작성하여 자신의 프로필을 더욱 어필해보세요!</p>
		</div>
		<div class="nav-title">
			<table>
				<tr>
					<td>만족도:78%</td>
					<td>총 작업수:10 개</td>
					<td>문의하기</td>
					<td>평균 응답시간:1시간이내</td>
					<td>최종 작업물 발송:3 주일 전</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container-fluid body-center">
		
	</div>
		

	<!-- 모달창 -->
	<%@ include file="../common/modal_msg.jsp"%>
	<!-- //모달창 끝 -->

	<!-- Footer section(하단부분) -->
	<%@ include file="../common/commonBottom.jsp"%>
	<!-- Footer section(하단부분) -->
	</div>
</body>
</html>

