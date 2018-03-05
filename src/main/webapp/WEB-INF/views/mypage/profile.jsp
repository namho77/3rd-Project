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
		<!-- Top영역 2첫번째  (마이페이지부분의 탑2 적용)-->
		<div class="row">
			<%@ include file="../common/commonTop_2_mypage.jsp"%>
		</div>


		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->

			<div class="container" style="margin-top: 100px;">


				<div id="userDiv">

					<div class="bg-color-yellow-400">
						<div class="container">
							<div class="row">
								<div class="col-xs-12 text-center padding-top-50 padding-bottom-50">
									<div class="row">
										<div class="col-xs-12">
											<div class="position-relative inline-block">
												<div class="user-profile overflow-hidden">
													<img id="thumbnail" class="width-100" src="${pageContext.request.contextPath}/resources/images/main_user_gray.png" title="dmacoder" style="width: 100px; height: 100px;" onError="this.onerror=null;this.src='/img/tools/main_user_gray.png';">
												</div>
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="${pageContext.request.contextPath}/grade"> <img class="width-100" src="${pageContext.request.contextPath}/resources/images/grade/grade_NEW.png" data-toggle="tooltip" data-placement="right" title="" data-original-title="NEW">
													</a>
												</div>
												<div class="user-profile-upload text-center">
													<label class="label-margin-none cursor" for="thumbnail_upload"> <i id="thumbnail_upload_icon" class="fa fa-camera color-white user-profile-photo-icon-background" aria-hidden="true"></i>
													</label>
												</div>
												<input id="thumbnail_upload" name="file" type="file" style="display: none;">
											</div>
											<h2 class="margin-top-5">dmacoder</h2>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-3"></div>
										<div class="col-xs-6">
											<div id="summaryView" class="margin-bottom-20">
												<span v-show="summary && summary.data.description != ''" style="display: none">{{summary.data.description}}</span> <span v-show="!(summary && summary.data.description != '')" style="display: none">한줄소개가 없습니다.</span> &nbsp; <i v-show="!summary" class="fa fa-pencil color-primary cursor" aria-hidden="true" v-on:click="openCreateInput('summary')" style="display: none"></i> &nbsp; <i v-show="summary" class="fa fa-pencil color-primary cursor" aria-hidden="true" v-on:click="openUpdateInput('summary')" style="display: none"></i>
											</div>
											<div id="summaryInput" style="display: none">
												<div class="form-group position-relative">
													<input type="text" class="form-control user-form-control input-xs user-input-info" v-model="summaryInformation" maxlength="50" />
													<div class="user-input-save">
														<span class="font-size-h6"><span :class="{'color-danger': summaryInformation.length > 50}">{{ summaryInformation.length }}</span> / 50</span> <a class="btn btn-default btn-xs margin-right-5" v-on:click="hideCreateInput('summary')">취소</a> <a class="btn btn-primary btn-xs" v-on:click="createUserInformation('summary')">저장</a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-3"></div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="container profile-top-nav">
						<div id="userScrollFix" class="row text-center user-info-nave">
							<div class="col-xs-5 padding-right-0">
								<div class="row">
									<div class="col-xs-6 padding-right-0">
										<div class="panel panel-default margin-top-0 border-radius-0 border-right-none margin-none">
											<div class="panel-body profile-nav-shadow">
												<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">만족도 : 0%</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-6 padding-left-0">
										<div class="panel panel-default margin-top-0 border-radius-0 border-right-none">
											<div class="panel-body profile-nav-shadow">
												<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">총 작업수 : 0 개</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-2 padding-left-0 padding-right-0">
								<a href="${pageContext.request.contextPath}/profile/dmacoder?type=buyer" class="btn btn-primary border-solid-none btn-block border-radius-0 padding-top-15 padding-bottom-15 position-relative profile-hover profile-nav-shadow">
									<h5 class="margin-top-5 margin-bottom-5">
										<i class="fa fa-eye" aria-hidden="true"></i> 의뢰인 시점으로 보기
									</h5>
									<div class="user-profile-arrow bg-color-primary"></div>
								</a>
							</div>
							<div class="col-xs-5 padding-left-0">
								<div class="row">
									<div class="col-xs-6 padding-right-0 margin-none">
										<div class="panel panel-default margin-top-0 border-radius-0 border-right-none margin-none">
											<div class="panel-body profile-nav-shadow">
												<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">평균 응답시간 : 아직몰라요</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-6 padding-left-0">
										<div class="panel panel-default margin-top-0 border-radius-0 margin-none">
											<div class="panel-body profile-nav-shadow">
												<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">최종 작업물 발송 : 아직몰라요</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="container padding-top-45">





						<div class="row margin-top-20 margin-bottom-10">
							<div class="col-xs-7">
								<h4 class="NGB">dmacoder님의 서비스</h4>
							</div>
							<div class="col-xs-2">
								<div class="text-right margin-top-5">
									<a class="btn btn-primary-reverse btn-xs" href="${pageContext.request.contextPath}/ad_request">광고신청</a>
								</div>
							</div>
							<div class="col-xs-3"></div>
						</div>
						<div class="row">
							<div class="col-xs-9">
								<div id="userGigsDiv">
									<div class="row user-gigs-list margin-none">
										<div class="op-grid-3-20 margin-top-20">
											<div class="bg-color-e6">
												<div class="panel-body text-center">
													<div class="user-profile overflow-hidden inline-block" style="margin-top: 7px !important;">
														<img class="width-100" src="/img/user/desktop/user_gig.png" alt="프로필 이미지" />
													</div>
													<h4 class="text-style NGB margin-top-15 padding-bottom-30">
														서비스를 등록하여 <br /> 수익을 얻어보세요!
													</h4>
													<a href="${pageContext.request.contextPath}/my_gigs/new?target=user_profile" class="btn btn-primary btn-sm btn-block margin-top-30">서비스 등록하기</a>
												</div>
											</div>
										</div>
									</div>

								</div>



								<div class="row">
									<div class="col-xs-12">
										<div class="row margin-top-50 margin-bottom-10 font-size-h3">
											<div class="col-xs-12">
												<h4 class="NGB inline-block">dmacoder님의 받은 평가&nbsp;&nbsp;</h4>
												<div class="text-left inline-block">
													<div class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
														<div class="rating-stars">
															<span class="empty-stars"> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span> <span class="star"><i class="fa fa-star color-e3"></i></span>
															</span> <span class="filled-stars" style="width: 0%;"> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span> <span class="star"><i class="fa fa-star"></i></span>
															</span>
														</div>
													</div>
												</div>

												<div class="inline-block font-size-h5">(0)</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xs-12">
												<ul id="userRatingsDiv" class="list-group"></ul>
											</div>
										</div>

										<div id="loadUSerRatingsBtnWrapper" class="row" style="display: none">
											<div class="col-xs-12">
												<a id="loadUserRatingsBtn" class="btn btn-default btn-block border-solid border-radius-0" v-on:click="loadUserRatings($event)"></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3">



								<div class="border-left padding-left-10 padding-bottom-30 position-relative">
									<div class="inline-block side-info-circle">
										<div class="user-side-circle"></div>
									</div>
									<h5 class="margin-top-0 margin-bottom-5">
										<span class="NGB"> 기술 / 자격 <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="right" title="선택된 태그는 서비스 상세페이지에 노출됩니다."></i>
										</span>
									</h5>
									<div id="userMetadataWrapper" class="panel panel-default margin-top-5 margin-bottom-10">
										<div class="panel-body padding-all-10" v-show="isEditUserMetadata == false">
											<div class="row">
												<div class="col-xs-12" v-show="selected_metadata.length > 0" style="display: none;">
													<span v-for="selected_metadata in selected_metadata" class="position-relative">
														<button v-if="!(selected_metadata.user_metadata.need_certification == 1 && selected_metadata.status == 'APPROVED')" type="button" class="btn btn-gray-reverse font-color-light btn-xs btn-tag position-relative" data-toggle="tooltip" data-placement="top" title="{{tag.description.seller}}">{{ selected_metadata.user_metadata.title }}</button>
														<button v-if="selected_metadata.user_metadata.need_certification == 1 && selected_metadata.status == 'APPROVED'" type="button" class="btn btn-certification-reverse btn-xs btn-tag position-relative" data-toggle="tooltip" data-placement="top" title="전문가가 관련 서류를 제출하였습니다.">
															<img class="width-10px" src="/img/user/desktop/tag_on.png" /> {{ selected_metadata.user_metadata.title }}
														</button>
													</span>
												</div>
												<div id="selectedUserMetadataNone" class="col-xs-12" style="display: none;">등록된 태그가 없습니다.</div>
												<div id="selectedUserMetadataLoading" class="col-xs-12 text-center">
													<div class="la-ball-fall color-black">
														<div></div>
														<div></div>
														<div></div>
													</div>
												</div>
											</div>
										</div>

										<div class="panel-body padding-all-10" v-show="isEditUserMetadata == true" style="display: none">
											<div id="userMetadataCategorySelectWrapper" class="row">
												<div class="col-xs-12">
													<select class="form-control input-xs" v-model="selected_category_for_user_metadata">
														<option v-for="metadata in user_metadata" value="{{ metadata.category_id }}" v-html="metadata.name"></option>
													</select>
												</div>
											</div>

											<div id="userMetadataSelectWrapper" class="row margin-top-10">
												<div class="col-xs-12">
													<div class="border-radius bg-color-fa padding-all-10">
														<span v-for="tag in user_metadata_tag_list">
															<button v-if="tag.selected_user_metadata == null" type="button" class="btn btn-gray-reverse font-color-light btn-xs btn-tag" data-toggle="tooltip" data-placement="top" title="{{tag.description.seller}}" v-on:click="selectUserMetadata($event, tag.id, 'enable')">
																<img v-if="tag.need_certification == 1" class="width-10px" src="/img/user/desktop/tag.png" /> {{ tag.title }}
															</button>
															<button v-if="tag.selected_user_metadata != null" type="button" class="btn btn-gray-reverse font-color-light btn-xs btn-tag btn-tag-select" data-toggle="tooltip" data-placement="top" title="{{tag.description.seller}}" v-on:click="selectUserMetadata($event, tag.id, 'disable')">
																<img v-if="tag.selected_user_metadata.user_metadata.need_certification == 1 && tag.selected_user_metadata.status == 'WAITING'" class="width-10px" src="/img/user/desktop/tag.png" /> <img v-if="tag.selected_user_metadata.user_metadata.need_certification == 1 && tag.selected_user_metadata.status == 'APPROVED'" class="width-10px" src="/img/user/desktop/tag_on.png" /> {{ tag.selected_user_metadata.user_metadata.title }}
															</button>
														</span>
													</div>
												</div>
											</div>

											<div id="selectedUserMetadataListWrapper" class="row margin-top-10">
												<div class="col-xs-12">
													<span v-for="selected_metadata in selected_metadata" class="position-relative">
														<button type="button" class="btn btn-gray-reverse font-color-light btn-xs btn-tag btn-tag-select  position-relative" data-toggle="tooltip" data-placement="top" title="{{tag.description.seller}}">
															<img v-if="selected_metadata.user_metadata.need_certification == 1 && selected_metadata.status == 'WAITING'" class="width-10px" src="/img/user/desktop/tag.png" /> <img v-if="selected_metadata.user_metadata.need_certification == 1 && selected_metadata.status == 'APPROVED'" class="width-10px" src="/img/user/desktop/tag_on.png" /> {{ selected_metadata.user_metadata.title }} <i class="fa fa-times-circle tag-close cursor" aria-hidden="true" v-on:click="selectUserMetadata($event, selected_metadata.user_metadata.id, 'disable')"></i>
														</button>
													</span>
												</div>
											</div>

											<div id="userMetadataCertificationBtn" class="row margin-top-10" v-show="need_certification_selected_metadata.length > 0">
												<div class="col-xs-12">
													<button type="button" class="btn btn-gray-reverse font-color-light btn-sm btn-block" data-toggle="modal" data-target="#tagCertificationModal">
														<img class="user-metadata-certification-btn-img" src="/img/user/desktop/tag.png" /> 태그 인증받기
													</button>
												</div>
											</div>
										</div>
									</div>

									<div>
										<div id="certificatedReady" style="display: none" class="font-size-h6 color-red margin-left-5">
											<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> &nbsp; 인증 심사중입니다.
										</div>
										<div id="limitUserMetadataCntError" class="font-size-h6 color-red margin-left-5" style="display: none">
											<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> &nbsp; 기술 / 자격은 {{ limitUserMetadataCnt }}개이상 등록 할 수 없습니다.
										</div>
									</div>



									<div v-show="isEditUserMetadata == true" style="display: none;">
										<h5 class="margin-top-20">
											<span class="NGB">기술 / 자격 추천</span> <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="right" title="이 외 기술 / 자격을 추천해주세요."></i>
										</h5>
										<div class="form-group margin-bottom-0 position-relative">
											<input type="text" class="form-control input-xs" v-model="user_metadata_etc" /> <a class="btn btn-primary font-size-h6 tag-btn" :disabled="user_metadata_etc.length == 0" v-on:click="submitUserMetadataEtcToOp">보내기</a>
										</div>
									</div>
								</div>



								<div class="border-left padding-left-10 padding-bottom-30 position-relative">
									<div class="inline-block side-info-circle">
										<div class="user-side-circle"></div>
									</div>

									<h5 class="margin-top-0 margin-bottom-10">
										<span class="NGB">소개</span> <span id="descriptionEditBtnGroup"> <span class="pull-right font-size-h6" v-show="description == null"><a class="user-edit-text" href="javascript:void(0);" v-on:click="openCreateInput('description')">+ 추가</a></span> <span class="pull-right font-size-h6" v-show="description != null"><a class="user-edit-text" href="javascript:void(0);" v-on:click="openUpdateInput('description')">편집</a></span>
										</span>
									</h5>


									<div id="descriptionView" class="panel panel-default margin-top-5 margin-bottom-10">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break">
											<span v-if="description == null || description.data.description == ''">소개가 없습니다.</span> <span class="word-break" v-if="description != null && description.data.description != ''" v-html="description.data.description | nl2br"></span>
										</div>
									</div>

									<div id="descriptionInput" class="panel panel-default margin-top-5 margin-bottom-10" style="display: none;">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<textarea class="form-control padding-all-5 introduce-text" rows="5" placeholder="자기소개를 입력하세요." v-model="descriptionInformation" maxlength="255"></textarea>
											<div class="text-right margin-top-10">
												<a class="btn btn-default btn-xs" href="javascript:void(0);" v-on:click="hideCreateInput('description')">취소</a> <a class="btn btn-primary btn-xs margin-left-5" href="javascript:void(0);" v-on:click="createUserInformation('description')" :disabled="descriptionInformation.length == 0">저장</a>
											</div>
										</div>
									</div>
								</div>


								<div class="border-left padding-left-10 padding-bottom-30 position-relative">
									<div class="inline-block side-info-circle">
										<div class="user-side-circle"></div>
									</div>
									<h5 class="margin-top-0 margin-bottom-10">
										<span class="NGB">경력사항</span> <span id="careerEditBtnGroup"> <span id="career_AddBtn" class="pull-right font-size-h6"><a class="user-edit-text" href="javascript:void(0);" v-on:click="openCreateInput('career')">+ 추가</a></span>
										</span>
									</h5>
									<div id="careerView" class="panel panel-default margin-top-5 margin-bottom-10" v-show="career.length == 0">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<h5 class="margin-all-0">경력사항이 없습니다.</h5>
										</div>
									</div>

									<div v-for="data in career" class="position-relative">
										<div id="career_{{ data.id }}_view" class="panel panel-default margin-top-5 margin-bottom-10">
											<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break">
												<div>
													<span class="word-break">{{data.data.description}}</span> <span class="pull-right careerUserInformationEditBtnGroup"> <i class="fa fa-pencil cursor" aria-hidden="true" v-on:click="openUpdateUserInformation('career', data.id, $index)"></i> &nbsp; <i class="fa fa-trash cursor" aria-hidden="true" v-on:click="deleteUserInformation('career', data.id, $index, 'delete')"></i>
													</span>
												</div>
												<h6 class="margin-bottom-0">{{data.data.period_start}} ~ {{data.data.period_end}}</h6>
											</div>
										</div>


										<div id="career_{{ data.id }}_input" class="panel panel-default margin-top-5 margin-bottom-10" style="display: none">
											<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group margin-bottom-0">
															<input id="career_description_{{ data.id }}_input" type="text" class="career_description_input form-control input-xs" placeholder="경력사항" v-model="careerInformation" />
														</div>
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-5 padding-right-0">
														<input id="career_period_start_{{ data.id }}_input" type="text" class="career_period_start_input form-control input-xs date-input" v-model="period_start" onkeydown="return false">
													</div>
													<div class="col-xs-2">
														<div class="margin-top-5">~</div>
													</div>
													<div class="col-xs-5 padding-left-0">
														<input type="text" class="form-control input-xs date-input" v-model="period_end" onkeydown="return false">
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-12">
														<div class="text-right">
															<a class="btn btn-default btn-xs" href="javascript:void(0);" v-on:click="hideUpdateUserInformation('career', data.id, $index)">취소</a> <a class="btn btn-primary btn-xs margin-left-5" href="javascript:void(0);" v-on:click="updateUserInformation('career', data.id, $index)" :disabled="careerInformation.length == 0">저장</a>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="margin-left-15">
											<span id="career_description_{{ data.id }}_error" class="career_description_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;경력사항을 입력해주세요.</span> <span id="career_period_start_{{ data.id }}_error" class="career_period_start_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;경력시작일을 선택해주세요.</span>
										</div>

									</div>


									<div id="careerInput" class="panel panel-default margin-top-5 margin-bottom-10" style="display: none">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<div class="row">
												<div class="col-xs-12">
													<div class="form-group margin-bottom-0">
														<input id="career_description_input" type="text" class="career_description_input form-control input-xs" placeholder="경력사항" v-model="careerInformation" />
													</div>
												</div>
											</div>
											<div class="row margin-top-10">
												<div class="col-xs-5 padding-right-0">
													<input id="career_period_start_input" type="text" class="career_period_start_input form-control input-xs date-input" value="2017.03" v-model="period_start" onkeydown="return false">
												</div>
												<div class="col-xs-2">
													<div class="margin-top-5">~</div>
												</div>
												<div class="col-xs-5 padding-left-0">
													<input type="text" class="form-control input-xs date-input" v-model="period_end" onkeydown="return false">
												</div>
											</div>
											<div class="row margin-top-10">
												<div class="col-xs-12">
													<div class="text-right">
														<a class="btn btn-default btn-xs" href="javascript:void(0);" v-on:click="hideCreateInput('career')">취소</a> <a class="btn btn-primary btn-xs margin-left-5" href="javascript:void(0);" v-on:click="createUserInformation('career')" :disabled="careerInformation.length == 0">저장</a>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="margin-left-15">
										<span id="career_description_error" class="career_description_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;경력사항을 입력해주세요.</span> <span id="career_period_start_error" class="career_period_start_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;경력시작일을 선택해주세요.</span>
									</div>
								</div>


								<div class="border-left padding-left-10 padding-bottom-30 position-relative">
									<div class="inline-block side-info-circle">
										<div class="user-side-circle"></div>
									</div>
									<h5 class="margin-top-0 margin-bottom-10">
										<span class="NGB">자격증</span> <span id="licenseEditBtnGroup"> <span id="license_AddBtn" class="pull-right font-size-h6"><a class="user-edit-text" href="javascript:void(0);" v-on:click="openCreateInput('license')">+ 추가</a></span>
										</span>
									</h5>
									<div id="licenseView" class="panel panel-default margin-top-5 margin-bottom-10" v-show="license.length == 0">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<h5 class="margin-all-0">자격증이 없습니다.</h5>
										</div>
									</div>

									<div v-for="data in license" class="position-relative">
										<div id="license_{{ data.id }}_view" class="panel panel-default margin-top-5 margin-bottom-10">
											<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break">
												<div>
													<span>{{data.data.description}}</span> <span class="pull-right licenseUserInformationEditBtnGroup"> <i class="fa fa-pencil cursor" aria-hidden="true" v-on:click="openUpdateUserInformation('license', data.id, $index)"></i> &nbsp; <i class="fa fa-trash cursor" aria-hidden="true" v-on:click="deleteUserInformation('license', data.id, $index, 'delete')"></i>
													</span>
												</div>
												<h6 class="margin-bottom-0">{{data.data.licensed_at}} / {{ data.data.licensed_provider_center }}</h6>
											</div>
										</div>

										<div id="license_{{ data.id }}_input" class="panel panel-default margin-top-5 margin-bottom-10" style="display: none">
											<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group margin-bottom-0">
															<input id="license_description_{{ data.id }}_input" type="text" class="license_description_input form-control input-xs" placeholder="자격증" v-model="licenseInformation" />
														</div>
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-6 padding-right-5">
														<input id="license_licensed_at_{{ data.id }}_input" type="text" class="license_licensed_at_input form-control input-xs date-input" value="2018.03" v-model="licensed_at" onkeydown="return false">
													</div>
													<div class="col-xs-6 padding-left-5">
														<div class="form-group margin-bottom-0">
															<input id="license_licensed_provider_center_{{ data.id }}_input" type="text" class="license_licensed_provider_center_input form-control input-xs" placeholder="발급기관" v-model="licensed_provider_center" />
														</div>
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-12">
														<div class="text-right">
															<a class="btn btn-default btn-xs" href="javascript:void(0);" v-on:click="hideUpdateUserInformation('license', data.id, $index)">취소</a> <a class="btn btn-primary btn-xs margin-left-5" href="javascript:void(0);" v-on:click="updateUserInformation('license', data.id, $index)" :disabled="licenseInformation.length == 0">저장</a>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="margin-left-15">
											<span id="license_description_{{ data.id }}_error" class="license_description_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증명을 입력해주세요.</span> <span id="license_licensed_at_{{ data.id }}_error" class="license_licensed_at_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급일을 선택해주세요.</span> <span id="license_licensed_provider_center_{{ data.id }}_error" class="license_licensed_provider_center_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급기관을 입력해주세요.</span>
										</div>
									</div>

									<div id="licenseInput" class="panel panel-default margin-top-5 margin-bottom-10" style="display: none">
										<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<div class="row">
												<div class="col-xs-12">
													<div class="form-group margin-bottom-0">
														<input id="license_description_input" type="text" class="license_description_input form-control input-xs" placeholder="자격증명" v-model="licenseInformation" />
													</div>
												</div>
											</div>
											<div class="row margin-top-10">
												<div class="col-xs-6 padding-right-5">
													<input id="license_licensed_at_input" type="text" class="license_licensed_at_input form-control  input-xs date-input" value="2018.03" v-model="licensed_at" onkeydown="return false">
												</div>
												<div class="col-xs-6 padding-left-5">
													<div class="form-group margin-bottom-0">
														<input id="license_licensed_provider_center_input" type="text" class="license_licensed_provider_center_input form-control input-xs" placeholder="발급기관" v-model="licensed_provider_center" />
													</div>
												</div>
											</div>
											<div class="row margin-top-10">
												<div class="col-xs-12">
													<div class="text-right">
														<a class="btn btn-default btn-xs" href="javascript:void(0);" v-on:click="hideCreateInput('license')">취소</a> <a class="btn btn-primary btn-xs margin-left-5" href="javascript:void(0);" v-on:click="createUserInformation('license')" :disabled="licenseInformation.length == 0">저장</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="margin-left-15">
										<span id="license_description_error" class="license_description_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증명을 입력해주세요.</span> <span id="license_licensed_at_error" class="license_licensed_at_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급일을 선택해주세요.</span> <span id="license_licensed_provider_center_error" class="license_licensed_provider_center_error help-block color-danger padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급기관을 입력해주세요.</span>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="modal fade" id="tagCertificationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="user-modal-style" role="document">
							<div class="modal-content border-radius-0">
								<div class="row padding-right-15">
									<div class="col-xs-4 bg-gradient-yellow padding-left-20 padding-top-35 user-modal-height">
										<div class="font-size-20 color-brown NGB">
											인증에 필요한 <br /> 파일을 첨부하세요!
										</div>
										<h5 class="text-style color-brown">
											<div class="margin-top-10 color-brown">
												아워플래너스에서 인정하는 자격 / 기술에 <br /> 대해서만 인증하실 수 있습니다.
											</div>
										</h5>
									</div>
									<div class="col-xs-8 padding-left-20 padding-right-20 padding-top-35">
										<div class="row">
											<div class="col-xs-12 user-modal-scroll">
												<div class="row">
													<div class="col-xs-12">
														<div class="panel border-solid bg-color-fa border-radius-0 margin-top-0">
															<div class="panel-body padding-all-10">
																<ul class="padding-left-0 font-color-lighter margin-all-0">
																	<li class="list-unstyled font-size-h6">• 첨부하신 자료는 공개되지 않으며, 인증마크를 부여하는 용도로만 사용됩니다.</li>
																	<li class="list-unstyled font-size-h6 margin-top-5">• 조작된 서류를 첨부하여 손해가 발생될 경우, 그 책임은 전문가에게 있습니다.</li>
																	<li class="list-unstyled font-size-h6 margin-top-5">• 자료에 기재된 정보는 아워플래너스 가입 정보와 동일해야합니다.</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="row" v-for="metadata in need_certification_selected_metadata" :class="{'margin-top-25': $index != 0}">
													<div class="col-xs-12">
														<h5 class="margin-all-0 NGB">${ metadata.user_metadata.title }</h5>
														<h6 class="margin-top-5">모든 정보를 확인할 수 있도록 또렷하고 선명한 이미지를 첨부해주세요.</h6>
														<div id="fileupload_wrapper_{{ metadata.id }}" v-show="metadata.file_id == null">
															<label class="label-margin-none" for="fileupload_{{ metadata.id }}"> <a class="btn btn-default btn-xss"> <i class="fa fa-paperclip" aria-hidden="true"></i> 파일첨부
															</a>
															</label> <input id="fileupload_{{ metadata.id }}" class="certificationFiles" type="file" name="file" data-url="${pageContext.request.contextPath}/upload" data-id="{{ metadata.id }}" style="display: none;" /> <input id="attached_file_{{ metadata.id }}" type="hidden" />
														</div>
														<div id="fileupload_file_progress_wrapper_{{ metadata.id }}" v-show="metadata.file_id != null" class="panel bg-color-fa border-dashed border-radius-0 margin-bottom-0 margin-top-5" style="display: none">
															<div class="panel-body padding-all-10">
																<div>
																	<h6 id="fileupload_file_name_{{ metadata.id }}" class="margin-top-0" :class="{'margin-bottom-0': metadata.file_id != null}">
																		{{ metadata.file_id.ori_fname }} <span class="pull-right cursor" onclick="hideFileUpload( metadata.id );"><i class="fa fa-close"></i></span>
																	</h6>
																</div>
																<div class="progress margin-bottom-0" style="height: 5px;" v-show="metadata.file_id == null">
																	<div id="fileupload_progress_bar_{{ metadata.id }}" class="progress-bar bg-color-yellow-400" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-top-15">
											<div class="col-xs-12 text-right">
												<button type="button" class="btn btn-default btn-sm margin-right-10" v-on:click="restoreFiles">닫기</button>
												<button type="button" class="btn btn-primary btn-sm" v-on:click="submitCertificationFiles()">보내기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<script>
    function hideFileUpload(id){
        for(var i in user_vue.need_certification_selected_metadata) {
            if(typeof user_vue.need_certification_selected_metadata[i] == 'object') {
                if(user_vue.need_certification_selected_metadata[i].id == id) {
                    user_vue.needToRemoveCertificationFiles.push({
                        id : id,
                        file_id : {
                            FID : user_vue.need_certification_selected_metadata[i].file_id.FID,
                            ori_fname : user_vue.need_certification_selected_metadata[i].file_id.ori_fname
                        }
                    });
                    user_vue.need_certification_selected_metadata[i].file_id = null;
                    break;
                }
            }
            if( i == (user_vue.need_certification_selected_metadata.length)-1) break;
        }
    }
