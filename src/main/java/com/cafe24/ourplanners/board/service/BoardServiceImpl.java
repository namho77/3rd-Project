package com.cafe24.ourplanners.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.board.persistence.BoardDAO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;


@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	  
	/*@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}*/
	
	@Override
	public List<BoardVO> listPage(int start, int end) throws Exception {
		return dao.listPage(start, end);
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return dao.getTotalCount();
	}
	
	@Override
	public BoardDTO view(Integer boardSrl) throws Exception {
		return dao.view(boardSrl);
	}
	

	
	@Override
	public void write(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
	@Override
	public BoardVO read(Integer boardSrl) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(boardSrl);
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
