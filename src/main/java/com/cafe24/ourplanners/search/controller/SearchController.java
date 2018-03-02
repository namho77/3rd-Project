package com.cafe24.ourplanners.search.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SearchController {
	
	@RequestMapping(value="/board/search", method = RequestMethod.GET)
	public String searchBoard(Model model,HttpServletRequest req, HttpSession session,RedirectAttributes rediAttr) {
	
		//http://localhost:8080/ourplanners/board/search?board_type=E&keyword=ㄱㄱ
		return "board/search/board_search_list";
	}
	
}
