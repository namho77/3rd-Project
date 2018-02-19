package com.cafe24.ourplanners.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.search.persistence.SearchDAO;
import com.cafe24.ourplanners.util.Criteria;

@Service
public class SearchServiceImpl implements SearchService{

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
}
