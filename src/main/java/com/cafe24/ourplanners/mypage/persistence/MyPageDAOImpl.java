package com.cafe24.ourplanners.mypage.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.kosmo.mapper.MyPageMapper";
	
	
}
