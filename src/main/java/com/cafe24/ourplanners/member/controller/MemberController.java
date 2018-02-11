package com.cafe24.ourplanners.member.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "member/join", method = RequestMethod.GET)
	public String join(Model model) {
		logger.info("회원가입");
				
		return "member/member_join";
	}
	
	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	public String login(Model model,HttpServletRequest req , HttpSession session) {
		logger.info("로그인");
		String prev_url = req.getHeader("referer");
			
		String contextPath = req.getContextPath();
				
		String command = null;
		//command = prev_url.substring(contextPath.length());
		int start = prev_url.indexOf(contextPath)+contextPath.length();
		int end = prev_url.length();
		command = prev_url.substring(start, end);
		
		session.setAttribute("prev_url", prev_url);
		
		System.out.println(command);
		
		if (command.equals("/member/join")) {
			//회원가입 페이지에서 로그인시 메인 페이지로 그외는 이전 페이지를 넘김
			session.setAttribute("prev_url", contextPath+"/index.jsp");
				
		}
		
		return "member/member_login";
	}
	
	@RequestMapping(value = "member/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpServletRequest req , HttpSession session) {
		
		String prev_url = req.getHeader("referer");
		
		session.setAttribute("prev_url", prev_url);
		
		System.out.println("이전주소 : " +prev_url);
	
		//로그아웃처리
		session.removeAttribute("loginUserInfo");
		
		//return "redirect:login";
		return "member/member_login";
	}
	
	
	
	
	
	
	@RequestMapping(value = "member/info", method = RequestMethod.GET)
	public String viewMemberInfo(Model model) {
		logger.info("회원정보 보기");
				
		return "member/member_info_view";
	}
	
	@RequestMapping(value = "member/info", method = RequestMethod.PUT)
	public String modifyMemberInfo(Model model) {
		logger.info("회원정보 수정");
				
		return "member/member_info_modify";
	}
}
