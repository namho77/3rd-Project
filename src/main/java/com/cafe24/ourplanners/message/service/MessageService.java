package com.cafe24.ourplanners.message.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.util.SearchMessageCriteria;

public interface MessageService {
	void getMessageListJson(SearchMessageCriteria scri,HashMap<String, Object> map);
	
	int deleteMessage(int message_srl);
	int writeMessage(HttpServletRequest req,Map<String, Object> map);
	
	void readMessage(Integer message_srl,Model model);
	
	
}
