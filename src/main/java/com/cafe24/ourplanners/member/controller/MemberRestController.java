package com.cafe24.ourplanners.member.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.member.service.MemberService;

@RestController
public class MemberRestController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/jsontest", method= RequestMethod.GET)
	  public HashMap<String, Object> jsonTest() {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("name", "박세창");
	      return map;
	  }
	
	
	@RequestMapping(value="/member/json/authkey_check.json")
	public HashMap<String, Object> authkeyCheck(HttpServletRequest req){
		

		 HashMap<String, Object> map = new HashMap<String, Object>();
		
		 service.checkAuthkey(req,map);
		
		
	      return map;
	      
	}
	
	
	
	@RequestMapping(value="/member/json/id_check.json",method= RequestMethod.GET)
	  public HashMap<String, Object> idCheck(HttpServletRequest req) {
			
		HashMap<String, Object> map = new HashMap<String, Object>();
	 
		service.hasId(req,map);
	      
	  
	      return map;
	  }
	
	
}