</script>
				</div>
				
				<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

				<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>
				<script src="${pageContext.request.contextPath}/resources/js/op.certification_metadata.file.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script>
    $('.date-input').datepicker({
        format: 'yyyy.mm',
        maxViewMode: 2,
        minViewMode: 'months',
        orientation: "bottom auto",
        endDate: '0m',
        language: "kr",
        autoclose: true,
        todayHighlight: true
    });
</script>
<script src="${pageContext.request.contextPath}/resources/js/op.common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/op.user_profile.js"></script>

<script>
    $(document).ready(function(){

                    var $scrollFix = $("#userScrollFix"),
                $navigationFixed = $('.user-nav-fixed')
                ;
            const defaultHeight = 285 - 30;

            $(window).on('scroll',function(){
                var userScrollTop = $(this).scrollTop();
                if( userScrollTop > defaultHeight ){
                    $scrollFix.removeClass('user-info-nave').addClass('user-nav-fixed').css('top', sassVariables.globalMarginTopOnlyYellowHeader+'px');
                } else {
                    $scrollFix.removeClass('user-nav-fixed').addClass('user-info-nave').css('top',0);
                }
            });

        
        user_vue.profileUSERID = '346478';

                                

        
           
                
                    
                    
                    
                

                
            
        

        


                user_vue.default_date = '2017.03';
        user_vue.licensed_at = user_vue.default_date;
        user_vue.period_start = user_vue.default_date;
        user_vue.type = 'seller';

            });

    function getViewport() {

        var viewPortWidth;
        var viewPortHeight;

        // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
        if (typeof window.innerWidth != 'undefined') {
            viewPortWidth = window.innerWidth,
            viewPortHeight = window.innerHeight
        }

        // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
        else if (typeof document.documentElement != 'undefined'
            && typeof document.documentElement.clientWidth !=
            'undefined' && document.documentElement.clientWidth != 0) {
            viewPortWidth = document.documentElement.clientWidth,
                viewPortHeight = document.documentElement.clientHeight
        }

        // older versions of IE
        else {
            viewPortWidth = document.getElementsByTagName('body')[0].clientWidth,
                viewPortHeight = document.getElementsByTagName('body')[0].clientHeight
        }
        return [viewPortWidth, viewPortHeight];
    }

</script>


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

