package com.cafe24.ourplanners.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;
import com.cafe24.ourplanners.member.service.MemberService;
import com.cafe24.ourplanners.util.SHA256;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "member/join", method = RequestMethod.GET)
	public String join(Model model,HttpServletRequest req) {
		logger.info("회원가입 이용약관");
		model.addAttribute("action", "term");
		return "member/member_join";
	}
	
	
	@RequestMapping(value = "member/join", method = RequestMethod.POST)
	public String join(MemberVO member,HttpServletRequest req, Model model,MemberVO vo) {
		
		logger.info("회원가입 action : "+req.getParameter("action"));
		
		
		if(req.getParameter("action")==null || req.getParameter("action").equals("") || req.getParameter("action").equals("term"))
		{
			//String inotice = request.getParameter("inotice") == null ? " " : request.getParameter("inotice");
			
			model.addAttribute("action", "term");
			return "member/member_join";
			
		}
		else if(req.getParameter("action").equals("signup"))
		{
			model.addAttribute("action", "signup");
			return "member/member_join";
		}
		else if(req.getParameter("action").equals("authmail"))
		{
			service.registMember(req,model);
			
			return "member/member_join";

		}
		else if(req.getParameter("action").equals("complete"))
		{
			MemberVO dto = null;
			HttpSession session = req.getSession();
			System.out.println("세션");
			System.out.println(((MemberVO)session.getAttribute("joinInfo")).getPassword());
			if (session == null || session.getAttribute("joinInfo") == null) {
				System.out.println("세션 리다이렉트");
				model.addAttribute("action", "term");
				return "member/member_join";
				
			}else {
				System.out.println("세션등록");
				dto = ((MemberVO)session.getAttribute("joinInfo"));
			}
							
				session.removeAttribute("joinInfo");

				
			      service.registMember(req,model);
						
								
				
				model.addAttribute("action", "complete");
				model.addAttribute("joinInfo", dto);
				

				return "member/member_join";
			
		}
		else {
			return "member/member_join";
		}
		
		
       
	}
	
	
	
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

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
