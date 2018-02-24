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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 변경|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>


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
	<div id="wrapper" class="preloader_hide">

			<!-- HEADER -->
					<%@ include file="../common/top_main2.jsp"%>
			<!-- //HEADER -->

		<!-- 모달창 메시지 -->
			<%@ include file="../common/modal_msg.jsp"%>
		<!--// 모달창 메시지 -->
		
			<!-- HOME -->
			<section id="change_password" class="section padbot0">
				<!-- CONTAINER -->
				<div class="container">
					<!-- 좌우측의 공간 확보 -->

					<div class="col-xs-9 col-md-9">
						
						<h3>비밀번호 변경</h3>
						<small>비밀번호 변경 페이지 입니다. 현재 비밀번호와 바꾸실 비밀번호를 입력하세요.</small>
						
						<c:if test="${not empty error_msg}">
						<div class="alert alert-danger">
							<strong>알림!</strong> ${error_msg}
						</div>
						</c:if>
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

		<!-- Footer section(하단부분) -->
			<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>

