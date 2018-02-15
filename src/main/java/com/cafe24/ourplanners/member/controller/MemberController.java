package com.cafe24.ourplanners.member.controller;

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
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;
import com.cafe24.ourplanners.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MemberService service;

	// 회원가입
	@RequestMapping(value = "member/join", method = RequestMethod.GET)
	public String join(Model model, HttpServletRequest req) {
		logger.info("회원가입 이용약관");
		model.addAttribute("action", "term");
		return "member/member_join";
	}

	// 회원가입 다음단계 페이지 처리
	@RequestMapping(value = "member/join", method = RequestMethod.POST)
	public String join(MemberVO member, HttpServletRequest req, Model model, MemberVO vo) {

		logger.info("회원가입 action : " + req.getParameter("action"));

		if (req.getParameter("action") == null || req.getParameter("action").equals("")
				|| req.getParameter("action").equals("term")) {
			// String inotice = request.getParameter("inotice") == null ? " " :
			// request.getParameter("inotice");

			model.addAttribute("action", "term");
			return "member/member_join";

		} else if (req.getParameter("action").equals("signup")) {
			model.addAttribute("action", "signup");
			return "member/member_join";
		} else if (req.getParameter("action").equals("authmail")) {
			service.saveMember(req, model);

			return "member/member_join";

		} else if (req.getParameter("action").equals("complete")) {
			MemberVO vo1 = null;
			HttpSession session = req.getSession();
			System.out.println("세션");
			System.out.println("비밀번호:" + ((MemberVO) session.getAttribute("joinInfo")).getPassword());
			if (session == null || session.getAttribute("joinInfo") == null) {
				System.out.println("세션 리다이렉트");
				model.addAttribute("action", "term");
				return "member/member_join";

			} else {
				System.out.println("세션등록");
				vo1 = ((MemberVO) session.getAttribute("joinInfo"));
			}

			session.removeAttribute("joinInfo");

			service.registMember(vo1);

			model.addAttribute("action", "complete");
			model.addAttribute("joinInfo", vo1);

			return "member/member_join";

		} else {
			return "member/member_join";
		}

	}

	// 로그인 화면
	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest req, HttpSession session) {
		logger.info("로그인");
		String prev_url = req.getHeader("referer");
		// System.out.println("prev_url = "+prev_url);
		String contextPath = req.getContextPath();
		// System.out.println("contextPath = "+contextPath);
		String command = null;

		// 직접 경로로 들어오는 경우 메인 페이지로 설정
		if (prev_url == null) {

			prev_url = "http://" + req.getServerName() + ":" + req.getServerPort() + contextPath;
			session.setAttribute("prev_url", prev_url);
			return "member/member_login";
		}
		// command = prev_url.substring(contextPath.length());
		int start = prev_url.indexOf(contextPath) + contextPath.length();
		int end = prev_url.length();
		command = prev_url.substring(start, end);

		session.setAttribute("prev_url", prev_url);

		// System.out.println("요청 주소 추출 : " + command + "\n이전 주소 : " + prev_url);

		if (command.equals("/member/join")) {
			// 회원가입 페이지에서 로그인시 메인 페이지로 그외는 이전 페이지를 넘김
			session.setAttribute("prev_url", contextPath + "/");

		}

		return "member/member_login";
	}

	// 로그인 처리
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(LoginDTO dto, HttpServletRequest req, HttpSession session, Model model) throws Exception {

		String redirect_url = (String) session.getAttribute("prev_url");

		MemberVO vo = service.login(dto, model);

		try {
			if (vo == null) {
				// 로그인 실패
				return "member/member_login";
			}
			
			//model.addAttribute("loginUserInfo", vo);

			System.out.println("로그인된 아이디 : " + vo.getUser_id());

			session.setAttribute("loginUserInfo", vo);
		} catch (Exception e) {
			// 로그인 실패
			logger.info("Exception Msg: {}", e.getMessage());
			model.addAttribute("ERROR_MSG", "예외가 발생 되었습니다. 관리자에게 문의하세요.");
			return "member/member_login";
		}

		// 이전 페이지 주소 없으면 메인 페이지로
		if (redirect_url == null || redirect_url.length() == 0) {
			
			System.out.println("이전 주소 없음 메인 페이지로 리다이렉트");
			return "redirect:/";
		} else {

			// 로그인 클릭전 페이지로 리다이렉션
			return "redirect:" + redirect_url;
		}

	}

	@RequestMapping(value = "member/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req, HttpSession session) {

		String prev_url = req.getHeader("referer");

		session.setAttribute("prev_url", prev_url);

		System.out.println("이전주소 : " + prev_url);

		// 로그아웃처리
		session.removeAttribute("loginUserInfo");

		// return "redirect:login";
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

	@RequestMapping(value = "find/password", method = RequestMethod.PUT)
	public String findPassword(Model model) {
		logger.info("비밀번호 찾기");

		return "find/find_password";
	}

}
