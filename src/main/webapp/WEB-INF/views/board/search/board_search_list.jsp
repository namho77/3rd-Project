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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->



<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<script>
	$(document).ready(function() {

		var url = "${pageContext.request.contextPath}/board/json/top_search_list.json";

		//태그리스트 내용 지우기
		$("#tagsList").empty();

		//var params="";
		//alert(url);

		$.ajax({
			cache : false, // 캐시 사용 없애기
			type : 'post',
			url : url,
			//param : params,
			//contentType: 'application/json; charset=utf-8',
			dataType : 'json',
			//contentType: "application/x-www-form-urlencoded; charset=utf-8",				
			//dataType: "text",	
			success : function(resdata) { //success에 성공했을 때 동작 넣기.

				//data= JSON.parse(resdata)

				var data;

				try {
					data = JSON.parse(JSON.stringify(resdata));
					//var data = JSON.parse( jsonData );								/* JSON 형식의 text 를 객체로 컨버팅 */
				} catch (e) {

					popLayerMsg(resdata + " : JSON 객체 파서 에러");
					popLayerMsg(" 페이지 JSON 객체 파서 에러 errURL : " + document.location + " , sendURL : " + url);

					return;
				}

				//alert(responseData.bbsList[0]);
				//var data = JSON.parse(responseData);

				//$("#bbs_content1").html("");

				//var key = Object.keys(data["bbsList"][0]); // 키 값 가져오기 num, title, content, id, postdate,visitcount, name, commentCnt

				var items = [];

				$.each(resdata.list, function(index, hotKeyWord) { // each로 모든 데이터 가져와서 items 배열에 넣고

					if (index == 10)
						return false; //break; true=>continue

					//배열에 푸쉬후 뿌려줄 영역에 html메소드로 넣기
					//items.push("<a class='title' href='bbs/bbs_detail.jsp?num=" + hotKeyWord.num + "&nowPage=1'>"+hotKeyWord.title+"</a>");
					//<a href='${pageContext.request.contextPath}/board/engineer?category="+hotKeyWord.category_srl+"&subcategory="+hotKeyWord.subcategory_srl+"' title='"+hotKeyWord.searchword+"'><i class='fa fa-tag'></i> "+hotKeyWord.searchword+"</a>
					items.push("<a href='${pageContext.request.contextPath}/board/engineer?category=" + hotKeyWord.category_srl + "&subcategory=" + hotKeyWord.subcategory_srl + "' title='10 Topics'><i class='fa fa-tag'></i> " + hotKeyWord.searchword + "</a>");

				});//each끝

				$('#tagsList').html(items.join(''));
			},
			error : function(e) {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);

			}
		});

		url = "${pageContext.request.contextPath}/board/json/service_list.json";
		var serviceMainImgPath = "${pageContext.request.contextPath}/resources/upload/service/";
		//내용 지우기
		$("#search_list_div").empty();
		var params = "board_type=${board_type}&pageSize=5&blockPage=1&keyword=${keyword}&searchType=tc";
		//alert(params);
		$.ajax({
			cache : false, // 캐시 사용 없애기
			type : 'post',
			url : url,
			data : params,
			//data : JSON.stringify({ board_type: 'E', pageSize: '3', blockPage: '1'}),
			//contentType: 'application/json; charset=utf-8',
			dataType : 'json',
			//contentType: "application/x-www-form-urlencoded; charset=utf-8",				
			//dataType: "text",	
			success : function(data) {
				//alert(JSON.stringify(data));
				var items = [];
				var inHTML = "";
				$.each(data.searchList, function(index, boardVO) { // each로 모든 데이터 가져와서 items 배열에 넣고

					//if(index==5)
					//return false; //break; true=>continue

					//배열에 푸쉬후 뿌려줄 영역에 html메소드로 넣기

					if (index == 0) {
						inHTML += "<div class=\"item active\">";
					} else {
						inHTML += "<div class=\"item\">";
					}
					inHTML += "<div class=\"col-md-4\">";
					inHTML += "<div class=\"card card-blog\">";
					inHTML += "<div class=\"card-image\">";
					inHTML += "<a href=\"#pablo\"> <img class=\"img img-raised\" src=\""+serviceMainImgPath+boardVO.board_srl+"/images/"+boardVO.main_image+"\">";
					inHTML += "</a>";
					inHTML += "<div class=\"colored-shadow\" style=\"background-image: url('" + serviceMainImgPath + boardVO.board_srl + "/images/" + boardVO.main_image + "'); opacity: 1;\"></div>";
					inHTML += "<div class=\"ripple-container\"></div>";
					inHTML += "</div>";
					inHTML += "<div class=\"card-content\">";
					inHTML += "<h6 class=\"category text-info\">" + boardVO.subcategory_srl + "</h6>";
					inHTML += "<h4 class=\"card-title\">";
					inHTML += "<a href=\"${pageContext.request.contextPath}/board/engineer/"+boardVO.board_srl+"\">" + boardVO.title + "</a>";
					inHTML += "</h4>";
					inHTML += "<p class=\"card-description\">";
					inHTML += boardVO.contents + "<a href=\"${pageContext.request.contextPath}/board/engineer/"+boardVO.board_srl+"\"> 자세히 보기 </a>";
					inHTML += "</p>";
					inHTML += "</div>";
					inHTML += "</div>";
					inHTML += "</div>";
					inHTML += "</div>";

					//inHTML+="<span><a href='./board/engineer/"+boardVO.board_srl+"?category="+hotKeyWord.category_srl+"&subcategory="+hotKeyWord.subcategory_srl+"'>"+hotKeyWord.searchword+"</a></span>");						

				});//each끝
				if (jQuery.isEmptyObject(data.searchList)) {
					$('#search_list_div').html("<div class=\"row\">해당 하는 검색 결과가 없습니다.</div>");
				} else {
					$('#search_list_div').html(inHTML);
				}

				//alert(inHTML);
				//$('#hot_engineer_div').html(items);

			},

			error : function(e) {
				popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
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

				<!-- header section -->
			<%@ include file="../../common/commonTop_1.jsp"%>
		<!--// header section -->
		<!-- header section -->
			<%@ include file="../../common/commonTop_2.jsp"%>
		<!--// header section -->

		<!-- Search List Area -->

		<!-- CONTAINER -->
		<section class="section-3 section-dark mt0">
			<div class="container">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<h2 class="section-title st2 mb25">해당 검색어에 일치하는 카테고리나 서브카테고리 목록 입니다.</h2>
						<div class="text-center">
							<p class="mb0">목록들~ 뿌려주기!!~</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="section-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 col-md-9 col-md-push-3 col-sm-push-5 space-left push-off">
						<div id="portfolio-isotope">
							<div class="portfolio-container">
								<div id="search_list_div" class="row mt10">
									<div class="col-sm-6 col-md-3">
										<div class="blog-item">
											<div class="blog-image">
												<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
											</div>
											<div class="blog-caption">
												<h3 class="post-title">About Magento</h3>
												<div class="sub-post-title">
													<span>12 June, 2014</span> <span><i class="fa fa-user"></i> <a href="#"> by John Doe</a></span>
												</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis, ipsum, optio.</p>
												<a href="blog_single_left.html" class="read-more">Read more</a>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<ul class="pagination">
							<li class="disabled"><a href="#"><i class="fa fa-chevron-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
						</ul>
					</div>
					<div class="col-sm-5 col-md-3 col-md-pull-9 col-sm-pull-7 pull-off">
						<aside class="sidebar">
							<div class="sidebar-widget">
								<form action="#" role="form">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search"> <span class="input-group-btn">
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</form>
							</div>

							<div class="sidebar-widget">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab">최근 게시글</a></li>
									<li><a href="#tab2" data-toggle="tab">인기 게시글</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab1">
										<ul class="latest-posts">
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About Wordpress</a>
													</h5>
													<span>25 June, 2014 </span>
												</div>
											</li>
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About Joomla</a>
													</h5>
													<span>27 June, 2014 </span>
												</div>
											</li>
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About Drupal</a>
													</h5>
													<span>1 July, 2014 </span>
												</div>
											</li>
										</ul>
									</div>
									<div class="tab-pane fade" id="tab2">
										<ul class="latest-posts">
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About HTML5</a>
													</h5>
													<span>10 July, 2014 </span>
												</div>
											</li>
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About CSS3</a>
													</h5>
													<span>12 July, 2014 </span>
												</div>
											</li>
											<li>
												<div class="image-post">
													<img src="${pageContext.request.contextPath}/resources/upload/service/1/images/mainimage.jpg" alt="blog post">
												</div>
												<div class="info-post">
													<h5>
														<a href="blog_single_left.html">About Javascript</a>
													</h5>
													<span>15 July, 2014 </span>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 카테고리별 서브카테고리 부분 -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title mb30">서브 카테고리</h3>
								<ul class="categories">
									<li><a href="#"><span>40</span> Web Design</a></li>
									<li><a href="#"><span>12</span> Software Engineering</a></li>
									<li><a href="#"><span>22</span> Web Graphic</a></li>
									<li><a href="#"><span>08</span> Web Programming</a></li>
									<li><a href="#"><span>28</span> Software Design</a></li>
								</ul>
							</div>
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Tags</h3>
								<div id="tagsList" class="tags">
									<a href="#" title="10 Topics"><i class="fa fa-tag"></i> Wordpress</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Concrete5</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Drupal</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Joomla</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> PHP</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> HTML5</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> CSS3</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> jQuery</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Java</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Ruby</a> <a href="#" title="10 Topics"><i class="fa fa-tag"></i> Javascript</a>
								</div>
							</div>

						</aside>
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
		<!-- Bottom영역 -->
		<div class="row">
			<%@ include file="../../common/commonBottom.jsp"%>
		</div>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
