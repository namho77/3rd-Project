package com.cafe24.ourplanners.member.persistence;

import java.util.HashMap;
import java.util.Map;

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
		
		//System.out.println("맵퍼호출"+namespace+".hasId" + userId);
		int hasId = sqlSession.selectOne(namespace+".hasId", userId);
		return hasId;
	}
	
	@Override
	public LoginDTO login(String id, String pass) {
		// TODO Auto-generated method stub
		return null;
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

		 paramMap.put("is_regist", "Y");
		 
		    paramMap.put("user_id", user_id);
		    paramMap.put("password", password);
		    
		    paramMap.put("auth_key", auth_key);
		
		int affected = sqlSession.selectOne(namespace+".updateIsRegister", paramMap);
		
		return affected;
	}

}
