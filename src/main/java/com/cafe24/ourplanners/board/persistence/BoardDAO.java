package com.cafe24.ourplanners.board.persistence;

import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;


public interface BoardDAO {

	//public List<BoardVO> list() throws Exception;
	
	public List<BoardVO> listPage(int start, int end) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public BoardVO view (Integer boardSrl) throws Exception;
	
	public void visitCount(Integer boardSrl) throws Exception;
	
	public int write(BoardDTO dto) throws Exception;
	
	public BoardVO modify(Integer board_srl) throws Exception;
	
	public int modifyAction(BoardDTO dto) throws Exception;
	
	public int delete(Integer board_srl) throws Exception;
	
	
	
	public BoardVO read(Integer boardSrl) throws Exception;

	
	
	public int countPaging(Criteria cri) throws Exception;
	
	
	
	
	

	public void update(BoardVO vo) throws Exception;

	

	

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	

	// use for dynamic sql

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer bno, int amount) throws Exception;

	public void updateViewCnt(Integer bno) throws Exception;

	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer bno) throws Exception;

	public void deleteAttach(Integer bno) throws Exception;

	public void replaceAttach(String fullName, Integer bno) throws Exception;

}
