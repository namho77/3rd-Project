package com.cafe24.ourplanners.message.persistence;

import java.util.List;

import com.cafe24.ourplanners.message.domain.MessageVO;
import com.cafe24.ourplanners.util.SearchMessageCriteria;

public interface MessageDAO {

	public List<MessageVO> getMessageListJson(SearchMessageCriteria scri);


	public int getTotalCount(SearchMessageCriteria scri);
	
	public int deleteMessage(int message_srl);
	
	public int writeMessage(MessageVO vo);
	
	public MessageVO readMessage(Integer message_srl);

}
