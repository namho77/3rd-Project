<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입|OUR PLANNERS</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<!-- JS FILES(자바스크립트 연결부분) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/retina.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>	

<script type="text/javascript">
	function logoutGo() {
		var ans = confirm("정말로 로그아웃 하시겠습니까?");
		if (ans == true) {
			location.href = "logout.jsp";
		} else {
			popLayerMsg("로그아웃을 취소하셨습니다.");
		}
	}

	function loginFrmCheck() {
		var f = document.loginFrm;
		if (f.user_id.value == "") {
			popLayerMsg("아이디를 입력하세요");
			f.user_id.focus();
			return false;
		}
		if (f.user_pw.value == "") {
			popLayerMsg("패스워드를 입력하세요");
			f.user_pw.focus();
			return false;
		}

	}
</script>
	
</head>

<body>

<div id="page" class="single_page">

			<!-- HEADER -->
			<header>
				<section class="banner" role="banner">
		<!-- header navigation(탑1 부분) -->
			<%@ include file="../common/top.jsp"%>
		<!-- header navigation(탑1 부분) -->
		<!-- banner text -->
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<div class="banner-text text-center">
					<h1>Our Planners</h1>
					<p>기획을 중점으로 요청자와 기술자들을 연결시켜 기획의 결실을 맺는 교류시스템</p>
					<nav role="navigation">
						<a href="#services" class="banner-btn"><img
							src="${pageContext.request.contextPath}/resources/images/down-arrow.png" alt=""></a>
					</nav>
				</div>
				<!-- banner text -->
			</div>
		</div>
	</section>

			</header>
			<!-- //HEADER -->

			<!-- HOME -->
			<section id="login" class="padbot0">

				<!-- CONTAINER -->
				<div class="container">
					<br /> <br />
					

					
					<%
						//로그인 전이라면 로그인 폼이 노출되어야 한다.
						if (session.getAttribute("USER_ID") == null) {
					%>
					<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title"><%=request.getAttribute("ERROR_MSG") == null ? "환영합니다!" : request.getAttribute("ERROR_MSG")%>
					
                </div>
            </div>
            <%
            if(request.getAttribute("ERROR_MSG")==null)
            {
            	//$("p").css({"background-color": "yellow", "font-size": "200%"});
            }
            %>
            <div class="panel-body">
					<form class="form-signin" action="login_proc.jsp" method="post" name="loginFrm" onsubmit="return loginFrmCheck();">
						<!-- <h2 class="form-signin-heading">로그인</h2> -->

						<label>아이디</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input type="text" class="form-control" name="user_id" placeholder="아이디">
						</div>
						<label>비밀번호</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> <input type="password" class="form-control" name="user_pw" placeholder="비밀번호">
						</div>
						

						<div class="info_account">
							<div class="sign_up_account ">
								<a href="../join/join" id="signUp">회원가입</a><span class="txt_bar">|</span>
								<span class="account_more"> <a href="../find/find_id.do" class="link_more">아이디 찾기</a> <span class="txt_bar">|</span> <a href="../find/find_password.do" class="link_more" >비밀번호 찾기</a>
								</span> <span class="ico_login ico_top"></span>
								
							</div>
						</div>
						
						
							<button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
					</form>
					</div>
					</div>
					</div>
					
					<%
						} else {
							request.getRequestDispatcher("../index.jsp").forward(request, response);
					%>

					<%-- <table border="1" style="width: 300px">
						<tr>
							<td>아이디</td>
							<td><%=session.getAttribute("USER_ID")%></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><%=session.getAttribute("USER_PWD")%></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="로그아웃" onclick="logoutGo();" />
							</td>
						</tr>
					</table> --%>
					<%
						}
					%>
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
		<br/><br/>
		<br/><br/>
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
			    $modals.each( function(i) {
			        var $clone = $(this).clone().css('display', 'block').appendTo('body');
			        var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
			        top = top > 0 ? top : 0;
			        $clone.remove();
			        $(this).find('.modal-content').css("margin-top", top);
			    });
			}
			
		function popLayerMsg(msg){
			$("#layer_msg_content").empty();
			$("#layer_msg_content").append("<p>"+msg+"</p>");
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

</body>
</html>
