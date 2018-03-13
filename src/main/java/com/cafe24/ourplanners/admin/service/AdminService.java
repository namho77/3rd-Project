package com.cafe24.ourplanners.admin.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.util.SearchMemberCriteria;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;


public interface AdminService {

	public void getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map);

	public int deleteMember(String user_id);
	
	public int deleteBoard(Integer board_srl);
	
	
	
}
