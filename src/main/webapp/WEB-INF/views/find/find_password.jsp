<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
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
<title>비밀번호 찾기|OUR PLANNERS</title>
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
<script type="text/javascript">
	function checkForm(f) {

		if (!f.searchId.value) {
			popLayerMsg("아이디를 입력하세요.");
			f.searchId.focus();
			return false;
		}

		if (!checkId(f.searchId.value)) {
			return false;
		}
		return true;
	}

	function checkId(userId) {

		var url = "${pageContext.request.contextPath}/member/json/id_check.json";
		var params = "user_id=" + $('#searchId').val();

		$
				.ajax({
					type : 'post',
					url : url,
					dataType : 'json',
					data : params,
					async : false,
					success : function(data) { //success에 성공했을 때 동작 넣기.

						if (data.result == "Y") {
							//해당 아이디가 있으므로 다음 비밀번호 찾기 다음 페이지로
							//이동해서 이메일주소와 사용자 이름을 입력받아 메일을 전송해준다.
							$('#hasIdYn').val("Y");

						}

						else {
							$('#hasIdYn').val("N");
							$('#searchId').focus();
							//$('#emp_id').text($('#searchId').val());
							$('#notExistIdLayer .emph_info').text(
									$('#searchId').val());
							popModal("#notExistIdLayer");

						}

					},
					error : function() {
						popLayerMsg("AJAX Error 발생");
						$('#hasIdYn').val("N");
					}
				});

		if ($('#hasIdYn').val() == "N")
			return false;
		else
			return true;

	}
	
	function checkForm2(f) {

		if (!f.searchName.value) {
			popLayerMsg("이름 또는 별명을 입력하세요.");
			f.searchName.focus();
			return false;
		}

		if (!checkName(f.searchName.value)) {
			return false;
		}
		return true;
	}

	function checkName() {

		var url = "${pageContext.request.contextPath}/member/json/id_check.json";
		var params = "name=" + $('#searchName').val() + "&email="
				+ $('#searchEmail').val();
//alert(params);
		$.ajax({
			type : 'post',
			url : url,
			dataType : 'json',
			data : params,
			async : false,
			success : function(data) { //success에 성공했을 때 동작 넣기.

				if (data.result == "Y") {
					//해당 아이디가 있으므로 
					//이메일주소와 사용자 이름을 입력받아 메일을 전송해준다.
					$('#hasIdYn').val("Y");

				}

				else {
					$('#hasIdYn').val("N");
					$('#searchName').focus();
					$('#userNotFoundLayer .emph_info').html(
							"이름 또는 별명 : " + $('#searchName').val()
									+ "<br/>이메일 주소 : "
									+ $('#searchEmail').val());
					popModal("#userNotFoundLayer");

				}

			},
			error : function() {
				popLayerMsg("AJAX Error 발생");
				$('#hasIdYn').val("N");
			}
		});

		if ($('#hasIdYn').val() == "N")
			return false;
		else
			return true;

	}
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
					<div id="pMain" class="row">
						<div id="pArticle" class="row text-center">
							<br /> <br />
							<h3 class="text-center">
								<span class="glyphicon glyphicon-lock"></span>비밀번호 찾기
							</h3>

							<%
								String action = ((String) request.getAttribute("action"));

								if (action == null || action.length() == 0 || action.equalsIgnoreCase("checking_id")) {
							%>

							<dl>
								<dt>비밀번호가 기억나지 않아 답답하셨나요?</dt>
								<dd>아이디를 입력하시면, 찾을 수 있는 방법을 알려드려요.</dd>
							</dl>
							<div class="row ">
								<div class=" col-lg-offset-3 col-lg-6 container well well-lg">
									<form method="post" action="${pageContext.request.contextPath}/find/password" onsubmit="return checkForm(this);">
										<input type="hidden" name="action"  id="action" value="checking_email"> 
										
										<input type="hidden" id="hasIdYn" value="N">


										<div class="row">

											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													<span class="hide" id="spanCheckId"></span> 
													<input class="form-control" type="text" id="searchId" name="searchId" value="" placeholder="아이디를 입력해 주세요.">
												</div>
											</div>
											<div class="col-lg-2">

												<p class="desc_add emph_notice" style="display: none;"></p>
												<button type="submit" class="btn btn-info">다음단계</button>
											</div>
										</div>
									</form>
								</div>
							</div>

							<div class="row">
								<div id="findId" class="text-left col-lg-offset-3 col-lg-6 container list-group">

									<div class="list-group-item d-flex justify-content-between align-items-center">
										아이디를 모르시나요?<a href="${pageContext.request.contextPath}/find/id" class="link_tip">아이디 찾기</a><span class="ico_find ico_more"></span>
									</div>

								</div>
							</div>
							<%
								} else if (action.equalsIgnoreCase("checking_email")) {
							%>

										
										
										<dl>
								<dt>${sessionScope.find_id }</dt>
								<dd>이름 또는 별명과 이메일 주소를 입력하시면, 찾을 수 있는 방법을 알려드려요.</dd>
							</dl>
							<div class="row ">
								<div class=" col-lg-offset-3 col-lg-6 container well well-lg">
									<form method="post" action="${pageContext.request.contextPath}/find/password" onsubmit="return checkForm2(this);">
										<input type="hidden" name="action" id="action" value="checking_auth"> <input type="hidden" id="hasIdYn" value="N">

										<div class="row">

											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													<span class="hide" id="spanCheckName"></span> <input class="form-control" type="text" id="searchName" name="searchName" value="" placeholder="이름을 입력해 주세요.">
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													<span class="hide" id="spanCheckEmail"></span> <input class="form-control" type="text" id="searchEmail" name="searchEmail" value="" placeholder="이메일 주소 전체를 입력해 주세요.">
												</div>
											</div>
											<div class="col-lg-2">

												<p class="desc_add emph_notice" style="display: none;"></p>
												<button type="submit" class="btn btn-info">다음단계</button>
											</div>
										</div>
									</form>
								</div>
							</div>

							<%
								} else if (action.equalsIgnoreCase("checking_auth")) {
							%>

							<dl>
								<dt>${sessionScope.email }</dt>
								<dd>
									해당 메일로 인증번호가 발송 되었습니다.<br /> 통신사 사정으로 인증번호 수신에 다소 시간이 걸릴 수 있습니다
								</dd>
							</dl>
							<div class="row ">
								<div class=" col-lg-offset-3 col-lg-6 container well well-lg">
									<form method="post" action="${pageContext.request.contextPath}/find/password" onsubmit="return checkAuthKey(this);">
										<input type="hidden" name="action" id="action" value="change_password">

										<div class="row">

											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													<input type="text" class="form-control " name="auth_key" id="auth_key" data-rule-required="true" placeholder="인증번호 입력(10분 동안 유효)" maxlength="8">
												</div>
											</div>
											<div class="col-lg-2">

												<p class="desc_add emph_notice" style="display: none;"></p>
												<button type="submit" class="checkAuth_btn btn btn-info">다음단계</button>
											</div>
										</div>

										<div class="form-group text-center">
											<span class="text-center"> <a class="" href="javascript:popModal('#layer_resend');" target="_blank"> 인증메일을 받지 못하셨나요? </a>
											</span>
										</div>

									</form>
								</div>
							</div>

							
							<script>
								$(window)
										.load(
												function() {

													sendAuthMail();

													$('.checkAuth_btn')
															.on(
																	'click',
																	function() {
																		//인증번호 확인 요청시 버튼 잠시 비활성화
																		$(this)
																				.prop(
																						"disabled",
																						true);
																		//$('.checkAuth_btn').css({'background-color': 'gray'});
																		if (checkAuthKey(this.form)) {
																			//이메일 인증 완료 되었으니 회원가입 처리요청

																			this.form
																					.submit();
																		}
																		$(
																				'.checkAuth_btn')
																				.prop(
																						"disabled",
																						false);

																		//$('.checkAuth_btn').css({'background-color': 'white'});
																	});
												});

								//JAVA ==> JSTL ==> HTML ==> JAVASCRIPT 실행순서

								function checkAuthKey(f) {

									if (!f.auth_key.value) {
										popLayerMsg("인증 번호를 입력하세요.");

										f.auth_key.focus();
										return false;
									}

									var url = "${pageContext.request.contextPath}/member/json/authkey_check.json";
									var params = "auth_key=" + f.auth_key.value;
									var isMatched = false;
									// alert(url+"?"+params);
									//popLayerMsg(url+"?"+params); 
									popLayerMsg("인증 번호 확인중");
									//동기방식으로 호출 그래야 알맞게 return 됨
									$
											.ajax({
												type : 'post',
												async : false,
												url : url,
												dataType : 'json',
												data : params,

												success : function(data) { //success에 성공했을 때 동작 넣기.

													//인증번호 일치
													if (data.result == "success") {
														//alert("인증 성공");
														//popLayerMsg("인증 되었습니다.");

														isMatched = true;
													}
													//중복된 경우
													else {
														$("[data-dismiss=modal]").trigger({ type: "click" });
														popModal("#layer_unmatched_authkey");

														isMatched = false;
													}

												},
												error : function() {
													$("[data-dismiss=modal]").trigger({ type: "click" });
													popLayerMsg("AJAX Error 발생");

													//alert("ajax error");
												}
											});

									return isMatched;

								}

								function popResendAuthMail() {

									$("#layer_resend").modal();

								}

								function sendAuthMail() {

									$("#layer_resend .close").click();

									//countdown( "countdown", 10, 0 );

									var auth_key = document
											.getElementById("auth_key");
									var url = "${pageContext.request.contextPath}/mail/mail_authkey_send.json";
									var params = "to=${sessionScope.email}";

									//popLayerMsg(url+"?"+params);
									popLayerMsg("인증메일 발송중 입니다.");

									$
											.ajax({
												type : 'post',

												url : url,
												dataType : 'json', //dataType에 데이터 타입 넣기
												//data : params,

												success : function(data) { //success에 성공했을 때 동작 넣기.

													//중복되지 않은 경우
													if (data.result == "success") {

														popLayerMsg("인증 메일이 발송 되었습니다.");

														//$('#layer_resend').modal().hide();

														//alert("발송성공");
														//document.getElementById("Span").innerText = "인증 메일이 발송 되었습니다.";
													}
													//중복된 경우
													else {
														//alert("메일발송실패");

														popLayerMsg("메일 발송 오류");
														//document.getElementById("Span").innerText = "이미 사용중이거나 탈퇴한 아이디입니다."+data.result;
													}

												},
												error : function() {
													popLayerMsg("AJAX Error 발생");
													//alert("ajax error");
												}
											});

								}
							</script>
							
							<%
								} else if (action.equalsIgnoreCase("change_password")) {
							%>

							<dl>
								<dt>비밀번호 재설정</dt>
								<dd>
									<em>${sessionScope.find_id }</em>님, 이제 새로운 비밀번호로 재설정해 주세요.
								</dd>
							</dl>
							<div class="row ">
								<div class=" col-lg-offset-3 col-lg-6 container well well-lg">
									<form method="post" action="${pageContext.request.contextPath}/find/password" onsubmit="return checkChangePasswordForm(this);">
										<input type="hidden" name="action" id="action" value="complete">

										<div class="row">

											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													<input type="text" class="form-control " name="password" id="password" data-rule-required="true" placeholder="새 비밀번호를 입력하세요." maxlength="30">
												</div>
											</div>
											<div class="col-lg-2">

												<p class="desc_add emph_notice" style="display: none;"></p>
												<button type="submit" class="btn btn-info">완료</button>
											</div>
										</div>

										<div class="form-group text-center">
											<strong class="screen_out">보안 주의사항 TIP 리스트</strong> <em class="ico_find ico_tip">TIP</em>

											<div class="info_tip">
												<strong class="screen_out">보안에 취약한 비밀번호는 사용하지 마세요! </strong>
												<ul class="screen_out">
													<li>자주 쓰는 사이트의 비밀번호가 같은 경우</li>
													<li>과거에 사용했던 비밀번호를 다시 사용하는 경우</li>
													<li>아이디와 주민등록번호, 생일, 전화번호 등 유추하기 쉬운 비밀번호</li>
													<li>연속된 숫자, 반복된 문자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호</li>
												</ul>
											</div>
										</div>

									</form>
								</div>
							</div>

							

							<%
								} else if (action.equalsIgnoreCase("complete")) {
							%>
										
							<div class="row ">
								<div class=" col-lg-offset-3 col-lg-6 container well well-lg">
									
										

										<div class="row">

											<div class="col-lg-offset-2 col-lg-6">
												<div class="form-group">
													
													<dl>
								<dt>비밀번호 변경완료</dt>
								<dd>
									<em>${requestScope.find_id }</em>님의 비밀번호 변경이 완료 되었습니다.
								</dd>
							</dl>
							
												</div>
											</div>
											<div class="col-lg-2">

												<p class="desc_add emph_notice" style="display: none;"></p>
												<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}';">메인 홈</button>
											</div>
										</div>


								
								</div>
							</div>

							
							<%
								}
							%>

						</div>
						<!--// pArticle -->



					</div>
				</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		
			<!-- 없는 아이디 레이어 -->
	<div id="notExistIdLayer" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<strong class="modal-title">비밀번호 찾기 안내 레이어</strong>
				</div>
				<div class="modal-body">
					<strong class="tit_layer">입력해주신 <em class="emph_info" id="emp_id"></em> 는 없는 아이디 입니다.<br> 다시 한번 아이디를 정확히 입력해 주세요.
					</strong>


				</div>
				<div class="modal-footer">
					<div class="col-lg-offset-5 col-lg-2 text-center">
						<button type="button" class="col-lg-6 btn btn-default btn-block" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 해당 사용자 찾을수 없는 레이어 -->
	<div id="userNotFoundLayer" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<strong class="modal-title">아이디 찾기 안내 레이어</strong>
				</div>
				<div class="modal-body">
					<strong class="tit_layer"><em class="emph_info"></em> 로 아이디를 찾은 결과, 일치하는 아이디가 없습니다.</strong>
					<p class="desc_info">다시 한번 연락처를 정확히 넣어 주시거나, 다른 찾기 방법으로 진행해 주세요.</p>

				</div>
				<div class="modal-footer">
					<div class="col-lg-offset-5 col-lg-2 text-center">
						<button type="button" class="col-lg-6 btn btn-default btn-block" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 인증번호 불일치 -->
<div class="modal fade" id="layer_unmatched_authkey" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">


						<span class="ico_myinfo ico_mail"></span> <strong class="text-danger"> 입력하신 인증번호가 올바르지 않습니다 </strong>


					</div>
					<div class="modal-body">

						<p>이메일로 발송된 인증번호를 다시 확인해주세요.</p>


					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>


					</div>
				</div>
			</div>
		</div>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
