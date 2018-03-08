package com.cafe24.ourplanners.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.persistence.BoardDAO;
import com.cafe24.ourplanners.mypage.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Inject
	private MyPageDAO dao;
	
	@Override
	public List<BoardVO> listPage(int start, int end) throws Exception {
		return dao.listPage(start, end);
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return dao.getTotalCount();
	}
}
