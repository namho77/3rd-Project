package com.cafe24.ourplanners.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.board.service.BoardService;
import com.cafe24.ourplanners.member.dto.LoginDTO;
import com.cafe24.ourplanners.member.persistence.MemberDAO;
import com.cafe24.ourplanners.notice.dto.ABoardDTO;
import com.cafe24.ourplanners.notice.persistence.ABoardDAO;
import com.cafe24.ourplanners.util.PagingUtil;

@Controller
public class ABoardController {

	 @Autowired
	 private SqlSession sqlSession;


	//공지사항 small게시판
	@RequestMapping("/notice/smallABoard")
	public String smallABoard(Model model, HttpServletRequest req) {
		int pageSize = 1;
		int blockPage = 1;
		
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
		
		/*model.addAttribute("nowPage", nowPage);*/
		model.addAttribute("pagingDiv", pagingDiv);
		model.addAttribute("lists", lists);
		
		return "customercenter/notice/customercenter_notice_smalllist"; 
	}
	 
	//공지사항 게시판
	@RequestMapping("/notice/aBoard")
	public String aBoard() {
		return "customercenter/notice/customercenter_notice_list";
	}
	
	//공지사항 게시판	리스트폼 가져오기
	@RequestMapping("/notice/aBoard.do")
	public String announcementBoard(Model model, HttpServletRequest req, HttpSession session) throws IOException{
		
		/*String master_id = ((LoginDTO)session.getAttribute("loginUserInfo")).getUser_id();*/
		
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
		
		/*model.addAttribute("master_id", master_id);*/
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingDiv", pagingDiv);
		model.addAttribute("lists", lists);
		
		return "customercenter/notice/customercenter_notice_largelist";
	}	
	
	//공지사항뷰
	@RequestMapping("/notice/ViewRow")
	public String viewRow(Model model, HttpServletRequest req) {
		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);
		ABoardDTO dto = dao.view(req.getParameter("srl"));
		
		model.addAttribute("view", dto);
		
		return "customercenter/notice/customercenter_notice_view";
	}
	
	//공지사항 삭제하기
	@RequestMapping("/notice/deleteRow")
	@ResponseBody
	public Map<String, Object> deleteRow(HttpSession session, HttpServletRequest req){
		Map<String, Object> map = new HashMap<String, Object>();
		
		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);
		int result = dao.delete(req.getParameter("srl"));
		
		if(result<=0) {
			map.put("Code", 0);
		}
		else {
			map.put("Code", 1);			
		}
		
		return map;
	}
	
	
	//공지사항 글쓰기
	@RequestMapping("/notice/writeRow")
	public String writeRow() {
		return "customercenter/notice/customercenter_notice_write";
	}
}
