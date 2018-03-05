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
		var inHTML = "";
		$("#faq").empty();
		
		$.ajax({
			url : url,
			dataType : "json",
			type : "get",
			contentType : "text/html; charset=utf-8",
			success : function(data) {
				$.each(data.faqLists, function(index, faqList) { // each로 모든 데이터 가져와서 items 배열에 넣고
					
					inHTML += "<div class=\"mix category-1 col-lg-12 panel panel-default\" data-value=\""+(index+1)+"\" style=\"display: inline-block;\">";
					inHTML += "	<div class=\"panel-heading\">";
					inHTML += "		<h4 class=\"panel-title\">";
					inHTML += "			<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#faq\" href=\"#question"+(index+1)+"\"> <strong class=\"c-gray-light\">"+(index+1)+".</strong> "+faqList.title;
					inHTML += "			</a>";
					inHTML += "		</h4>";
					inHTML += "	</div>";
					inHTML += "	<div id=\"question"+(index+1)+"\" class=\"panel-collapse collapse\" style=\"height: 0px;\">";
					inHTML += "		<div class=\"panel-body\">";
					inHTML += "			<p>"+faqList.contents+"</p>";
					inHTML += "		</div>";
					inHTML += "	</div>";
					inHTML += "</div>";
											
				});//each끝
				$("#faq").html(inHTML);
			
				$("#faqPagingDiv").html(data.pagingDiv);
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


		<!-- CONTAINER -->
		<section class="section-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-md-3">
					<div class="page-title">
									<i class="icon-custom-left"></i>
									<h3>
										플래너스 계정
									</h3>
								</div>
						<aside class="sidebar-2">
							<nav class="navigation-sidebar">
								<ul>
									
									<li class="active"><a href="#"><i class="fa "></i> 로그인</a></li>
									<li><a href="#"><i class="fa "></i> 이메일/비밀번호 찾기</a></li>
									<li><a href="#"><i class="fa "></i> 가입</a></li>
									<li><a href="#"><i class="fa "></i> 탈퇴</a></li>
								</ul>
							</nav>
						</aside>
					</div>
					<div class="col-sm-7 col-md-9 space-left">
						<div class="row">
							<div class="col-sm-12">

								<div class="page-title">
									<i class="icon-custom-left"></i>
									<h2>
										FAQ <small>자주 묻는 질문</small>
									</h2>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												유용한 도움말
											</div>
											<div class="panel-body">
												
													<div class="panel-group panel-accordion dark-accordion">
														
															<div class="row" id="faq">
																<div class="mix category-1 col-lg-12 panel panel-default" data-value="1" style="display: inline-block;">
																	<div class="panel-heading">
																		<h4 class="panel-title">
																			<a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question1"> <strong class="c-gray-light">1.</strong> Our Company Mission
																			</a>
																		</h4>
																	</div>
																	<div id="question1" class="panel-collapse collapse" style="height: 0px;">
																		<div class="panel-body">
																			<p>The world is changing all around us. To continue to thrive as a business over the next ten years and beyond, we must look ahead, understand the trends and forces that will shape our business in the future and move swiftly to prepare for what's to come. We must get ready for tomorrow today. That's what our 2020 Vision is all about. It creates a long-term destination for our business and provides us with a "Roadmap" for winning together with our bottling partners.</p>
																			<ol>
																				<li>To inspire moments of optimism and happiness...</li>
																				<li>To create value and make a difference.</li>
																				<li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
																				<li>In eget dolor nec tortor tempor blandit.</li>
																			</ol>
																		</div>
																	</div>
																</div>
																<div class="mix category-1 col-lg-12 panel panel-default" data-value="2" style="display: inline-block;">
																	<div class="panel-heading">
																		<h4 class="panel-title">
																			<a class="collapsed" data-toggle="collapse" data-parent="#faq" href="#question2"> <strong class="c-gray-light">2.</strong> Our Philosophy
																			</a>
																		</h4>
																	</div>
																	<div id="question2" class="panel-collapse collapse">
																		<div class="panel-body">
																			<p>The world is changing all around us. To continue to thrive as a business over the next ten years and beyond, we must look ahead, understand the trends and forces that will shape our business in the future and move swiftly to prepare for what's to come. We must get ready for tomorrow today. That's what our 2020 Vision is all about. It creates a long-term destination for our business and provides us with a "Roadmap" for winning together with our bottling partners.</p>
																			<ol>
																				<li>To inspire moments of optimism and happiness...</li>
																				<li>To create value and make a difference.</li>
																				<li>Pellentesque rhoncus arcu sed nisl vulputate ultrices.</li>
																				<li>In eget dolor nec tortor tempor blandit.</li>
																			</ol>
																		</div>
																	</div>
																</div>
																
															</div>
															<div class="row" id="faqPagingDiv"></div>
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
		</section>

		<!-- //CONTAINER -->

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
