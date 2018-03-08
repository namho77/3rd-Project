package com.cafe24.ourplanners.mypage.service;

import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;

public interface MyPageService {
	
	public List<BoardVO> listPage(int start, int end) throws Exception;
	
	public int getTotalCount() throws Exception;

}
