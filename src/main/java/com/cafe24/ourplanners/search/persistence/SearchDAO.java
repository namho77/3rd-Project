package com.cafe24.ourplanners.search.persistence;

import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.SubCategoryVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;

public interface SearchDAO {

	public List<BoardVO> getHotServiceList(Criteria cri);

	public List<WordCloudVO> getHotKeyWordList(Criteria cri);

	public List<SubCategoryVO> getSubCategoryListSearch(SubCategoryVO vo);

	public List<BoardVO> getServiceListSearch(SearchServiceBoardCriteria scri);

	public int insertWordCloud(SearchServiceBoardCriteria scri);

	public int getTotalServiceCount(SearchServiceBoardCriteria scri);

	public int writeBoard(BoardVO vo);

	public int modifyBoard(BoardVO vo);
	
	public BoardVO readBoard(Integer board_srl);

	public int deleteBoard(Integer board_srl);

	public void visitCount(Integer boardSrl);

}
