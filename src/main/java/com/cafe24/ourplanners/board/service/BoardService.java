package com.cafe24.ourplanners.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;



public interface BoardService {
	  
	//public List<BoardVO> list() throws Exception;
	
	public List<BoardVO> listPage(int start, int end) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public BoardVO view(Integer boardSrl) throws Exception;
	
	public void visitCount(Integer boardSrl) throws Exception;
	
	public int write(HttpServletRequest req) throws Exception;
	
	public void modify(Integer board_srl, Model model) throws Exception;
	
	public int modifyAction(HttpServletRequest req) throws Exception;
	
	public int delete(Integer board_srl) throws Exception;
	
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	
	
	public BoardVO read(Integer boardSrl) throws Exception;
	
	  

	  public void remove(Integer boardSrl) throws Exception;
	  

	  public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	  

	  public List<BoardVO> listSearchCriteria(SearchCriteria cri) 
	      throws Exception;

	  public int listSearchCount(SearchCriteria cri) throws Exception;
	  
	  public List<String> getAttach(Integer boardSrl)throws Exception;
 	 
}
