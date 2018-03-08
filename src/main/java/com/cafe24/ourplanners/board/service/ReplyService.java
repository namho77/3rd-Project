package com.cafe24.ourplanners.board.service;

import java.util.List;

import com.cafe24.ourplanners.board.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> replyList(Integer parent_board_srl);
}
