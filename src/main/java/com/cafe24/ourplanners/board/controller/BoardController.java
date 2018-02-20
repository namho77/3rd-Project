package com.cafe24.ourplanners.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.board.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	//목록보기
	@RequestMapping(value = "engineer", method = RequestMethod.GET)
	public String listEngineerBoard(Model model) {
		List<BoardVO> lists = null;
		try {
			lists = service.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("lists", lists);
		return "board/engineer/board_engineer_list";
	}
	//글읽기
	@ResponseBody
	@RequestMapping(value = "engineer/{boardSrl}", method = RequestMethod.GET)
		public String viewEngineerBoard(@PathVariable String boardSrl,Model model) {
				
			return "board/engineer/board_engineer_view";
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
		try{
			service.list();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "board/client/board_client_list";
	}
	//글쓰기 폼 가져오기
	@RequestMapping(value = "client", method = RequestMethod.POST)
	public String writeClientBoard() {
		return "board/client/board_client_write";
	}
	//글쓰기 처리
	@RequestMapping(value= "clientAction", method = RequestMethod.POST)
	public void writeClientBoardAction(HttpServletRequest req, HttpServletRequest resp, HttpSession session) throws IOException {
		
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
