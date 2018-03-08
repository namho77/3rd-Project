package com.cafe24.ourplanners.mypage.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.board.domain.BoardVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosmo.mapper.MyPageMapper";
	
	@Override
	public List<BoardVO> listPage(int start, int end) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String ,Object>();
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		return sqlSession.selectList(namespace + ".listPage", paramMap);	
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTotalCount");
	}
}








































