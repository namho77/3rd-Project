package com.cafe24.ourplanners.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.mypage.service.MyPageService;

@Controller
public class MyPageController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//@Inject
	//private MyPageService service;

	// 마이 플래너스
	@RequestMapping(value = "mypage/myplan", method = RequestMethod.GET)
	public String myplan(Model model, HttpServletRequest req) {
		logger.info("마이 페이지 - 마이 플랜");
		return "mypage/myplan";
	}
	
	
	@RequestMapping(value = "mypage/profile/", method = RequestMethod.GET)
	public String veiwProfile(Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "") String type) {
		logger.info("마이 페이지 - 마이 프로필 보기");
		return "mypage/profile";
	}
	
	@RequestMapping(value = "mypage/profile/{user_id}", method = RequestMethod.GET)
	public String veiwProfile(@PathVariable String user_id,Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "") String type) {
		logger.info("마이 페이지 - 상대방 프로필 보기");
		return "mypage/profile";
	}
	
	
	//회원탈퇴
	@RequestMapping(value = "mypage/withdraw", method = RequestMethod.GET)
		public String withdraw(@PathVariable String boardSrl,Model model) {
				
		
		return "member/member_withdraw";
	}
	
}
