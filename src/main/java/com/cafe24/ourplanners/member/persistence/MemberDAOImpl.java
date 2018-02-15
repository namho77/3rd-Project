package com.cafe24.ourplanners.member.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.member.domain.MemberAuthMailVO;
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
		int affected = sqlSession.insert(namespace + ".insert", vo);		

		return affected;
	}

	
	@Override
	public int hasId(String userId) {
		
		//System.out.println("맵퍼호출"+namespace+".hasId" + userId);
		int hasId = sqlSession.selectOne(namespace+".hasId", userId);
		return hasId;
	}
	
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login", dto);
	}


	@Override
	public int isValidAuthKey(String user_id, String password, String auth_key) {
		
		 Map<String, Object> paramMap = new HashMap<String, Object>();

		    paramMap.put("user_id", user_id);
		    paramMap.put("password", password);
		    
		    paramMap.put("auth_key", auth_key);
		    
		int isValidKey = sqlSession.selectOne(namespace+".isValidAuthKey", paramMap);

		return isValidKey;
	}


	@Override
	public int updateIsRegister(String is_register, String auth_key, String user_id, String password) {
		 Map<String, Object> paramMap = new HashMap<String, Object>();

		 paramMap.put("is_register", is_register);
		 
		    paramMap.put("user_id", user_id);
		    paramMap.put("password", password);
		    
		    paramMap.put("auth_key", auth_key);
		
		int affected = sqlSession.update(namespace+".updateIsRegister", paramMap);
		
		return affected;
	}


	@Override
	public int mergeAuthKey(MemberAuthMailVO vo) {
		int affected = sqlSession.update(namespace+".mergeAuthKey", vo);
		return affected;
	}


	@Override
	public String getSaltById(String user_id) {
		
		//MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		//return dao.getSaltById(user_id);
		
		return sqlSession.selectOne(namespace+".getSaltById", user_id);
		
		
	}


	@Override
	public int confirmIdPassword(LoginDTO dto) {
		

		//MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		//return dao.confirmIdPassword(dto);
		
		System.out.println("아이디 : " + dto.getUser_id());
		System.out.println("비번 : " + dto.getPassword());
		return sqlSession.selectOne(namespace+".confirmIdPassword", dto);
		
	}

}
