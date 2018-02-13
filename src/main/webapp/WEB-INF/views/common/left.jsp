<%@page import="com.cafe24.ourplanners.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 관리자 페이지 전용 Sidebar -->



		<ul class="nav nav-pills nav-stacked">
			<li><a href="../">HOME</a></li>
			<%
				if (session != null && session.getAttribute("loginUserInfo") != null
						&& ((MemberVO) session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			%>

			<li><a href="${pageContext.request.contextPath}/admin/">관리자 대시보드</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/member_list">회원 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/service_document_list">서비스 게시물 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/service_comment_list">서비스 게시물 댓글 관리</a></li>
			

			<%
				} else {
			%>

			<%
				}
			%>
		</ul>


<!-- //Sidebar -->

