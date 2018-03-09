package com.cafe24.ourplanners.comment.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.comment.domain.CommentVO;
import com.cafe24.ourplanners.comment.persistence.CommentDAO;
import com.cafe24.ourplanners.util.CommentCriteria;
import com.cafe24.ourplanners.util.PagingUtil;

@Service
public class CommentServiceImpl implements CommentService{

	@Inject
	private CommentDAO dao;
	
	@Override
	public void getCommentListJson(CommentCriteria scri, HashMap<String, Object> map) {
		List<CommentVO> lists = new ArrayList<CommentVO>();
		lists = dao.getCommentListJson(scri);
		
/*		
		for(CommentVO list:lists) {
			
			//싱글 쿼테이션 더블 쿼테이션 변경
			list.setContents(list.getContents().replaceAll("'", "\"").replaceAll("’", "\"").replaceAll("‘", "\"").replaceAll("\"", "\""));
			//줄바꿈 처리
			//list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
			list.setContents(list.getContents().replaceAll(System.getProperty("line.separator"), "<br/>"));
		}
	*/
		
		int totalRecordCount = dao.getTotalCount(scri);
		String pagingDiv = PagingUtil.pagingAjaxComment(totalRecordCount, scri, "commentPaging");
		
		map.put("commentLists", lists);
		map.put("pagingDiv", pagingDiv);
	}
}
