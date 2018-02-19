package com.cafe24.ourplanners.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.persistence.BoardDAO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	  
	@Override
	public void write(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO read(Integer boardSrl) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Integer boardSrl) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		dao.listAll();
		return null;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> getAttach(Integer boardSrl) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



}
