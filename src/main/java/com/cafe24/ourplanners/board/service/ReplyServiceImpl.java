package com.cafe24.ourplanners.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.ReplyVO;
import com.cafe24.ourplanners.board.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> replyList(Integer parent_board_srl) {
		return dao.replyList(parent_board_srl);
	}
}
