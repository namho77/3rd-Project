package com.cafe24.ourplanners.admin.persistence;

import java.util.HashMap;
import java.util.List;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.util.SearchMemberCriteria;

public interface AdminDAO {

	List<MemberVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map);

	int getTotalMemberCount(SearchMemberCriteria scri);


}
