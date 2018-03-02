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

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

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
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->

		<%@ include file="../../common/top_main2.jsp"%>

		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->
			<div class="container ">
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
						<c:when test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
							<div>
								<button type="button" class="btn btn-primary" onclick="javascript:modifyRow(${view.notice_srl});" style="color: black;">수정하기</button>
								<button type="button" class="btn btn-primary" onclick="javascript:deleteRow(${view.notice_srl});" style="color: black;">삭제하기</button>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="col-xs-2 col-md-2"></div>
				<!-- test용 끝 -->
			</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
