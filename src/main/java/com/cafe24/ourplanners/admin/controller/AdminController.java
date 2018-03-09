package com.cafe24.ourplanners.admin.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.service.MemberService;

@Controller
public class AdminController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value={"admin", "admin/","admin/dashboard"})
	public String adminMain(HttpServletRequest req, Model model) {
		System.out.println("어드민 메인(대시보드) 페이지");
		return "admin/admin_dashboard";
	}
	
	@RequestMapping(value="admin/login", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest req, Model model,HttpSession session) {
		System.out.println("어드민 로그인 페이지");
		
		String referer_url = req.getHeader("referer");
		System.out.println("리퍼러 = " + referer_url);
		String contextPath = req.getContextPath();
		// System.out.println("contextPath = "+contextPath);
		String command = null;
		String auth_prev_url = (String) session.getAttribute("auth_prev_url");

		// auth인터셉터로 타고온 로그인 처리인 경우
		if (auth_prev_url != null && auth_prev_url.length() != 0) {
			System.out.println("auth인터셉터 타고온 로그인");
			session.removeAttribute("auth_prev_url");
			session.setAttribute("prev_url", auth_prev_url);
			return "admin/admin_login";
		}

		// 직접 경로로 들어오는 경우 메인 페이지로 설정
		if (referer_url == null || referer_url.length() == 0) {
			String prev_url = (String) session.getAttribute("prev_url");
			if (prev_url == null || prev_url.length() == 0) {
				referer_url = "http://" + req.getServerName() + ":" + req.getServerPort() + contextPath;
				session.setAttribute("prev_url", referer_url);
			}
			return "admin/admin_login";
		}

		// command = prev_url.substring(contextPath.length());
		int start = referer_url.indexOf(contextPath) + contextPath.length();
		int end = referer_url.length();
		command = referer_url.substring(start, end);

		session.setAttribute("prev_url", referer_url);

		System.out.println("요청 주소 추출 : " + command + "\n이전 주소 : " + referer_url);

		if (command.equals("/member/join")) {
			// 회원가입 페이지에서 로그인시 메인 페이지로 그외는 이전 페이지를 넘김
			referer_url = "http://" + req.getServerName() + ":" + req.getServerPort() + contextPath;
			session.setAttribute("prev_url", referer_url);

		}

		return "admin/admin_login";
	}
	
	@RequestMapping(value = "admin/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws Exception {

		String prev_url = req.getHeader("referer");

		session.setAttribute("prev_url", prev_url);

		System.out.println("로그아웃시 이전주소 : " + prev_url);

		Object loginObj = session.getAttribute("loginUserInfo");

		if (loginObj != null) {
			MemberVO vo = (MemberVO) loginObj;

			session.removeAttribute("loginUserInfo");
			session.invalidate(); // prev_url 등 다른 세션도 삭제위해..
			Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				resp.addCookie(loginCookie);
				memberService.keepLogin(vo.getMember_srl(), session.getId(), new Date());
			}
		}

		// 로그아웃처리
		// session.removeAttribute("loginUserInfo");

		// return "redirect:login";
		return "admin/admin_login";
	}

	
	//관리자 프로필
	@RequestMapping(value="admin/profile")
	public String adminProfile(HttpServletRequest req, Model model) {
		System.out.println("프로필 페이지");
		return "admin/admin_profile";
	}
	
	//관리자 계정 설정
	@RequestMapping(value="admin/profile/edit")
	public String adminEdit(HttpServletRequest req, Model model) {
		System.out.println("관리자 계정 설정(수정)");
		return "admin/admin_profile_modify";
	}
	
	//관리자 계정 생성
	@RequestMapping(value="admin/profile/new")
	public String adminModify(HttpServletRequest req, Model model) {
		System.out.println("관리자 아이디 생성");
		return "admin/admin_profile_modify";
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
