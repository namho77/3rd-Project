package com.cafe24.ourplanners.search.persistence;

import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.SubCategoryVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;

public interface SearchDAO {

	public List<BoardVO> getHotServiceList(Criteria cri);

	public List<WordCloudVO> getHotKeyWordList(Criteria cri);

	public List<SubCategoryVO> getSubCategoryListSearch(SubCategoryVO vo);

	public List<BoardVO> getServiceListSearch(SearchCriteria scri);
}
