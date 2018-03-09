package com.cafe24.ourplanners.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.SubCategoryVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.notice.domain.NoticeVO;
import com.cafe24.ourplanners.search.persistence.SearchDAO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.PagingUtil;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;
import com.cafe24.ourplanners.util.wordcloud.KoreanWords;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO dao;

	@Override
	public void getHotServiceList(Criteria cri, HashMap<String, Object> map) {
		List<BoardVO> list = new ArrayList<BoardVO>();

		list = dao.getHotServiceList(cri);
		map.put("list", list);

	}

	@Override
	public void getHotKeyWordList(Criteria cri, HashMap<String, Object> map) {
		List<WordCloudVO> list = new ArrayList<WordCloudVO>();

		list = dao.getHotKeyWordList(cri);
		map.put("list", list);

	}

	@Override
	public void getSubCategoryListSearch(SubCategoryVO vo, HashMap<String, Object> map) {
		List<SubCategoryVO> list = new ArrayList<SubCategoryVO>();

		list = dao.getSubCategoryListSearch(vo);
		map.put("subCategoryList", list);

	}

	// 서비스 검색시 리스트 가져오기
	@Override
	public void getServiceListSearch(SearchServiceBoardCriteria scri, HashMap<String, Object> map) {
		List<BoardVO> list = new ArrayList<BoardVO>();

		list = dao.getServiceListSearch(scri);

		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();

		int affected = 0;
		if (searchType != null && searchType.length() != 0 && keyword != null && keyword.length() != 0) {
			List<SearchServiceBoardCriteria> scriLists = new ArrayList<SearchServiceBoardCriteria>();

			scriLists = KoreanWords.getNounWords(scri);

			for (SearchServiceBoardCriteria scriList : scriLists) {
				affected = dao.insertWordCloud(scriList);
			}
		}

		// affected = dao.insertWordCloud(scri);
		// todo 공백을 기준으로 형태소 분석해서 명사만 등록하기

		map.put("searchList", list);
		
		int totalRecordCount = dao.getTotalServiceCount(scri);
		String pagingDiv = PagingUtil.pagingAjaxService(totalRecordCount, scri, "servicePaging");
		
		map.put("pagingDiv", pagingDiv);
		
	}
}
