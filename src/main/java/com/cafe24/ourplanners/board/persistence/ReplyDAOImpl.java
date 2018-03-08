package com.cafe24.ourplanners.board.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosmo.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> replyList(Integer parent_board_srl) {
		return sqlSession.selectList(namespace + ".replyList", parent_board_srl);
	}
}
