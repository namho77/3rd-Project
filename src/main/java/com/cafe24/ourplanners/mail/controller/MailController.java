package com.cafe24.ourplanners.mail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.MainController;
import com.cafe24.ourplanners.mail.service.MailService;

@Controller
public class MailController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	private MailService service;
	
	@ResponseBody
	@RequestMapping(value = "/mail/mail_authkey_send.json")
	public Map<String, Object> authkeySend(HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();

		service.sendAuthMail(req,map);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mail/mail_send.json")
	public Map<String, Object> mailSend(HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		service.sendMail(req, map);
		
		
		

		return map;
	}

}
