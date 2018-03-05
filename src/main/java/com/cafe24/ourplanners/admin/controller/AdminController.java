package com.cafe24.ourplanners.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value={"admin", "admin/","admin/dashboard"})
	public String adminMain(HttpServletRequest req, Model model) {
		System.out.println("어드민 메인(대시보드) 페이지");
		return "admin/admin_dashboard";
	}
	
	@RequestMapping(value="admin/login", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest req, Model model) {
		System.out.println("어드민 로그인 페이지");
		return "admin/admin_login";
	}

	@RequestMapping(value="admin/member")
	public String adminMember(HttpServletRequest req, Model model) {
		System.out.println("회원 관리 페이지");
		return "admin/admin_member_list";
	}
	
	@RequestMapping(value="admin/message")
	public String adminMessage(HttpServletRequest req, Model model) {
		System.out.println("메시지 페이지");
		return "admin/admin_message_list";
	}
	
	@RequestMapping(value="admin/board")
	public String adminServiceBoard(HttpServletRequest req, Model model) {
		System.out.println("서비스 게시판 게시물 관리 페이지");
		return "admin/admin_board_list";
	}
	
	@RequestMapping(value="admin/comment")
	public String adminServiceComment(HttpServletRequest req, Model model) {
		System.out.println("서비스 게시판 댓글 관리 페이지");
		return "admin/admin_comment_list";
	}
	
	@RequestMapping(value="admin/faq")
	public String adminFAQ(HttpServletRequest req, Model model) {
		System.out.println("자주 묻는 질문");
		return "admin/admin_faq_list";
	}
	
	@RequestMapping(value="admin/email")
	public String adminEmail(HttpServletRequest req, Model model) {
		System.out.println("이메일 발송");
		return "admin/admin_email";
	}
	
	@RequestMapping(value="admin/regist")
	public String adminRegist(HttpServletRequest req, Model model) {
		System.out.println("관리자 계정 생성");
		return "admin/admin_regist";
	}
	
	@RequestMapping(value="admin/session_timeout")
	public String adminSessionTimeOut(HttpServletRequest req, Model model) {
		System.out.println("관리자 계정 생성");
		return "admin/admin_session_timeout";
	}
	
	@RequestMapping(value="admin/lockscreen")
	public String adminLockScreen(HttpServletRequest req, Model model) {
		System.out.println("관리자 화면 자금");
		return "admin/admin_lockscreen";
	}
	@RequestMapping(value="admin/charts")
	public String adminCharts(HttpServletRequest req, Model model) {
		System.out.println("통계(차트) 화면 보기");
		return "admin/admin_charts";
	}
	
	
	
	
}
