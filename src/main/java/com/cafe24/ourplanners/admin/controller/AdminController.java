package com.cafe24.ourplanners.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value={"admin", "admin/"})
	public String adminDashboard1(HttpServletRequest req, Model model) {
		System.out.println("어드민 페이지 접속");
		return "admin/admin_dashboard";
	}
	
	@RequestMapping(value="admin/login", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest req, Model model) {
		System.out.println("어드민 로그인 페이지");
		return "admin/admin_login";
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
	
	
	
}
