package com.cafe24.ourplanners.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.mypage.service.MyPageService;

@Controller
public class MyPageController {
		
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Inject
	private MyPageService service;
		
	// 마이 플래너스
	@RequestMapping(value = "mypage/myplan", method = RequestMethod.GET)
	public String myPlan(Model model, HttpServletRequest req, HttpSession session) {
		logger.info("마이 페이지 - 마이 플랜");
		
		//의뢰매칭성공률, 기술나눔 매칭성공률 구현부분
		int clientMatchingPrecent = 0;
		int engineerMatchingPrecent = 0;
		
		int clientListCheck_TotalRecordConut = 0;
		int clientList_TotalRecordConut = 0;
		int engineerListCheck_TotalRecordConut = 0;
		int engineerList_TotalRecordConut = 0;
		
		String user_id = ((MemberVO)session.getAttribute("loginUserInfo")).getUser_id();
		
		try {
			clientListCheck_TotalRecordConut = service.getClientListCheck_TotalRecordConut(user_id);
			clientList_TotalRecordConut = service.getClientList_TotalRecordConut(user_id);
			engineerListCheck_TotalRecordConut = service.getEngineerListCheck_TotalRecordConut(user_id);
			engineerList_TotalRecordConut = service.getEngineerList_TotalRecordConut(user_id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		clientMatchingPrecent = (int)(((double)clientListCheck_TotalRecordConut/clientList_TotalRecordConut)*100);
		engineerMatchingPrecent = (int)(((double)engineerListCheck_TotalRecordConut/engineerList_TotalRecordConut)*100);
		
		model.addAttribute("clientMatchingPrecent", clientMatchingPrecent);
		model.addAttribute("engineerMatchingPrecent", engineerMatchingPrecent);
		
		return "mypage/myplan";
	}

	
	// 마이 플래너스 - 리스트 - 글읽기
	@RequestMapping(value = "mypage/myplan/view", method = RequestMethod.GET)
	public String myPlanView(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws IOException {
		
		
		BoardVO vo = null;
		try {
			vo = service.view(Integer.parseInt(req.getParameter("board_srl")));
			
			//줄바꿈
			vo.setContents(vo.getContents().replace("\r\n", "<br/>"));
			
			//조회수
			service.visitCount(Integer.parseInt(req.getParameter("board_srl")));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("view", vo);
		
		return "mypage/myplan_list_view";
	}
	
	// 마이 플래너스 - 글수정폼 
	@RequestMapping(value = "mypage/myplan/modify/{board_srl}", method = RequestMethod.GET)
	public String myPlanModify(@PathVariable Integer board_srl, Model model) {
		try {
			service.modify(board_srl, model);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
		return "mypage/myplan_list_modify";
	}
	
	// 마이 플래너스 - 글수정 처리
	@ResponseBody
	@RequestMapping(value = "mypage/myplan/modifyAction", method = RequestMethod.POST)
	public Map<String, Object> myPlanModifyAction(HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		int result = 0;
		if (session.getAttribute("loginUserInfo") == null) {
			map.put("code", "login");
			map.put("message", "로그인 후 수정해주세요");
			return map;
		}
		
		try {
			result = service.modifyAction(req);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if (result <= 0) {
			map.put("code", "FAIL");
			map.put("message", "수정 실패 하였습니다.");
		} else {
			map.put("code", "SUCCESS");
			map.put("message", "글수정을 성공하였습니다.");
		}
		
		return map;
	}
	
	// 마이 플래너스 - 삭제처리
	@ResponseBody
	@RequestMapping(value = "mypage/myplan/delete/{board_srl}", method = RequestMethod.POST)
	public Map<String, Object> myPlanDelete(@PathVariable Integer board_srl, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = 0;
		
		if (session.getAttribute("loginUserInfo") == null) {
			map.put("code", "login");
			map.put("message", "로그인 후 삭제해주세요");
			return map;
		}
		
		try {
			result = service.delete(board_srl);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if (result <= 0) {
			map.put("code", "FAIL");
			map.put("message", "삭제 실패 하였습니다.");
		} else {
			map.put("code", "SUCCESS");
			map.put("message", "삭제 하였습니다.");
		}
		
		return map;
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
