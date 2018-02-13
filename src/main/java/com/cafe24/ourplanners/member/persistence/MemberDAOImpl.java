package com.cafe24.ourplanners.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.kosmo.mapper.MemberMapper";
	@Override
	public int registMemberNotNullCol(MemberVO vo) {
		
		
		//session.selectList
		//session.update
		//session.delete
		sqlSession.insert(namespace + ".insert", vo);
		
		
		return 0;
	}

	
	@Override
	public int hasId(String userId) {
		sqlSession.selectOne(namespace+".hasId", userId);
		return 0;
	}
	
	@Override
	public LoginDTO login(String id, String pass) {
		// TODO Auto-generated method stub
		return null;
	}

}
