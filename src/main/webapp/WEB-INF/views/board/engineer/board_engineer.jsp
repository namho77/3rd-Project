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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>기술자 게시판|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="http://abusinesstheme.com/demo/voyo/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-144x144.png">

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>



<script type="text/javascript">
$(document).ready(function(){
	  
	$.ajax({
		url : "./engineer/list",
		dataType : "html",
		type : "get",
		contentType : "text/html; charset:UTF-8",
		data : {param1:"값1"},
		success : function(d){
			$('#boardHTML').html(d); 
		},
		error : function(d){
			alert("실패 : "+d);
		}
	});
});
</script>
</head>
<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div id="wrapper" class="preloader_hide">

		<!-- header section -->
			<%@ include file="../../common/commonTop_1.jsp"%>
		<!--// header section -->
		<!-- header section -->
			<%@ include file="../../common/commonTop_2.jsp"%>
		<!--// header section -->
		

		<!-- 모달창 메시지 -->
			<%@ include file="../../common/modal_msg.jsp"%>
		<!--// 모달창 메시지 -->

	<!-- Body영역 -->
	
		<div class="row" id="boardHTML"></div>

	<!-- Bottom영역 -->
	<div class="row">
		<%@ include file="../../common/commonBottom.jsp"%>
	</div>
	</div>
</body>
</html>