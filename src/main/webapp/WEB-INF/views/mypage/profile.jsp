<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
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
<title>개인정보취급방침|OUR PLANNERS</title>
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


<style>
body {
	background: #fafafa !important;
	font-size: 14px;
}

.font-size-h1, h1 {
	font-size: 22px !important;
}

.font-size-h2, h2 {
	font-size: 20px !important;
}

.font-size-h3, h3 {
	font-size: 18px !important;
}

.font-size-h4, h4 {
	font-size: 16px !important;
}

.font-size-h5, h5 {
	font-size: 14px !important;
}

.font-size-h6, h6 {
	font-size: 12px !important;
}

.card-font-size-default, p {
	font-size: 13px !important;
}

.card-font-size-small {
	font-size: 11px !important;
}

.panel, .panel-heading, .form-control {
	border-radius: 0;
}

.border-radius-none {
	border-radius: 0 !important;
}

.border-radius {
	border-radius: 4px !important;
}

.modal-content {
	border-radius: 0 !important;
	border: none !important;
}
</style>

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


		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->

			<div class="container" style="margin-top: 100px;">


				<div class="row margin-top-40">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-2">
								<h2 class="margin-top-0 margin-bottom-20">

									<b>계정설정( 바디부분 수정해야 하는 페이지 )</b>

								</h2>
								
								<ul class="my-profile-menu-list list-style-none font-size-h4"
									role="tablist">
									<li role="presentation"
										class="margin-right-30 position-relative  active "><a
										class="plain font-color-lighter"
										href="https://kmong.com/my_profile">나의정보</a></li>

									<li role="presentation"
										class="margin-right-30 position-relative "><a
										class="plain font-color-lighter"
										href="https://kmong.com/my_profile/certification">인증정보</a></li>

									<li role="presentation"
										class="margin-right-30 position-relative "><a
										class="plain font-color-lighter"
										href="https://kmong.com/my_profile/mail_settings">알림설정</a></li>

									<li role="presentation"
										class="margin-right-30 position-relative "><a
										class="plain font-color-lighter"
										href="https://kmong.com/my_profile/change_password">비밀번호
											변경</a></li>

									<li role="presentation"
										class="margin-right-30 position-relative "><a
										class="plain font-color-lighter"
										href="https://kmong.com/my_profile/leave">회원탈퇴</a></li>
								</ul>

							</div>

							<div class="col-xs-10 padding-left-0">
								<div class="row">
									<div class="col-xs-12">
										<div class="panel panel-default margin-none">
											<div class="panel-body padding-all-30">
												<div class="row">
													<div class="col-xs-12">
														<h4 class="NGB margin-none padding-bottom-5 line-panel">기본정보</h4>
													</div>
												</div>
												<div class="row margin-top-20">
													<div class="col-xs-3 text-center">
														<img id="thumbnail" class="profile-image"
															src="https://kmong.com/img/tools/main_user_gray.png"
															title="dmacoder"
															onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png';">
														<input id="thumbnail_upload" name="file" type="file"
															style="display: none;">

														<div class="margin-top-20">
															<label id="profilePictureBtn"
																class="label-margin-none btn btn-default btn-sm width-100px border-888"
																for="thumbnail_upload"> 이미지 등록 </label>
														</div>
													</div>
													<div class="col-xs-9 padding-left-0">
														<div class="row">
															<div class="col-xs-12">
																<div class="form-group position-relative">
																	<label class="label-margin-none margin-bottom-10"
																		for="username"> 이메일 </label> <input
																		class="form-control input-sm" type="text" name="email"
																		value="dmacoder@gmail.com" disabled="disabled">
																</div>
															</div>
														</div>
														<div id="username_body" class="row margin-top-20">
															<div class="col-xs-12 position-relative">
																<div class="form-group position-relative">
																	<label class="label-margin-none margin-bottom-10"
																		for="username"> 닉네임&nbsp;<i
																		class="fa fa-info-circle" data-toggle="tooltip"
																		data-placement="right" data-title="닉네임 변경은 1회만 가능합니다"
																		data-original-title="" title=""></i>
																	</label>
																	<div class="pull-right" style="">
																		<a href="javascript:void(0);"
																			class="btn btn-link btn-xs link-color-blue text-underline">
																			<i class="fa fa-pencil" aria-hidden="true"></i> 수정
																		</a>
																	</div>
																	<div id="username_change_btn_group" class="pull-right"
																		style="display: none;">
																		<a href="javascript:void(0);"
																			class="btn btn-link padding-right-0 btn-xs link-color-blue text-underline">취소</a>
																		<a href="javascript:void(0);"
																			class="btn btn-link btn-xs link-color-blue text-underline">저장</a>
																	</div>
																	<input id="username" name="username" type="text"
																		class="form-control input-sm" value="dmacoder"
																		disabled="disabled">

																	<div>
																		<span id="username_error"
																			class="help-block padding-left-0"
																			style="display: none"></span> <span
																			id="username_success"
																			class="help-block padding-left-0 color-success"
																			style="display: none"></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="row margin-top-20">
															<div id="av_time_body" class="col-xs-6 position-relative">
																<div class="row">
																	<div class="col-xs-5 padding-right-0">
																		<div class="form-group position-relative">
																			<label class="label-margin-none margin-bottom-10"
																				for="username"> 연락 가능 시간 설정 </label>

																			<div class="select-control">
																				<select id="av_time_from"
																					class="form-control input-sm padding-side-15"
																					disabled="disabled">
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
																		</div>
																	</div>
																	<div class="col-xs-2 text-center">
																		<div class="form-group position-relative">
																			<label class="label-margin-none margin-bottom-5">&nbsp;</label>
																			<div class="align-input-sm">~</div>
																		</div>
																	</div>
																	<div class="col-xs-5 padding-left-0">
																		<div class="form-group position-relative">
																			<label class="label-margin-none margin-bottom-10"
																				for="av_time">&nbsp;</label>
																			<div class="pull-right" style="">
																				<a href="javascript:void(0);"
																					class="btn btn-link link-color-blue text-underline btn-xs">
																					<i class="fa fa-pencil" aria-hidden="true"></i> 수정
																				</a>
																			</div>
																			<div id="av_time_change_btn_group" class="pull-right"
																				style="display: none;">
																				<a href="javascript:void(0);"
																					class="btn btn-link padding-right-0 link-color-blue text-underline btn-xs">취소</a>
																				<a href="javascript:void(0);"
																					class="btn btn-link link-color-blue text-underline btn-xs">저장</a>
																			</div>

																			<div class="select-control">
																				<select id="av_time_to"
																					class="form-control input-sm padding-side-15"
																					disabled="disabled">
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
																		</div>
																	</div>
																</div>
																<div>
																	<span id="av_time_error"
																		class="help-block padding-left-0"
																		style="display: none"></span> <span
																		id="av_time_success"
																		class="help-block padding-left-0 color-success"
																		style="display: none"></span>
																</div>
															</div>
															<div id="contact_number_body"
																class="col-xs-6 padding-left-0">
																<div class="form-group position-relative">
																	<label
																		class="label-margin-none margin-bottom-10 pull-left"
																		for="username"> 연락처 </label>
																	<div class="awesome-checkbox pull-left margin-left-10">
																		<label> <input id="open_mobile"
																			type="checkbox" value="1" checked=""> <span
																			class="awesome-checkbox-body"></span> <span
																			class="awesome-checkbox-text safeNumberTooltip font-size-h6 margin-left-5 font-color-lighter"
																			style="width: 160px;">미결제 회원에게 안심번호 공개 <i
																				class="fa fa-question-circle" data-toggle="tooltip"
																				aria-hidden="true" data-placement="right" title=""
																				data-original-title="• 결제를 진행하지 않은 크몽의 모든 회원에게 전문가의 실제 전화번호 대신 임시의 가상 번호를 노출합니다.<br />• 안심번호를 통해 통화한 내용은 녹취됩니다. "></i>
																		</span>
																		</label>
																	</div>

																	<div class="pull-right" style="">
																		<a href="javascript:void(0);"
																			class="btn btn-link link-color-blue text-underline btn-xs">
																			<i class="fa fa-pencil" aria-hidden="true"></i> 수정
																		</a>
																	</div>
																	<div id="contact_number_change_btn_group"
																		class="pull-right" style="display: none;">
																		<a href="javascript:void(0);"
																			class="btn btn-link padding-right-0 link-color-blue text-underline btn-xs">취소</a>
																		<a href="javascript:void(0);"
																			class="btn btn-link link-color-blue text-underline btn-xs">저장</a>
																	</div>
																	<input id="contact_number"
																		class="form-control input-sm" type="text"
																		name="contact_number" value="01098023638"
																		disabled="disabled">
																</div>
																<div>
																	<span id="contact_number_error"
																		class="help-block padding-left-0"
																		style="display: none"></span> <span
																		id="contact_number_success"
																		class="help-block padding-left-0 color-success"
																		style="display: none"></span>
																</div>
															</div>
														</div>
														<div class="row margin-top-20">
															<div class="col-xs-6 position-relative" style="top: 8px;">
																<span class="font-color-lighter">프로필 완성도:</span>&nbsp; <span
																	class="NGB"><b>10%</b> </span>
															</div>
															<div class="col-xs-6 text-right">
																<a class="btn btn-link link-color-blue btn-xss"
																	href="/@dmacoder">프로필 완성하러가기 &gt;</a>
															</div>
														</div>
														
														
														
													</div>
												</div>
											</div>
										</div>

									</div>
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

		<!-- Footer section(하단부분) -->
		<%@ include file="../common/commonBottom.jsp"%>
		<!-- Footer section(하단부분) -->
	</div>
</body>
</html>

