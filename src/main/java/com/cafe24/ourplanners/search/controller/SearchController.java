package com.cafe24.ourplanners.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	//메인 검색폼에서 검색시 그외 검색은 searchrestcontroller내에 getServiceListSearch 메소드를 이용하여 ajax처리
	@RequestMapping(value="/board/search", method = RequestMethod.GET)
	public String searchBoard(Model model,HttpServletRequest req, @RequestParam(required = false, defaultValue = "1") Integer nowPage,

			@RequestParam(required = false) Integer category_srl,
			@RequestParam(required = false) Integer subcategory_srl,

			@RequestParam(required = false, defaultValue = "") String board_type,
			@RequestParam(required = false) Integer pageSize, @RequestParam(required = false) Integer blockPage,
			@RequestParam(required = false, defaultValue = "") String searchType,
			@RequestParam(required = false, defaultValue = "") String keyword) { 
		
		//RedirectAttributes rediAttr
		//rediAttr.addFlashAttribute(arg0, arg1)
		//return "redirect:/board/search/board_search_list";
		//http://localhost:8080/ourplanners/board/search?board_type=E&keyword=ㄱㄱ
		//http://localhost:8080/ourplanners/board/json/service_list.json?board_type=E&pageSize=5&blockPage=1&keyword=&searchType=tc
		
		model.addAttribute("board_type",board_type);
		if (category_srl != null)
			model.addAttribute("category_srl",category_srl);
		if (subcategory_srl != null)
			model.addAttribute("subcategory_srl",subcategory_srl);
		if(searchType != null && searchType.length() != 0)
			model.addAttribute("searchType",searchType);
		if(keyword != null && keyword.length() != 0)
			model.addAttribute("keyword",keyword);

		return "board/search/board_search_list";
	}
	
}
