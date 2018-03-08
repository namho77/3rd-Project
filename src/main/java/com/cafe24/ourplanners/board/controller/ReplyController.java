package com.cafe24.ourplanners.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ourplanners.board.domain.ReplyVO;
import com.cafe24.ourplanners.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "/reply/list/{board_srl}", method = RequestMethod.GET)
	public String engineerReplyList(@PathVariable Integer board_srl, HttpServletRequest req, Model model){
		
		List<ReplyVO> reply = service.replyList(board_srl);
		
		model.addAttribute("reply", reply);		
		
		return "board/engineer/board_engineer_list";
	}
}
