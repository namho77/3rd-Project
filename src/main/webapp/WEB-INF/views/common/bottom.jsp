<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		var url = "${pageContext.request.contextPath}/notice/smallABoard"
		$.ajax({
			url : url,
			dataType : "html",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				param1 : "값1"
			},
			success : function(d) {
				$('#smallABoard').html(d);
			},
			error : function(e) {
				alert("실패" + e);
			}
		});
	});
</script>
<script src="${pageContext.request.contextPath}/resources/js/script.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<footer class="footer-wrapper">


	<div class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<a href="${pageContext.request.contextPath}/notice/aBoard" style="font-size: 15px;">공지사항</a>
					<p id="smallABoard">2018년 3월14일에 발표합니다. 준비하세요!</p>
				</div>
				<div class="col-sm-4">
					<ul class="social-icon dark-2 rounded pull-right">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-tumblr"></i></a></li>
						<li><a href="#"><i class="fa fa-rss"></i></a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<hr class="footer-hr">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="row">
						<div class="col-sm-12 col-md-11">
							<div class="footer-widget">
								<h3 class="widget-title">회사정보</h3>
								<address class="contact-info">
									<p class="mb25">
										<a href="#">회사명 : OurPlanners</a> <br> <a href="#">대표 : 기술자</a> <br> <a href="#">주소 : 서울시 금천구 가산동 426-5 월드메르디앙 2차 1410호</a> <br> <a href="#">사업자등록번호 : 123-12-1234567</a> <br> <a href="#">통신판매업신고 : 2018-서울금천-01234호 </a> <br> <a href="#">전화번호 : 1544-6524 </a> <br> <a href="#">이메일 : OurPlanners@gmail.com</a>
									</p>
								</address>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-6">
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-widget">
								<h3 class="widget-title">Latest posts</h3>
								<ul class="footer-posts">
									<li><a href="blog_post_sidebar.html"><i class="fa fa-wordpress"></i> About Wordpress themes</a></li>
									<li><a href="blog_post_sidebar.html"><i class="fa fa-joomla"></i> Why choose Joomla</a></li>
									<li><a href="blog_post_sidebar.html"><i class="fa fa-drupal"></i> Drupal is better</a></li>
									<li><a href="blog_post_sidebar.html"><i class="fa fa-camera"></i> Magento vs. OpenCart</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-widget">
								<h3 class="widget-title">Flickr photos</h3>
								<ul id="flickr-footer" class="flickr-feed footer-projects">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sub-footer white-sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<p>
							<a href="#">Copyright &copy; 2018 OurPlanners Inc. All Rights Reserved.</a> <i class="fa fa-heart pulse"></i>
						</p>
					</div>
					<div class="pull-right">
						<ul class="footer-menu">
							<li><a href="${pageContext.request.contextPath}/about/ourplanners">기술자들 팀</a></li>
							<li><a href="${pageContext.request.contextPath}/about/recruit">인재채용</a></li>
							<li><a href="${pageContext.request.contextPath}/about/service">서비스소개</a></li>
							<li><a href="${pageContext.request.contextPath}/policy/provision">이용약관</a></li>
							<li><a href="${pageContext.request.contextPath}/policy/privacy">개인정보 취급방식</a></li>
							<li><a href="${pageContext.request.contextPath}/about/sitemap">사이트맵</a></li>
							<li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>