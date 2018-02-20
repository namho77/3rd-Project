package com.cafe24.ourplanners.board.persistence;

import java.util.ArrayList;
import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;

public interface BoardDAO {

	public void write(BoardVO vo) throws Exception;

	public BoardVO view(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> list() throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

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
