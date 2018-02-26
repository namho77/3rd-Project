package com.cafe24.ourplanners.message.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	@RequestMapping(value = "message", method = RequestMethod.GET)
	public String join(Model model, HttpServletRequest req) {
		logger.info("쪽지함");
		model.addAttribute("action", "term");
		return "message/message_list";
	}
}
