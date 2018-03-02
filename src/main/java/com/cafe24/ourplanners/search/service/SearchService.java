package com.cafe24.ourplanners.search.service;

import java.util.HashMap;

import com.cafe24.ourplanners.board.domain.SubCategoryVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;

public interface SearchService {

	public void getHotServiceList(Criteria cri, HashMap<String, Object> map);

	public void getHotKeyWordList(Criteria cri, HashMap<String, Object> map);

	public void getSubCategoryListSearch(SubCategoryVO vo, HashMap<String, Object> map);

	public void getServiceListSearch(SearchServiceBoardCriteria scri, HashMap<String, Object> map);	
}
