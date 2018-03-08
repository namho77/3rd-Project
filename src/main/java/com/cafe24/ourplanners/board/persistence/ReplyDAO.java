package com.cafe24.ourplanners.board.persistence;

import java.util.List;

import com.cafe24.ourplanners.board.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replyList(Integer parent_board_srl);
}
