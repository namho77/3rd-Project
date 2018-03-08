package com.cafe24.ourplanners.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.mypage.service.MyPageService;


@Controller
public class MyPageController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	//@Inject
	//private MyPageService service;
		
	// 마이 플래너스
	@RequestMapping(value = "mypage/myplan", method = RequestMethod.GET)
	public String myPlan(Model model, HttpServletRequest req) {
		logger.info("마이 페이지 - 마이 플랜");
		return "mypage/myplan";
	}
	
	//나의 정보보기
	@RequestMapping(value = "mypage/myinfo", method = RequestMethod.GET)
	public String viewMyInfo(Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "") String type) {
		logger.info("마이 페이지 - 나의 정보 보기(의뢰인시점/기술자시점)");
		return "mypage/myinfo";
	}
		
	//나의 정보 수정
	@RequestMapping(value = "mypage/myinfo", method = RequestMethod.POST)
	public String modifyMyInfoForm(Model model, HttpServletRequest req,HttpSession session,
			@RequestParam(required = false, defaultValue = "") String type) {
		
		logger.info("마이 페이지 - 나의 정보 보기(의뢰인시점/기술자시점)");

		String action = req.getParameter("action");
		
		
		System.out.println("Method : " + req.getMethod() + " Action : " + req.getParameter("action"));

		Object obj = session.getAttribute("loginUserInfo");
		MemberVO memVO = (MemberVO) obj;
		String user_id = memVO.getUser_id();
		
		/*if (action == null || action.length() == 0 || action.equalsIgnoreCase("view")) {

			
			return "mypage/myinfo";
			
		}
		// confirm password before member info
		else if (action.equalsIgnoreCase("password")) {
			return "mypage/myinfo_modify_confirm_password";
		} else if (action.equalsIgnoreCase("modify")) {
			// 파라미터 들어온 비밀번호를 확인후 회원 정보 수정 폼 뛰우기

			String user_pw = (String) req.getParameter("user_pw");

			boolean isMember = dao.isMember(user_id, user_pw);
			if (!isMember) {
				// 비밀번호 다른경우 에러메시지와 함께 다시 비밀번호 확인창으로 뷰 이동
				// 에러 메시지 맵
				Map<String, Boolean> errorsMap = new HashMap<String, Boolean>();
				errorsMap.put("isNotMatchPassword", Boolean.TRUE);
				// <c:if test="${errors.isNotMatchPassword}">비밀번호가 일치하지 않습니다.</c:if>
				req.setAttribute("errors", errorsMap);
				req.getRequestDispatcher("/member/member_info_modify_confirm_password.jsp").forward(req, resp);
				
			}
			else {
				// 비밀번호 맞은경우
				MemberDTO userInfo = null;
				userInfo = dao.getUserInfo(user_id);
				req.setAttribute("userInfo", userInfo);
				
				req.setAttribute("isMatchedPass", "Y");
				req.getRequestDispatcher("/member/member_info_modify.jsp").forward(req, resp);
			}
			
		} 
		else if (action.equalsIgnoreCase("modifyAdmin")) {
			
			//현재 접속된 계정의 아이디가 관리자인지 확인하고..
			if(!memVO.getIs_admin().equalsIgnoreCase("Y"))
			{
				// 비밀번호 다른경우 에러메시지와 함께 다시 비밀번호 확인창으로 뷰 이동
				// 에러 메시지 맵
				Map<String, Boolean> errorsMap = new HashMap<String, Boolean>();
				errorsMap.put("isNotAdminModifyMember", Boolean.TRUE);
				// <c:if test="${errors.isNotAdminModifyMember}">관리자 계정만 이용할 수 있습니다.</c:if>
				model.addAttribute("errors", errorsMap);
				return "mypage/myinfo_modify_confirm_password";				
			}
			else {
				// 관리자 계정인 경우 파라미터로 받은 user_id의 멤버 변수를 정보에 저장후 포워딩
				
				MemberDTO userInfo = null;
				String modify_id = req.getParameter("modify_id");
				
				
				if(modify_id == null || modify_id.length()==0)
					userInfo = dao.getUserInfo(user_id);	
				else
					userInfo = dao.getUserInfo(modify_id);
				
				req.setAttribute("userInfo", userInfo);
				//관리자 계정 여부 저장
				req.setAttribute("isAdmin", "Y");
				req.getRequestDispatcher("/member/member_info_modify.jsp").forward(req, resp);
			}
		}
		
		else if (action.equalsIgnoreCase("complete")) {
			// 회원정보 수정 완료 처리후 회원정보 보기 페이지로 이동
			HttpSession session = req.getSession();

			String user_id = (String) (session.getAttribute("USER_ID"));

			if (user_id == null || user_id.length() == 0) {
				req.getRequestDispatcher("/member/login.jsp").forward(req, resp);
			}
			
			MemberDTO userInfo = null;
			MemberDAO dao = MemberDAO.getInstance();
			
			//기존 정보 객체 가져오고
			userInfo = dao.getUserInfo(user_id);
			
			
			//파라미터로 넘겨받은 정보로 변환해서 
			String user_name =req.getParameter("user_name");
			
			
			String gender = req.getParameter("gender");
			String nick_name = req.getParameter("nick_name");
			
			int find_account_question = Integer.parseInt(req.getParameter("find_account_question"));

			String find_account_answer = req.getParameter("find_account_answer");
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String birthday = req.getParameter("birthday");

			java.util.Date utilDate =null;
			
			try {
				utilDate = format.parse(birthday);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			java.sql.Date sqlBirthday = new java.sql.Date(utilDate.getTime());
			
			String date_type = req.getParameter("date_type");
			
			String postcode = req.getParameter("postcode");

			String address1 = req.getParameter("address1");

			String address2 = req.getParameter("address2");

			String sido = req.getParameter("sido");

			String sigungu = req.getParameter("sigungu");
			
			String mobno = req.getParameter("mobno");

			String allow_mailing = req.getParameter("allow_mailing");
			String allow_message = req.getParameter("allow_message");

			userInfo.setUser_name(user_name);
			userInfo.setGender(gender);
			userInfo.setNick_name(nick_name);
			userInfo.setFind_account_question(find_account_question);
			userInfo.setFind_account_answer(find_account_answer);
			
			userInfo.setBirthday(sqlBirthday);
			userInfo.setDate_type(date_type);
			
			userInfo.setPostcode(postcode);
			userInfo.setAddress1(address1);
			userInfo.setAddress2(address2);
			
			userInfo.setSido(sido);
			userInfo.setSigungu(sigungu);
			
			userInfo.setMobno(mobno);
			
			userInfo.setAllow_mailing(allow_mailing);
			userInfo.setAllow_message(allow_message);
			
			//업데이트 실행
			
			int affected = dao.updateDefaultInfo(userInfo);
			
			if (affected != 1)
			{
				req.getRequestDispatcher("/member/member_info_view.jsp").forward(req, resp);
			}
			 
			//실행후 나의 정보 페이지로
			return "mypage/myinfo";
			
		}*/

		return "mypage/myinfo_modify";
	}
	
	
	
	
	
	
	
	
	//상대방(또는 자신) 서비스 프로필 보기
	@RequestMapping(value = "/profile/{user_id}", method = RequestMethod.GET)
	public String viewProfile(@PathVariable String user_id,Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "E") String type) {
		
		/*
		 * type => E:기술자시점 C:의뢰인시점
		 */
		logger.info("상대방 서비스 프로필 보기(문의하기 기능 message)");
		return "mypage/profile";
	}
	
}
