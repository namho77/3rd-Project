package com.cafe24.ourplanners.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.admin.persistence.AdminDAO;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.util.PagingUtil;
import com.cafe24.ourplanners.util.SearchMemberCriteria;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao ;

	@Override
	public void getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map) {
		
		List<MemberVO> lists = new ArrayList<MemberVO>();
		lists = dao.getSearchMemberList(scri,map);

		int totalRecordCount = dao.getTotalMemberCount(scri);
		String pagingDiv = PagingUtil.pagingAjaxMember(totalRecordCount, scri, "memberPaging");
		
		map.put("memberLists", lists);
		map.put("memberPagingDiv", pagingDiv);
		
	}
	
	
}
