package com.cafe24.ourplanners.faq.controller;

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

import com.cafe24.ourplanners.faq.service.FAQService;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

@Controller
public class FAQController {

	@Inject
	private FAQService service;

	// faq 게시판 JSON
	@ResponseBody
	@RequestMapping(value = "/customercenter/faq/json/faq_list.json")
	public HashMap<String, Object> getFAQListJson(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "1") Integer nowPage,

			@RequestParam(required = false) Integer category_srl,
			@RequestParam(required = false) Integer service_srl,

			@RequestParam(required = false) Integer pageSize,
			@RequestParam(required = false) Integer blockPage,
			@RequestParam(required = false, defaultValue = "") String searchType,
			@RequestParam(required = false, defaultValue = "") String keyword) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		if (pageSize == null || blockPage == null) {
			ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();

			ConfigurableEnvironment env = ctx.getEnvironment();

			MutablePropertySources propertySources = env.getPropertySources();

			try {
				propertySources.addLast(new ResourcePropertySource("classpath:Environment.properties"));
				pageSize = Integer.parseInt(env.getProperty("faq.pageSize"));
				blockPage = Integer.parseInt(env.getProperty("faq.blockPage"));
			} catch (Exception e) {
				
				e.printStackTrace();
			}

			ctx.close();
		}

		SearchFAQCriteria scri = new SearchFAQCriteria();

		if (category_srl != null) {
			scri.setCategory_srl(category_srl);
		}
		
		if (service_srl != null) {
			scri.setService_srl(service_srl);
		}
		scri.setNowPage(nowPage);
		scri.setPageSize(pageSize);
		scri.setBlockPage(blockPage);
		
		if(searchType != null && searchType.length() != 0)
		scri.setSearchType(searchType);
		if(keyword != null && keyword.length() != 0)
		scri.setKeyword(keyword);		
		
		service.getFAQListJson(scri, map);

		return map;
	}

	// 글 상세 보기
	@RequestMapping(value = "/customercenter/faq/{faq_srl}", method = RequestMethod.GET)
	public String viewFAQ(@PathVariable Integer faq_srl,Model model) {
		model.addAttribute("faq_srl",faq_srl);		
		return "customercenter/faq/customercenter_faq_view";
	}

	// 리스트 보기
	@RequestMapping(value = "/customercenter/faq", method = RequestMethod.GET)
	public String listFAQ(Model model) {
		
		
		return "customercenter/faq/customercenter_faq_list";
	}

	// 글쓰기 폼 가져오기
	@RequestMapping(value = "/customercenter/faq/new", method = RequestMethod.GET)
	public String writeFormFAQ() {
		return "customercenter/faq/customercenter_faq_write";
	}

	// 글쓰기 처리
	@ResponseBody
	@RequestMapping(value = "/customercenter/faq", method = RequestMethod.POST)
	public Map<String, Object> writeActionFAQ(HttpServletRequest req, HttpSession session) {
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

		int result = service.writeFAQ(req,map);

		if (result <= 0) {
			map.put("result", "fail");
			map.put("errorMsg", "sqlError");
		} else {
			map.put("result", "success");
		}
		return map;
	}

	// 글수정 폼
	@RequestMapping(value = "/customercenter/faq/{faq_srl}/edit", method = RequestMethod.GET)
	public String modifyFormFAQ(@PathVariable Integer faq_srl) {
		return "customercenter/faq/customercenter_faq_modify";
	}

	// 글수정 처리
	@ResponseBody
	@RequestMapping(value = "/customercenter/faq/{faq_srl}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public Map<String, Object> modifyActionFAQ(@PathVariable Integer faq_srl,HttpServletRequest req,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (!((MemberVO) session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			map.put("result", "fail");
			map.put("errorMsg", "isNotAdmin");
			return map;
		}
		
		int result = service.modifyFAQ(faq_srl,req);

		if (result <= 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	// 해당 글 삭제
	@ResponseBody
	@RequestMapping(value = "/customercenter/faq/{faq_srl}", method = RequestMethod.DELETE)
	public Map<String, Object> deleteFAQ(HttpServletRequest req, HttpSession session, Model model, @PathVariable Integer faq_srl) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (!((MemberVO) session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			map.put("result", "fail");
			map.put("errorMsg", "isNotAdmin");
			return map;
		}
		
		int result = service.deleteFAQ(faq_srl);

		if (result <= 0) {
			map.put("result", "fail");
			map.put("errorMsg", "sqlError");
		} else {
			map.put("result", "success");
		}

		return map;
	}
}
