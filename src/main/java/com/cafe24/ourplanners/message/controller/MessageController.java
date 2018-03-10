package com.cafe24.ourplanners.message.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.message.service.MessageService;
import com.cafe24.ourplanners.util.SearchMessageCriteria;

@Controller
public class MessageController {

	@Inject
	private MessageService service;

	@ResponseBody
	@RequestMapping(value = "/message/json/message_list.json")
	public HashMap<String, Object> getMessageListJson(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "1") Integer nowPage,
			@RequestParam(required = false) Integer receiver_srl,
			@RequestParam(required = false) Integer sender_srl,
			@RequestParam(required = false) Integer pageSize,
			@RequestParam(required = false) Integer blockPage) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		if (pageSize == null || blockPage == null) {
			ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();

			ConfigurableEnvironment env = ctx.getEnvironment();

			MutablePropertySources propertySources = env.getPropertySources();

			try {
				propertySources.addLast(new ResourcePropertySource("classpath:Environment.properties"));
				if (pageSize == null)
					pageSize = Integer.parseInt(env.getProperty("message.pageSize"));
				if (blockPage == null)
					blockPage = Integer.parseInt(env.getProperty("message.blockPage"));
			} catch (Exception e) {

				e.printStackTrace();
			}

			ctx.close();
		}
		SearchMessageCriteria scri = new SearchMessageCriteria();

		if (receiver_srl != null) {
			scri.setMessage_srl(receiver_srl);
		}
		
		if (sender_srl != null) {
			scri.setSender_srl(sender_srl);
		}

		
		scri.setNowPage(nowPage);
		scri.setPageSize(pageSize);
		scri.setBlockPage(blockPage);

		System.out.println("nowPage:" + nowPage);

		service.getMessageListJson(scri, map);

		return map;

	}

	// 글 상세 보기
	@RequestMapping(value = "/message/{message_srl}", method = RequestMethod.GET)
	public String viewMessage(@PathVariable Integer message_srl, Model model) {
		model.addAttribute("message_srl", message_srl);
		return "/message/message_view";
	}

	// 리스트 보기
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String listMessage(Model model) {

		return "/message/message_list";
	}

	// 글쓰기 폼 가져오기
	@RequestMapping(value = "/message/new", method = RequestMethod.GET)
	public String writeFormMessege() {
		return "/message/message_write";
	}

	// 글쓰기 처리
	@ResponseBody
	@RequestMapping(value = "/message", method = RequestMethod.POST)
	public Map<String, Object> writeActionMessage(HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("loginUserInfo") == null) {
			map.put("result", "fail");
			map.put("errorMsg", "isNotLogin");
			return map;
		}

		if (!((MemberVO) session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			map.put("result", "fail");
			map.put("errorMsg", "isNotAdmin");
			return map;
		}

		int result = service.writeMessage(req, map);

		if (result <= 0) {
			map.put("result", "fail");
			map.put("errorMsg", "sqlError");
		} else {
			map.put("result", "success");
		}
		return map;
	}

	// 해당 글 삭제
	@ResponseBody
	@RequestMapping(value = "/message/{message_srl}", method = RequestMethod.DELETE)
	public Map<String, Object> deleteMessage(HttpServletRequest req, HttpSession session, Model model,
			@PathVariable Integer message_srl) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("loginUserInfo") == null) {
			map.put("result", "fail");
			map.put("errorMsg", "isNotLogin");
			return map;
		}

		int result = service.deleteMessage(message_srl);

		if (result <= 0) {
			map.put("result", "fail");
			map.put("errorMsg", "sqlError");
		} else {
			map.put("result", "success");
		}

		return map;
	}

}
