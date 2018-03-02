<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<!-- CSS작업부분 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myinfo.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>


</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader"
		src="${pageContext.request.contextPath}/resources/images/preloader.gif"
		alt="" />
	<!-- //PRELOADER -->

	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_1.jsp"%>
	</div>
	<!-- Top영역 2첫번째  (마이페이지부분의 탑2 적용)-->
	<div class="row">
		<%@ include file="../common/commonTop_2_mypage.jsp"%>
	</div>

	<!-- Body영역 -->
	<div class="row" id="row-body-my-profile">
		<div class="col-lg-2 col-sm-1 col-xs-0"></div>
		<div class="col-lg-8 col-sm-10 col-xs-12">
			<!-- 서브메뉴부분 -->
			<div class="col-xs-2" id="profile-menu">
				<h3>계정설정</h3>
				<a href="${pageContext.request.contextPath}/mypage/myinfo"><p>계정정보</p></a>
				<a href="#"><p>인증정보</p></a>
				<a href="#"><p>알림설정</p></a>
				<a href="${pageContext.request.contextPath}/member/change_password"><p>비밀번호 변경</p></a>
				<a href="${pageContext.request.contextPath}/member/withdraw"><p>회원탈퇴</p></a>
			</div>
			<!-- 기본정보부분 -->
			<div class="col-xs-10" id="profile-info">
				<h4>기본정보</h4>
				<table>
					<tr class="mini-title">
						<!-- 프로필이미지 -->
						<td rowspan="8" class="image-area" align="center">
								
								<c:choose>
		
									<c:when test="${(not empty loginUserInfo) && loginUserInfo.profile_img_path!=''}">
									
									<img src="${pageContext.request.contextPath}/resources/upload/member/${loginUserInfo.member_srl}/profile/${loginUserInfo.profile_img_path}" class="profile-image" />
									
									</c:when>
							
									<c:otherwise>
									
									<img src="${pageContext.request.contextPath}/resources/images/main_user_gray.png" class="profile-image" />
							
									</c:otherwise>
								</c:choose>
								
								<input id="thumbnail_upload" name="file" type="file"
															style="display: none;">
								<div class="margin-top-20">
															<label id="profilePictureBtn"
																class="label-margin-none btn btn-default btn-sm width-100px border-888"
																for="thumbnail_upload"> 이미지 등록 </label>
														</div>
							
						</td>
						<td colspan="4"><span class="info-title">아이디</span></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" class="form-control"
							placeholder="${loginUserInfo.user_id}" disabled="disabled" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="2">
							<span class="info-title">
							이름 (
							<c:choose>
							<c:when test="${loginUserInfo.gender == 'M' }">
								남
							</c:when>
							<c:otherwise>
								여
							</c:otherwise>
							</c:choose>
							)
							</span>
						</td>
						<td colspan="2" class="edit"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" class="form-control"
							placeholder="${loginUserInfo.user_name}" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="2"><span class="info-title">생년월일</span></td>
						<td colspan="2" class="edit"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" class="form-control"
							placeholder="${loginUserInfo.birthday}" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="2"><span class="info-title">지역</span></td>
						<td colspan="2" class="edit"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" class="form-control"
							placeholder="${loginUserInfo.address}" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="2"><span class="info-title">이메일</span></td>
						<td colspan="2" class="edit"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" class="form-control"
							placeholder="${loginUserInfo.email_address}" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="1"><span class="info-title">연락가능시간설정</span></td>
						<td colspan="1" class="edit" id="margin-right20"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
						<td colspan="1"><span class="info-title">연락처</span></td>
						<td colspan="1" class="edit"><a href="#"><span
								class="glyphicon glyphicon-pencil"></span>수정</a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="form-inline">
								<select id="av_time_to1"
									class="form-control input-sm padding-side-15">
									<option value="0"></option>
									<option value="0">0시</option>
									<option value="1">1시</option>
									<option value="2">2시</option>
									<option value="3">3시</option>
									<option value="4">4시</option>
									<option value="5">5시</option>
									<option value="6">6시</option>
									<option value="7">7시</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
									<option value="22">22시</option>
									<option value="23">23시</option>
									<option value="24">24시</option>
								</select> ~ <select id="av_time_to2"
									class="form-control input-sm padding-side-15">
									<option value="0"></option>
									<option value="0">0시</option>
									<option value="1">1시</option>
									<option value="2">2시</option>
									<option value="3">3시</option>
									<option value="4">4시</option>
									<option value="5">5시</option>
									<option value="6">6시</option>
									<option value="7">7시</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
									<option value="22">22시</option>
									<option value="23">23시</option>
									<option value="24">24시</option>
								</select>
							</div>
						</td>
						<td colspan="2"><input type="text" class="form-control"
							placeholder="${loginUserInfo.mobile}" /></td>
					</tr>
					<tr  class="mini-title">
						<td colspan="2" class="edit"><a href="#" >프로필 수정하러가기></a>
					</tr>
					
				</table>
			</div>
		</div>
		<div class="col-lg-2 col-sm-1 col-xs-0"></div>
	</div>

	<!-- 모달창 -->
	<%@ include file="../common/modal_msg.jsp"%>
	<!-- //모달창 끝 -->

	<!-- Footer section(하단부분) -->
	<%@ include file="../common/commonBottom.jsp"%>
	<!-- Footer section(하단부분) -->


</body>
</html>
