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
import org.springframework.stereotype.Service;
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
