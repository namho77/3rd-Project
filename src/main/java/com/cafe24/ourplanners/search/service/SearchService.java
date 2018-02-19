package com.cafe24.ourplanners.search.service;

import java.util.HashMap;

import com.cafe24.ourplanners.util.Criteria;

public interface SearchService {

	public void getHotServiceList(Criteria cri, HashMap<String, Object> map);

	public void getHotKeyWordList(Criteria cri, HashMap<String, Object> map);	
}
