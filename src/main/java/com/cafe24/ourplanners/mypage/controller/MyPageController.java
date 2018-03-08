package com.cafe24.ourplanners.mypage.controller;

import java.util.List;

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
import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.service.BoardService;
import com.cafe24.ourplanners.mypage.service.MyPageService;
import com.cafe24.ourplanners.util.PagingUtil;

@Controller
public class MyPageController {
		
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Inject
	private MyPageService service;
		
	// 마이 플래너스
	@RequestMapping(value = "mypage/myplan", method = RequestMethod.GET)
	public String myPlan(Model model, HttpServletRequest req) {
		logger.info("마이 페이지 - 마이 플랜");
		return "mypage/myplan";
	}
	
	// 마이 플래너스_요청자 진행건
	@RequestMapping(value = "mypage/myplan_client_ing", method = RequestMethod.GET)
	public String myPlanClienting(Model model, HttpServletRequest req, HttpSession session) {
		
		List<BoardVO> lists = null;
		
		int pageSize = 5; //한페이지에 출력할 게시물의 개수
		int blockPage = 5; //한 블럭에 표시할 페이지번호의 개수
				
		//페이지 파라미터 처리
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//뤄리문에서 가져올 start값, end값 구하기
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		int totalRecordCount = 0;
				
		try {
			
			totalRecordCount = service.getTotalCount();
			
			//lists = service.list();
			
			lists = service.listPage(start, end);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		String pagingDiv = PagingUtil.pagingAjax(totalRecordCount, pageSize, blockPage, nowPage, "");
		
		model.addAttribute("lists", lists);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingDiv", pagingDiv);
		
		return "mypage/myplan_client_list";
	}
	
	// 마이 플래너스_요청자 완료건
	@RequestMapping(value = "mypage/myplan_client_check", method = RequestMethod.GET)
	public String myPlanClientCheck(Model model, HttpServletRequest req) {
		
		return "mypage/myplan_client_list_check";
	}
	
	// 마이 플래너스_기술자 진행건
	@RequestMapping(value = "mypage/myplan_engineer_ing", method = RequestMethod.GET)
	public String myPlanEngineering(Model model, HttpServletRequest req) {
		
		return "mypage/myplan_engineer_list";
	}
	
	// 마이 플래너스_기술자 완료건
	@RequestMapping(value = "mypage/myplan_engineer_check", method = RequestMethod.GET)
	public String myPlanEngineerCheck(Model model, HttpServletRequest req) {
		
		return "mypage/myplan_engineer_list_check";
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
	public String modifyMyInfo(Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "") String type) {
		logger.info("마이 페이지 - 나의 정보 보기(의뢰인시점/기술자시점)");

		String action = req.getParameter("action");
		
		//if(action.equalsIgnoreCase("password"))
		//return "mypage/myinfo_modify_confirm_password";
		//else
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
