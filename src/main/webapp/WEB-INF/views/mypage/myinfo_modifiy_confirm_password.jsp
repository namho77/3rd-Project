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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="http://abusinesstheme.com/demo/voyo/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-144x144.png">

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
		<section id="main" class="section">

			<!-- CONTAINER -->
			<div class="container">
				<!-- 좌우측의 공간 확보 -->
				<br />
				<br />

				<div class="row">
					<h3 class="text-center">
						<b>내 정보를 <span class="text-primary">최신 정보로 관리</span>해 주세요.
						</b>
					</h3>
					<p class="text-center">아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내정보를 관리하세요.</p>
					<hr class="container col-lg-4 col-lg-offset-4" />

				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">아이디</div>
					<div class="col-lg-2 text-center">${loginUserInfo.user_id}</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">이름</div>
					<div class="col-lg-2 text-center">${loginUserInfo.user_name}</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">성별</div>
					<div class="col-lg-2 text-center">

						<c:choose>
							<c:when test="${loginUserInfo.gender == 'M' }">
			남자
		</c:when>

							<c:otherwise>
		여자
		</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">생년월일</div>
					<div class="col-lg-2 text-center">${loginUserInfo.birthday}</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">지역</div>
					<div class="col-lg-2 text-center">${loginUserInfo.address}</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">이메일</div>
					<div class="col-lg-2 text-center">${loginUserInfo.email_address}</div>
				</div>

				<div class="row">
					<div class="col-lg-offset-4 col-lg-2 text-center">휴대전화</div>
					<div class="col-lg-2 text-center">${loginUserInfo.mobile}</div>
				</div>
				<br />
				<form name="memberInfoFrm" method="post" action="<c:url value="../mypage/myinfo"/>">
					<input type="hidden" name="action" value="password" />
					<div class="row text-center">
						<button type="submit" class="btn btn-info">정보수정</button>
					</div>
				</form>
				<br />
				<br />


			</div>
			<!-- //CONTAINER -->


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
