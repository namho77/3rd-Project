package com.cafe24.ourplanners.board.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public BoardVO view(Integer boardSrl) throws Exception {
		return dao.view(boardSrl);
	}
	
	@Override
	public int write(HttpServletRequest req, Model model) throws Exception {
		
		
	    String user_id = req.getParameter("user_id");
	    String title = req.getParameter("title");
	    String contents = req.getParameter("contents");
	    String location = req.getParameter("location");
		
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		
		String strService_time_start = req.getParameter("service_time_start");
		utilDate = fm.parse(strService_time_start);
		java.sql.Date sqlService_time_start = new java.sql.Date(utilDate.getTime());
		
		
		String strService_time_end = req.getParameter("service_time_end");
		utilDate = fm.parse(strService_time_end);
		java.sql.Date sqlService_time_end = new java.sql.Date(utilDate.getTime());
		
		int contact_time_start = Integer.parseInt(req.getParameter("contact_time_start"));
		int contact_time_end = Integer.parseInt(req.getParameter("contact_time_end"));
		int category_srl = Integer.parseInt(req.getParameter("category_srl"));
		int subcategory_srl = Integer.parseInt(req.getParameter("subcategory_srl"));
		int service_cost = Integer.parseInt(req.getParameter("service_cost"));
		String board_type = req.getParameter("board_type");
		
		BoardDTO dto = new BoardDTO(user_id, title, contents, location, sqlService_time_start,
				sqlService_time_end, contact_time_start, contact_time_end, category_srl, subcategory_srl, 
				service_cost, board_type);
	    
		return dao.write(dto);
		
		
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
