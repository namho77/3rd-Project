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
%>>
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
			<div id="messageGroup" class="container ">
				<div class="row margin-top-30">
					<div class="col-xs-2">
						<h2>
							<b>메시지</b>
						</h2>
						<h4 class="margin-top-30">
							<a id="GENERAL_messages" href="javascript:void(0)" v-on:click="changemessageGroups('GENERAL')" class="messageLink  message-list-menu-active  plain">전체메시지</a>
						</h4>
						<h4 class="margin-top-10">
							<a id="UNREAD_messages" href="javascript:void(0)" v-on:click="changemessageGroups('UNREAD')" class="messageLink  plain">안읽은메시지</a>
						</h4>
						<h4 class="margin-top-10">
							<a id="STARRED_messages" href="javascript:void(0)" v-on:click="changemessageGroups('STARRED')" class="messageLink  plain">별표메시지</a>
						</h4>
					</div>
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-9">
								<div id="dropdownMenuGroup" class="pull-left" role="group">
									<button id="messageListDropdownBtn" type="button" class="border-radius padding-top-5 padding-bottom-5 padding-left-10 padding-right-10 btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<input id="checkboxMenu" type="checkbox" /> <span class="dropdown-square"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);" v-on:click="selectmessageGroups('ALL')">전체선택</a></li>
										<li><a href="javascript:void(0);" v-on:click="selectmessageGroups('CLEAR')">선택해제</a></li>
										<li><a href="javascript:void(0);" v-on:click="selectmessageGroups('STARRED')">별표 선택</a></li>
										<li><a href="javascript:void(0);" v-on:click="selectmessageGroups('UNSTARRED')">별표 없음 선택</a></li>
									</ul>
								</div>

								<div class="pull-left margin-left-10">
									<a class="btn btn-default btn-xss" href="javascript:void(0);" role="button" v-on:click="exitmessageGroups" :class="{ disabled: selectedmessageGroupID.length == 0 }"> <i class="fa fa-trash-o fa-lg font-color-lighter" aria-hidden="true"></i>
									</a>
								</div>
								<div class="pull-left margin-left-10">
									<div class="input-group width-180px">
										<input id="searchKeywordInput" type="text" class="form-control input-xs padding-right-45" v-model="searchKeyword" placeholder="상대방 닉네임 검색" /> <span> <a class="btn btn-xss btn-default message-list-search-input-group-btn" type="button" v-on:click="searchmessageGroups()" :disabled="searchKeyword == ''"> <i class="fa fa-search fa-lg font-color-lighter" aria-hidden="true"></i>
										</a>
										</span>
									</div>
								</div>
							</div>
							<div class="col-xs-3">
								<div class="width-105 pull-right">
									<div class="pull-left margin-all-0 font-size-h6">
										<span class="inline-block text-left"> 메시지 응답률 </span> <span class="inline-block color-dark-gray pull-right"> 0&nbsp;% </span>
									</div>

									<div class="message-response-background">
										<div class="message-response-bar bg-color-danger" style="width: 0%;"></div>
									</div>

								</div>
							</div>
						</div>
						<div id="messageListDiv" class="panel panel-default hidden" v-show="messageGroups.length > 0">
							<ul id="messageList" class="list-group">
								<li class="list-group-item active-hover padding-all-20" v-for="message in messageGroups" :class="{'bg-color-unread': message.unreadCnt > 0}">
									<div class="row">
										<div class="message-list-checkbox position-relative pull-left padding-left-15 padding-right-15">
											<div class="awesome-checkbox">
												<label> <input id="chkbox_{{ message.id }}" type="checkbox" v-on:click="checkmessageGroup(message.id)" /> <span class="awesome-checkbox-body"></span>
													<div class="awesome-checkbox-text"></div>
												</label>
											</div>
										</div>
										<div class="message-list-starred cursor position-relative pull-left" id="STARRED_{{message.id}}" v-on:click="setmessageGroupUtilities(message, 'STARRED')" data-toggle="tooltip" :title="message.message_group_utilities.length == 0 ? '별표' : '별표 해제'">
											<i class="fa " :class="{'fa-star-o-inactive': message.message_group_utilities.length == 0 || (message.message_group_utilities.length > 0 && message.message_group_utilities[0].status == 0), 'fa-star-active': message.message_group_utilities.length > 0 && (message.message_group_utilities[0].status == 1 || message.message_group_utilities[0].status == null)}" aria-hidden="true"></i>
										</div>
										<div class="message-list-profile position-relative pull-left padding-left-15">
											<a href="https://kmong.com/message/{{message.username}}"> <img class="width-25px border-round border-solid" v-bind:src="message.profilepicture" title="{{message.username}}" onError="this.onerror=null;this.src='/img/tools/main_user_gray.png';" />
											</a>
										</div>
										<div class="message-list-text-wrapper pull-left padding-left-15">
											<a class="plain-color-default" href="https://kmong.com/message/{{message.username}}">
												<div class="col-xs-2 ellipsis padding-left-0 width-95px">{{message.username}}</div>
												<div class="col-xs-10 padding-left-0 ellipsis font-color-base" v-if="message.action != 'REQUEST'" v-html="message.message"></div>
												<div class="col-xs-10 padding-left-0 ellipsis" v-if="message.action == 'REQUEST' && message.isMine">
													<span class="label label-info">결제요청</span>&nbsp;<span v-if="message.action_status != -1">내가 보낸 결제요청 메시지입니다.</span><span v-if="message.action_status == -1">내가 보낸 결제요청을 철회했습니다.</span>
												</div>
												<div class="col-xs-10 padding-left-0 ellipsis" v-if="message.action == 'REQUEST' && !message.isMine">
													<span class="label label-info">결제요청</span>&nbsp;<span v-if="message.action_status != -1">내가 받은 결제요청 메시지입니다.</span><span v-if="message.action_status == -1">내가 받은 결제요청이 철회되었습니다.</span>
												</div>
												<div class="col-xs-10 padding-left-0 ellipsis" v-show="message.action == 'NO_ANSWERED'">
													<span class="label label-purple">상담요청</span>&nbsp;<span class="color-purple">부재중인 상담요청이 있습니다.</span>
												</div>

											</a>
										</div>
										<div class="message-list-time text-right font-color-lighter pull-left padding-left-15 padding-right-15">{{ message.time }}</div>
									</div>
								</li>
							</ul>
						</div>

						<div class="panel bg-color-transparent border-solid border-radius-0" v-show="messageGroups.length == 0 && page > 1" style="display: none">
							<div class="panel-body text-center padding-top-40 padding-bottom-40">



								<div>
									<img class="width-50px" src="/img/seller/nothing.png" title="내역없음">
								</div>
								<h5 class="font-color-light">내역이 없습니다.</h5>
							</div>
						</div>

						<div id="messageGroupsLoadingImg" class="loadingDiv text-center margin-top-150 margin-bottom-15 hidden">
							<img class="margin-bottom-50" src="/img/tools/kmong_loading_f.gif" v-if="page == 1">
							<div v-if="page > 1" class="la-ball-fall color-black">
								<div></div>
								<div></div>
								<div></div>
							</div>
						</div>

						<div id="messageGroupsPageLoading" class="text-center margin-top-30 hidden">
							<div class="la-ball-fall color-black">
								<div></div>
								<div></div>
								<div></div>
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
		<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
