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
<title>로그인|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- JS FILES(자바스크립트 연결부분) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>


<script type="text/javascript">
	function logout() {
		var ans = confirm("정말로 로그아웃 하시겠습니까?");
		if (ans == true) {
			location.href = "/member/logout";
		} else {
			popLayerMsg("로그아웃을 취소하셨습니다.");
		}
	}

	function checkPassword(f) {
		if (f.password.value == "") {
			alert("현재 비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		if (f.newPassword.value == "") {
			alert("새 비밀번호를 입력하세요");
			f.newPassword.focus();
			return false;
		}
		if (f.newPassword_confirm.value == "") {
			alert("새 비밀번호 확인을 입력하세요");
			f.newPassword_confirm.focus();
			return false;
		}

		if (f.newPassword.value != f.newPassword_confirm.value) {
			alert("새 비밀번호 확인이 일치하지 않습니다.");
			f.newPassword.focus();
			return false;
		}

	}
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<div id="page" class="single_page">

			<!-- HEADER -->
			<header>
				<section class="banner" role="banner">
					<!-- header navigation(탑1 부분) -->
					<%@ include file="../common/top_main.jsp"%>
					<!-- header navigation(탑1 부분) -->
				</section>
			</header>
			<!-- //HEADER -->






			<!-- HOME -->
			<section id="change_password" class="padbot0">
				<!-- CONTAINER -->
				<div class="container">
					<!-- 좌우측의 공간 확보 -->

					<div class="col-xs-9 col-md-9">

						<h3>비밀번호 변경</h3>
						<small>비밀번호 변경 페이지 입니다. 현재 비밀번호와 바꾸실 비밀번호를 입력하세요.</small>
						<form name="changePasswordFrm" method="post" action="<c:url value="../member/change_password"/>" onsubmit="return checkPassword(this);">

							<table class="table table-bordered">
								<colgroup>
									<col width="20%" />
									<col width="*" />
								</colgroup>
								<tbody>

									<tr>
										<th class="text-center" style="vertical-align: middle;">현재 비밀번호</th>
										<td>
											<input type="password" name="password" class="form-control" style="width: 200px;" />
										</td>

									</tr>

									<tr>
										<th class="text-center" style="vertical-align: middle;">새 비밀번호</th>
										<td>
											<input type="password" name="newPassword" class="form-control" style="width: 200px;" />
										</td>

									</tr>

									<tr>
										<th class="text-center" style="vertical-align: middle;">새 비밀번호 확인</th>
										<td>
											<input type="password" name="newPassword_confirm" class="form-control" style="width: 200px;" />
										</td>

									</tr>
								</tbody>
							</table>


							<div class="row text-center" style="">
								<button type="submit" class="btn btn-danger">비밀번호 변경</button>
								<button type="button" class="btn btn-warning" onclick="history.back();">취소하기</button>
							</div>


						</form>


					</div>
				</div>
				<!-- //CONTAINER -->
			</section>
			<!-- //HOME -->



		</div>
		<!-- //PAGE -->


		<!-- 모달창 -->

		<section id="blank">


			<div class="modal fade " id="layer_msg" tabindex="-1" role="dialog" aria-labelledby="layer_msg_title" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="layer_msg_title">알림</h4>
						</div>
						<div class="modal-body" id="layer_msg_content">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<br /> <br /> <br /> <br />
		</section>


		<script>
			//레이어 팝업창 (alert 왠만하면 쓰지말자.. 사용자가 짜증나니깐)
			var modalVerticalCenterClass = ".modal";

			function centerModals($element) {
				var $modals;
				if ($element.length) {
					$modals = $element;
				} else {
					$modals = $(modalVerticalCenterClass + ':visible');
				}
				$modals.each(function(i) {
					var $clone = $(this).clone().css('display', 'block')
							.appendTo('body');
					var top = Math.round(($clone.height() - $clone.find(
							'.modal-content').height()) / 2);
					top = top > 0 ? top : 0;
					$clone.remove();
					$(this).find('.modal-content').css("margin-top", top);
				});
			}

			function popLayerMsg(msg) {
				$("#layer_msg_content").empty();
				$("#layer_msg_content").append("<p>" + msg + "</p>");
				$("#layer_msg").modal();

			}

			$(modalVerticalCenterClass).on('show.bs.modal', function(e) {
				centerModals($(this));
			});
			$(window).on('resize', centerModals);
		</script>

		<!-- //모달창 끝 -->

		<!-- CONTACTS -->
		<section id="contacts"></section>
		<!-- //CONTACTS -->


		<!-- Footer section(하단부분) -->
		<footer class="footer">
			<%@ include file="../common/bottom.jsp"%>
		</footer>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>

