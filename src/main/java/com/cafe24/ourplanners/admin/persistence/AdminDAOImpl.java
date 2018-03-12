package com.cafe24.ourplanners.admin.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.util.SearchMemberCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.kosmo.mapper.AdminMapper";
	@Override
	public List<MemberVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map) {
		
		return sqlSession.selectList(namespace+".getSearchMemberList", scri);
	}
	
	@Override
	public int getTotalMemberCount(SearchMemberCriteria scri) {
		return sqlSession.selectOne(namespace+".getTotalMemberCount", scri);
	}

	@Override
	public int deleteMember(String user_id) {
		
		return sqlSession.delete(namespace+".deleteMember", user_id);
	}
	


}
