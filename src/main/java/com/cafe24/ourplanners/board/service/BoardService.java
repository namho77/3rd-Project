package com.cafe24.ourplanners.board.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;



public interface BoardService {
	  
	public void getBoardListJson(SearchServiceBoardCriteria scri, HashMap<String, Object> map);
	
	public List<BoardVO> listPage(int start, int end) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public BoardVO view(Integer boardSrl) throws Exception;
	
	public void visitCount(Integer boardSrl) throws Exception;
	
	public int write(HttpServletRequest req) throws Exception;
	
	public void modify(Integer board_srl, Model model) throws Exception;
	
	public int modifyAction(HttpServletRequest req) throws Exception;
	
	public int delete(Integer board_srl) throws Exception;
	
 	 
}
