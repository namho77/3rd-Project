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
	$(document).ready(function() {
		var url = "${pageContext.request.contextPath}/customercenter/faq/json/faq_list.json"
		$.ajax({
			url : url,
			dataType : "json",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				param1 : "값1"
			},
			success : function(d) {
				$('#list').html(d);
			},
			error : function(e) {
				alert("실패" + e);
			}
		});
	});
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
			<div id="cMain">
				<div id="mFeature">
					<h2 class="tit_menu">카카오페이지</h2>
					<strong class="screen_out"> 카카오페이지 메뉴 </strong>
					<nav id="kakaoGnb">
						<ul class="list_menu">
							<li class=""><a class="link_menu" href="/helps?category=357&amp;locale=ko&amp;service=10"> 앱 이용 관련 </a></li>
							<li class=""><a class="link_menu" href="/helps?category=358&amp;locale=ko&amp;service=10"> 구매 관련 </a></li>
							<li class=""><a class="link_menu" href="/helps?category=359&amp;locale=ko&amp;service=10"> 콘텐츠 이용 관련 </a></li>
							<li class=""><a class="link_menu" href="/helps?category=360&amp;locale=ko&amp;service=10"> 영상 관련 </a></li>
						</ul>
					</nav>
				</div>

				<script>
					$(document).ready(function() {
						// 도움말 조회수 증가
						function helps_hit(help_id) {
							$.ajax({
								type : 'GET',
								url : '/helps_hit/' + help_id,
								dataType : 'text',
								data : {},
								error : function(response) {
								}
							});
						}

						var targetArticle = $('#'), targetFaqId = '';

						// articleId 파라미터가 있는 경우 해당 게시글로 스크롤 이동
						if (targetArticle.length !== 0) {

							var targetPos = targetArticle.offset().top;

							if ("" == 'y') {
								targetPos = targetArticle.offset().top;
							}

							var $el = $(targetArticle).toggleClass('on');

							if ($el.hasClass('on')) {
								$el.find('.ico_arr.ico_cs').text(gon.messages.requests.close_content);
							} else {
								$el.find('.ico_arr.ico_cs').text(gon.messages.requests.open_content);
							}

							$('html, body').animate({
								scrollTop : targetPos
							}, 500);

							// 도움말 조회수 증가
							helps_hit(targetFaqId);
						}

						// 게시글 열기/닫기 시 조회수증가, 설명 문구 변경
						$('#faq_list > .item_info > .info_tit').on('click', function() {
							var $el = $(this).parent().toggleClass('on');
							var _alink = $(this).find('.link_cont');

							if ($el.hasClass('on')) {
								$el.find('.ico_arr.ico_cs').text(gon.messages.requests.close_content);
								helps_hit($(this).parent().data('id'));
							} else {
								$el.find('.ico_arr.ico_cs').text(gon.messages.requests.open_content);
							}

							history.pushState(null, null, _alink.data('faqUrl'));
						});
					});
				</script>
				<article class="cont_public" id="mArticle">
					<div class="dimmed_layer"></div>
					<div class="basic_layer">
						<div class="inner_basic_layer">
							<div class="wrap_cont">
								<div class="cont_layer cont_police2" id="smsUserDeactivate" style="display: none;">
									<form action="#" method="post" name="layerCs">
										<fieldset>
											<legend class="screen_out"> SMS 인증 후 카카오톡 탈퇴하기 </legend>
											<div class="layer_head">
												<strong class="tit_layer"> SMS 인증 후 카카오톡 탈퇴하기 </strong>
											</div>
											<div class="layer_body">
												<p class="desc_txt">
													카카오톡 사용중인 휴대폰 번호 입력 후 인증번호 발송 버튼을 클릭하시면<br>인증번호가 발송됩니다.(해외제외)
												</p>
												<div class="wrap_sms wrap_phone">
													<label class="lab_sms" for="phone_number"> 휴대폰번호 </label> <input autocomplete="off" class="inp_sms" id="phone_number" name="phone_number" type="text">
													<button class="btn_sms" type="button">인증번호 발송</button>
												</div>
												<p class="desc_caution" id="smsSendMsg" style="display: none;"></p>
												<div class="wrap_sms">
													<label class="lab_sms" for="passcode"> 인증번호 입력 </label> <input autocomplete="off" class="inp_sms" id="passcode" name="pass_code" type="text">
												</div>
											</div>
											<div class="layer_foot">
												<button class="btn_layer" id="smsSend" type="button">인증 및 카카오톡 탈퇴하기</button>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="cont_layer cont_police" id="smsConfirm" style="display: none;">
									<div class="layer_head">
										<strong class="tit_layer"> 카카오계정(<span class="email_insert"></span>) 도용 신고를 접수하시겠습니까?
										</strong>
									</div>
									<div class="layer_body">
										<p class="desc_txt">
											접수 후에는 이력 검토 후<br>
											<span class="txt_emph">카카오계정(<span class="email_insert"></span>) 및 카카오톡 이용이 정지
											</span>될 수 있습니다.
										</p>
									</div>
									<div class="layer_foot">
										<button class="btn_layer" id="accountTheftSubmit" type="button">계정도용신고 접수</button>
										<button class="btn_layer btn_layer2 close" type="button">취소</button>
									</div>
								</div>
								<div class="cont_layer" id="alertLayer" style="display: none;">
									<div class="layer_head">
										<strong class="screen_out"> 문의접수 </strong>
									</div>
									<div class="layer_body">
										<p class="desc_txt">
											정상적으로문의가접수되었습니다.<br>처리결과는기재하신연락처(휴대폰번호/이메일)로회신드리겠습니다.
										</p>
									</div>
									<div class="layer_foot">
										<button class="btn_layer close" type="button">확인</button>
										<a class="btn_close close" href="#none"> <span class="ico_cs"> 닫기 </span>
										</a>
									</div>
								</div>
								<div class="cont_layer" id="notiLayer" style="display: none;">
									<div class="layer_head">
										<strong class="screen_out"> notice </strong>
									</div>
									<div class="layer_body">
										<div>
											<span class="desc_txt" style="font-weight: bolder; font-size: 20px"> 추석연휴 고객센터 휴무 안내 </span> <span class="desc_txt"> <br> <br> 휴무기간 : 9/30(토) ~ 10/9(월)
											</span> <span class="desc_txt" style="font-size: 14px"> <br> <br> 접수된 문의는 10월10일(화)부터 순차적으로 답변드릴 예정입니다. <br> 소중한 분들과 즐겁고 풍성한 한가위 보내시기 바랍니다.
											</span>
										</div>
									</div>
									<div class="layer_foot">
										<button class="btn_layer close" type="button">확인</button>
										<a class="btn_close close" href="#none"> <span class="ico_cs"> 닫기 </span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<h2 class="screen_out" id="kakaoBody">카카오 고객센터 본문</h2>
					<h3 class="tit_public">유용한 도움말</h3>
					<div class="wrap_cont wrap_tip">
						<div class="item_info">
							<span class="num_info"> 1 </span> <a class="link_cont" data-id="1073190269" href="/helps?articleId=1073190269&amp;category=359&amp;device=1092&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 콘텐츠를 바로 감상하는 것과 다운로드 하는 것은 어떤 차이가 있나요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 2 </span> <a class="link_cont" data-id="1073190253" href="/helps?articleId=1073190253&amp;category=358&amp;device=1090&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 캐시란 무엇인가요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 3 </span> <a class="link_cont" data-id="1073190317" href="/helps?articleId=1073190317&amp;category=360&amp;device=1096&amp;locale=ko&amp;service=10"> <strong class="tit_info"> PNP가 뭔가요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 4 </span> <a class="link_cont" data-id="1073190275" href="/helps?articleId=1073190275&amp;category=359&amp;device=1092&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 구매한 콘텐츠는 몇 대의 기기에서 이용할 수 있나요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 5 </span> <a class="link_cont" data-id="1073190318" href="/helps?articleId=1073190318&amp;category=360&amp;device=1096&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 일단 10분이 뭔가요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 6 </span> <a class="link_cont" data-id="1073190256" href="/helps?articleId=1073190256&amp;category=358&amp;device=1090&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 이용권은 무엇인가요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 7 </span> <a class="link_cont" data-id="1073190245" href="/helps?articleId=1073190245&amp;category=357&amp;device=1088&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 카카오 계정은 무엇인가요? </strong>
							</a>
						</div>
						<div class="item_info">
							<span class="num_info"> 8 </span> <a class="link_cont" data-id="1073190260" href="/helps?articleId=1073190260&amp;category=358&amp;device=1090&amp;locale=ko&amp;service=10"> <strong class="tit_info"> 전용 쿠폰이란 무엇인가요? </strong>
							</a>
						</div>

					</div>
				</article>

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
