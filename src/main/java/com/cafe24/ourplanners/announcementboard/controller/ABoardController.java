package com.cafe24.ourplanners.announcementboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.ourplanners.announcementboard.dto.ABoardDTO;
import com.cafe24.ourplanners.announcementboard.persistence.ABoardDAO;
import com.cafe24.ourplanners.board.service.BoardService;
import com.cafe24.ourplanners.util.PagingUtil;

@Controller
@RequestMapping("/board/*")
public class ABoardController {

	 @Autowired
	 private SqlSession sqlSession;


	//공지사항 게시판
	@RequestMapping(value="announcementBoard", method = RequestMethod.POST)
	public String announcementBoard(Model model, HttpServletRequest req) {
		
		int pageSize = 3;
		int blockPage = 2;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		int nowPage = req.getParameter("nowPage")==null ? 1:Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);
		
		int totalRecordCount = dao.getTotalCount();
		
		ArrayList<ABoardDTO> lists = dao.listPage(start, end);
		
		for(ABoardDTO list:lists) {
			list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
		}
		
		String pagingDiv = PagingUtil.pagingAjax(totalRecordCount, pageSize, blockPage, nowPage, "");
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingDiv", pagingDiv);
		model.addAttribute("lists", lists);
		
		return "customercenter/notice/customercenter_notice_list";
	}
}
