package com.cafe24.ourplanners.board.persistence;

import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;


public interface BoardDAO {

	public List<BoardVO> getBoardListJson(SearchServiceBoardCriteria scri);
	
	public int getTotalCount(SearchServiceBoardCriteria scri);
	
	public List<BoardVO> listPage(int start, int end) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public BoardVO view (Integer boardSrl) throws Exception;
	
	public void visitCount(Integer boardSrl) throws Exception;
	
	public int write(BoardDTO dto) throws Exception;
	
	public BoardVO modify(Integer board_srl) throws Exception;
	
	public int modifyAction(BoardDTO dto) throws Exception;
	
	public int delete(Integer board_srl) throws Exception;
	
	
	
	

}
