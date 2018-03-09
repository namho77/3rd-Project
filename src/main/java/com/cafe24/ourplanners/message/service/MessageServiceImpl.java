package com.cafe24.ourplanners.message.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.ourplanners.message.domain.MessageVO;
import com.cafe24.ourplanners.message.persistence.MessageDAO;
import com.cafe24.ourplanners.util.PagingUtil;
import com.cafe24.ourplanners.util.SearchMessageCriteria;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO dao;
	
	@Override
	public void getMessageListJson(SearchMessageCriteria scri,HashMap<String, Object> map) {
		List<MessageVO> lists=new ArrayList<MessageVO>();
		lists = dao.getMessageListJson(scri);
		
		for(MessageVO list:lists) {
			//싱글 쿼테이션 더블 쿼테이션 변경
			list.setContents(list.getContents().replaceAll("'", "\"").replaceAll("’", "\"").replaceAll("‘", "\"").replaceAll("\"", "\""));
			//줄바꿈 처리
			//list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
			list.setContents(list.getContents().replaceAll(System.getProperty("line.separator"), "<br/>"));
		}
		int totalRecordCount = dao.getTotalCount(scri);
		String pagingDiv = PagingUtil.pagingAjaxMessage(totalRecordCount,scri,"messagePading");
		
		map.put("messageLIsts",lists);
		map.put("pagingDiv", pagingDiv);
		
		
	}

	@Override
	public int deleteMessage(int message_srl) {
		// TODO Auto-generated method stub
		return dao.deleteMessage(message_srl);
	}

	@Override
	public int writeMessage(HttpServletRequest req, Map<String, Object> map) {
		int message_srl =Integer.parseInt(req.getParameter("message_srl"));
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		MessageVO vo = new MessageVO();
		vo.setContents(contents);
		vo.setMessage_srl(message_srl);
		vo.setTitle(title);
		
		
		return dao.writeMessage(vo);
	}

	@Override
	public void readMessage(Integer message_srl, Model model) {
		MessageVO vo = new MessageVO();
		vo = dao.readMessage(message_srl);
		//싱글 쿼테이션 더블 쿼테이션 변경
				vo.setContents(vo.getContents().replaceAll("'", "\"").replaceAll("’", "\"").replaceAll("‘", "\"").replaceAll("\"", "\""));
				//줄바꿈 처리
				//vo.setContents(vo.getContents().replaceAll("\r\n", "<br/>"));
				vo.setContents(vo.getContents().replaceAll(System.getProperty("line.separator"), "<br/>"));
				model.addAttribute("messageVO", vo);
		
	}
}
