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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
	});
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- header1(네비게이션 탑1) -->
		<%@ include file="../../common/commonTop_1.jsp"%>
		<!-- header1(네비게이션 탑1) -->
		<!-- header2(네비게이션 탑2) -->
			<%@ include file="../../common/commonTop_2_mypage.jsp"%>
		<!-- header2(네비게이션 탑2) -->

		<!-- HOME -->
		<section id="main" class="section" style="margin-top: 120px;">

			<!-- CONTAINER -->
			<div class="container ">
				<!-- BEGIN WRAPPER -->

				<div class="page-title">
					<i class="icon-custom-left"></i>
					<h3>
						<strong>새</strong> 메일 보내기
					</h3>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<div class="border-bottom">
											<div class="pull-left">
												<a href="#" class=" btn btn-default"><i class="fa fa-arrow-left fa-fw"></i>뒤로가기</a>
											</div>
											<div class="pull-left p-l-20" style="padding-left: 20px">
												<a href="#" class=" btn btn-success"><i class="fa fa-floppy-o fa-fw"></i> 임시저장</a>
											</div>
											<div class="clearfix m-b-20"></div>
										</div>
										<form class="form-horizontal p-t-20" role="form">
											<div class="form-group">
												<label for="to" class="col-sm-2 control-label">받는이:</label>
												<div class="col-sm-10">
													<div class="input-group">
														<input type="text" class="form-control" id="to" /> <span class="input-group-addon bg-white cursor-pointer" data-toggle="collapse" data-target="#cc"> CC/BCC <span class="caret"></span>
														</span>
													</div>
												</div>
											</div>
											<div id="cc" class="collapse">
												<div class="form-group">
													<label for="Cc" class="col-sm-2 control-label">참조:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="Cc" />
													</div>
												</div>
												<div class="form-group">
													<label for="Bcc" class="col-sm-2 control-label">숨은참조:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="Bcc">
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="Bcc" class="col-sm-2 control-label">보내는이:</label>
												<div class="col-sm-6">
													<div class="btn-group">
														<button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>help@ourplanners.com</strong></span> <span class="float-right"><i class="fa fa-angle-down"></i></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">help@ourplanners.com</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="Bcc" class="col-sm-2 control-label">서명:</label>
												<div class="col-sm-6">
													<div class="btn-group">
														<button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
															<i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>Signature</strong></span> <span class="float-right"><i class="fa fa-angle-down"></i></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">Signature</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="clearfix"></div>
										</form>
										<textarea name="content" id="summernote"></textarea>
										<div class="text-center footer-message">
											<a href="#" class="btn btn-default"><i class="fa fa-times-circle"></i> 취소</a> <a href="#" class="btn btn-primary"><i class="fa fa-share fa-fw"></i> 보내기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- END MAIN CONTENT -->


				</div>
			</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		
		<!-- Footer (하단부분) -->
		<%@ include file="../../common/commonBottom.jsp"%>
		<!--// Footer (하단부분) -->
	</div>
</body>
</html>
