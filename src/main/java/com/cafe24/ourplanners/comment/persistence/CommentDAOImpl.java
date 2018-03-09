package com.cafe24.ourplanners.comment.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.comment.domain.CommentVO;
import com.cafe24.ourplanners.util.CommentCriteria;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosmo.mapper.CommentMapper";
	
	@Override
	public List<CommentVO> getCommentListJson(CommentCriteria scri) {
		return sqlSession.selectList(namespace + ".getCommentListJson", scri);
	}
	
	@Override
	public int getTotalCount(CommentCriteria scri) {
		return sqlSession.selectOne(namespace+".getTotalCount",scri);
	}
}
