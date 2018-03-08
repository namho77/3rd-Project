<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		getListFAQ(1, 1, 1);
	});

	$(document).ready(function() {

		$("#writeFAQBtn").on("click", function() {
			getWriteFormFAQ();
		});

		//글쓰기 폼 가져오기
		function getWriteFormFAQ() {
			$("#faqHead").text("FAQ 글쓰기");

			$.ajax({
				url : "${pageContext.request.contextPath}/customercenter/faq/new",
				type : "get",
				dataType : "html",
				contentType : "text/html; charset=UTF-8",
				success : function(d) {
					//alert(d);
					$("#faqBody").empty();
					$("#faqBody").html(d);
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
				}
			});

		}

	});

	function faqPaging(nowPage, service_srl, category_srl) {
		getListFAQ(nowPage, service_srl, category_srl);
	}

	//리스트 가져오기
	function getListFAQ(nowPage, service_srl, category_srl) {
		nowPage = typeof nowPage !== 'undefined' ? nowPage : 1;

		service_srl = typeof service_srl !== 'undefined' ? service_srl : 1;

		var url = "${pageContext.request.contextPath}/customercenter/faq/json/faq_list.json";
		var inHTML = "";

		inHTML += "<div class=\"panel-group panel-accordion dark-accordion\">";
		inHTML += "		<div class=\"row\" >";

		var inHTMLPaging = "";
		$("#faqBody").empty();
		var params = "category_srl=" + category_srl + "&service_srl=" + service_srl + "&nowPage=" + nowPage;
		$.ajax({
			url : url,
			dataType : "json",
			type : "get",
			data : params,
			contentType : "text/html; charset=utf-8",
			success : function(data) {
				$.each(data.faqLists, function(index, faqList) { // each로 모든 데이터 가져와서 items 배열에 넣고

					inHTML += "<div id=\"faqDiv_" + faqList.faq_srl + "\" class=\"mix category-1 col-lg-12 panel panel-default\" data-value=\"" + (index + 1) + "\" style=\"display: inline-block;\">";
					inHTML += "	<div class=\"panel-heading\">";
					inHTML += "		<h4 class=\"panel-title\">";
					inHTML += "			<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#faqBody\" href=\"#question" + (index + 1) + "\"> <strong class=\"c-gray-light\">" + (index + 1) + "</strong> " + faqList.title;
					inHTML += "			</a>";
					inHTML += "		</h4>";

					inHTML += "	</div>";
					inHTML += "	<div id=\"question" + (index + 1) + "\" class=\"panel-collapse collapse\" style=\"height: 0px;\">";
					inHTML += "		<div class=\"panel-body\">";
					inHTML += "			<p>" + faqList.contents + "</p>";
					inHTML += "		</div>";
					inHTML += "	</div>";

					<c:choose>
					<c:when	test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
					inHTML += "<div>";
					inHTML += "<button type=\"button\" class=\"btn btn-warning\" onclick=\"javascript:modifyFAQ('" + faqList.faq_srl + "');\" >수정</button>";
					inHTML += "<button type=\"button\" class=\"btn btn-danger\" onclick=\"javascript:deleteFAQ('" + faqList.faq_srl + "');\" >삭제</button>";
					inHTML += "</div>";
					</c:when>
					</c:choose>

					inHTML += "</div>";

				});//each끝
				inHTML += "<div class=\"row text-center\">";
				inHTML += "<ul class=\"pagination\" id=\"faqPagingDiv\">";
				inHTML += "</ul> </div>";
				inHTML += "		</div>";
				inHTML += "		</div>";
				$("#faqBody").html(inHTML);
				$("#faqPagingDiv").html(data.pagingDiv);
			},
			error : function(e) {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
			}
		});
	}

	function deleteFAQ(faq_srl) {

		if (confirm("정말로 삭제 하시겠습니까?")) {
			var url = "${pageContext.request.contextPath}/customercenter/faq/" + faq_srl;
			//alert(url);
			$.ajax({
				url : url,
				type : 'delete',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				/* data : JSON.stringify({
					replytext : replytext
				}), */
				dataType : "json",
				contentType : "text/html; charset:utf-8",
				success : function(d) {
					if (d.result == "fail") {
						popLayerMsg("게시물 삭제에 실패하였습니다.");
					} else if (d.result == "success") {
						popLayerMsg("게시물 삭제에 성공하였습니다.");
						$("#faqDiv_" + faq_srl).hide(1000);
						//$(this).parent().hide();
					}
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
				}
			});
		}
	}

	//수정폼 가져오기
	function modifyFAQ(faq_srl) {
		$("#faqHead").text("FAQ 글수정");
		var url = "${pageContext.request.contextPath}/customercenter/faq/" + faq_srl + "/edit";

		$.ajax({

			url : url,
			type : "get",
			dataType : "html",
			contentType : "text/html; charset=UTF-8",
			success : function(d) {
				//alert(d);
				$("#faqBody").empty();
				$("#faqBody").html(d);

			},
			error : function(e) {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
			}
		});
	}
</script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
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
							<h3>플래너스 계정</h3>
						</div>
						<aside class="sidebar-2">
							<nav class="navigation-sidebar">
								<ul>

									<li class=""><a href="javascript:getListFAQ(1,1,'');"><i class="fa "></i>가입/인증/탈퇴</a></li>
									<li><a href="javascript:getListFAQ(1,1,2);"><i class="fa "></i> 서비스문의/구매</a></li>
									<li><a href="javascript:getListFAQ(1,1,3);"><i class="fa "></i> 평가/구매확정</a></li>
									<li><a href="javascript:getListFAQ(1,1,4);"><i class="fa "></i> 서비스등록/승인/수정</a></li>
									<li><a href="javascript:getListFAQ(1,1,5);"><i class="fa "></i> 광고상품</a></li>
									<li><a href="javascript:getListFAQ(1,1,6);"><i class="fa "></i> 직거래/신고/페널티</a></li>
									<li><a href="javascript:getListFAQ(1,1,7);"><i class="fa "></i> 사이트소개</a></li>
									<li><a href="javascript:getListFAQ(1,1,8);"><i class="fa "></i> 로그인/계정정보</a></li>
									<li><a href="javascript:getListFAQ(1,1,9);"><i class="fa "></i> 결제/세금계산서</a></li>
									<li><a href="javascript:getListFAQ(1,1,10);"><i class="fa "></i> 수정/취소/환불</a></li>
									<li><a href="javascript:getListFAQ(1,1,11);"><i class="fa "></i> 판매/수익금</a></li>



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
									<c:choose>

										<c:when test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
											<button type="button" class="pull-right btn btn-success" id="writeFAQBtn">글쓰기</button>

										</c:when>

										<c:otherwise>

										</c:otherwise>
									</c:choose>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-default">
											<div class="panel-heading" id="faqHead">유용한 도움말</div>
											<div class="panel-body" id="faqBody">

												<div class="panel-group panel-accordion dark-accordion">

													<div class="row">
														<div class="mix category-1 col-lg-12 panel panel-default" data-value="1" style="display: inline-block;">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a class="collapsed" data-toggle="collapse" data-parent="#faqBody" href="#question1"> <strong class="c-gray-light">1.</strong> Our Company Mission
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
																	<a class="collapsed" data-toggle="collapse" data-parent="#faqBody" href="#question2"> <strong class="c-gray-light">2.</strong> Our Philosophy
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
