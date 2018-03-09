package com.cafe24.ourplanners.message.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.message.domain.MessageVO;
import com.cafe24.ourplanners.util.SearchMessageCriteria;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.kosmo.mapper.MessageMapper";

	@Override
	public List<MessageVO> getMessageListJson(SearchMessageCriteria scri){
		return sqlSession.selectList(namespace +".getMessageListJson", scri);
	}
	@Override
	public int getTotalCount(SearchMessageCriteria scri) {
		return sqlSession.selectOne(namespace+".getTotalCount",scri);
	}
	@Override
	public int deleteMessage(int messagae_srl) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + ".deleteMessage", messagae_srl);
	}
	@Override
	public int writeMessage(MessageVO vo) {
		
		return sqlSession.insert(namespace +".writeMessage",vo);
	}
	@Override
	public MessageVO readMessage(Integer message_srl) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".readMessage", message_srl);
	}
}
