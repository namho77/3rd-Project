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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
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

<script type="text/javascript">
function deleteRow(idx) {
	var url = "${pageContext.request.contextPath}/notice/deleteRow"
	$.ajax({
		url:url,
		type:"get",
		data:{srl:idx},
		dataType:"json",
		contentType:"text/html; charset:utf-8",
		success:function(d){
			if(d.Code == 0){
				alert("게시물 삭제에 실패하였습니다.");				
			}
			else if(d.Code == 1){
				alert("게시물 삭제에 성공하였습니다.");
				location.href="${pageContext.request.contextPath}/";
			}				
		},
		error:function(e){
			alert("실패:"+e.status+":"+e.statusText);
		}
	});
}	
</script>
</head>
<body>

	<!-- PRELOADER -->
	<img id="preloader"
		src="${pageContext.request.contextPath}/resources/images/preloader.gif"
		alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->
		<header>
			<section class="banner" role="banner">
				<!-- header navigation(상단 메뉴 부분) -->

				<%@ include file="../../common/top_main.jsp"%>
				<!--// header navigation(상단 메뉴 부분) -->
			</section>
		</header>
		<!-- //HEADER -->
	</div>
	<!-- test용 시작-->
	<div class="col-xs-4 col-md-4"></div>
	<div class="col-xs-6 col-md-6">
		<div style="font-size: 1.5em; color: black;" id="noticeText_${view.notice_srl }">
			<div class="col-xs-3 col-md-3">${view.notice_srl }</div>
			<div class="col-xs-3 col-md-3">${view.title }</div>
			<div class="col-xs-4 col-md-4">${view.contents }</div>
			<div class="col-xs-2 col-md-2">${view.postdate }</div>
		</div>
	<c:choose>
		<c:when
			test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
			<div>
				<button type="button" class="btn btn-primary" onclick="javascript:modifyRow(${view.notice_srl});" style="color: black;">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="javascript:deleteRow(${view.notice_srl});" style="color: black;">삭제하기</button>				
			</div>
		</c:when>
	</c:choose>
	</div>
	<div class="col-xs-2 col-md-2"></div>
	<!-- test용 끝 -->
</body>
</html>