package com.cafe24.ourplanners;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("메인 페이지. 언어 {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping(value = "privacy", method = RequestMethod.GET)
	public String privacy(Model model) {
		logger.info("개인정보 취급방침 페이지");
			
		return "policy_privacy";
	}
	
	@RequestMapping(value = "provision", method = RequestMethod.GET)
	public String provision(Model model) {
		logger.info("사이트 이용약관 페이지");
			
		return "policy_provision";
	}
	
	
}
