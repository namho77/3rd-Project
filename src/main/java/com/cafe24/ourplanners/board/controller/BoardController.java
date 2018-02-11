package com.cafe24.ourplanners.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.ourplanners.board.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	//목록보기
	@RequestMapping(value = "engineer", method = RequestMethod.GET)
	public String listEngineerBoard(Model model) {
		try {
			service.listAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board/engineer/board_engineer_list";
	}
	//글쓰기
	@RequestMapping(value = "engineer", method = RequestMethod.POST)
	public String writeEngineerBoard(Model model) {
		return "board/engineer/board_engineer_write";
	}
	//글수정
	@RequestMapping(value = "engineer/{boardSrl}", method = RequestMethod.PUT)
	public String modifyEngineerBoard(@PathVariable String boardSrl) {
		return "board/engineer/board_engineer_modify";
	}
	//해당 글 삭제
	@RequestMapping(value = "engineer/{boardSrl}", method = RequestMethod.DELETE)
	public String deleteEngineerBoard(@PathVariable String boardSrl) {
		return "board/engineer/board_engineer_list";
	}
	
	
	//목록보기
	@RequestMapping(value = "client", method = RequestMethod.GET)
	public String listClientBoard(Model model) {
		return "board/client/board_client_list";
	}
	//글쓰기
	@RequestMapping(value = "client", method = RequestMethod.POST)
	public String writeClientBoard(Model model) {
		return "board/client/board_client_write";
	}
	//글수정
	@RequestMapping(value = "client/{boardSrl}", method = RequestMethod.PUT)
	public String modifyClientBoard(@PathVariable String boardSrl) {
		return "board/client/board_client_modify";
	}
	//해당 글 삭제
	@RequestMapping(value = "client/{boardSrl}", method = RequestMethod.DELETE)
	public String deleteClientBoard(@PathVariable String boardSrl) {
		return "board/client/board_client_list";
	}
	
}
