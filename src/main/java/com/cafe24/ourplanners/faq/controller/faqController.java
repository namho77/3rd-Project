package com.cafe24.ourplanners.faq.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.notice.dto.ABoardDTO;
import com.cafe24.ourplanners.notice.persistence.ABoardDAO;
import com.cafe24.ourplanners.util.PagingUtil;

@Controller
public class faqController {

	@Autowired SqlSession sqlSession;

	//faq게시판 리스트
	@RequestMapping("/faq/list")
	public String list() {
		return "customercenter/notice/customercenter_faq_list";
	}

	//faq게시판 리스트 가져오기
	@RequestMapping("/faq/list.do")
	public String list(Model model, HttpServletRequest req) throws IOException{
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

		return "customercenter/notice/customercenter_faq_largelist";
	}

	//faq뷰
	@RequestMapping("/notice/ViewRow")
	public String viewRow(Model model, HttpServletRequest req) {
		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);
		ABoardDTO dto = dao.view(req.getParameter("srl"));

		model.addAttribute("view", dto);

		return "customercenter/notice/customercenter_notice_view";
	}

	//faq 삭제하기
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

	//faq 글쓰기
	@RequestMapping("/notice/writeRow")	
	public String writeRow(){						
		return "customercenter/notice/customercenter_notice_write";
	}

	//faq 글쓰기 처리하기
	@RequestMapping("/notice/writeRowAction")
	@ResponseBody
	public Map<String, Object> writeRowAction(HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		if(session.getAttribute("loginUserInfo")==null && !((MemberVO)session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			map.put("writeCode", 2);
			return map;
		}

		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);

		int result = dao.write(req.getParameter("title"), req.getParameter("contents"));

		if(result<=0) {
			map.put("writeCode", 0);
		}
		else {
			map.put("writeCode", 1);
		}		
		return map;
	}

	//faq 수정하기
	@RequestMapping("/notice/modifyRow")
	public String modifyRow(Model model, HttpServletRequest req, HttpServletResponse resp){					

		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);
		ABoardDTO dto = dao.view(req.getParameter("srl"));

		model.addAttribute("modify", dto);

		return "customercenter/notice/customercenter_notice_modify";
	}

	//faq 수정처리하기
	@RequestMapping("/notice/modifyRowAction")
	@ResponseBody
	public Map<String, Object> modifyAction(HttpServletRequest req, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();

		if(session.getAttribute("loginUserInfo")==null && !((MemberVO)session.getAttribute("loginUserInfo")).getIs_admin().equalsIgnoreCase("Y")) {
			map.put("modifyCode", 2);
			return map;
		}

		ABoardDAO dao = sqlSession.getMapper(ABoardDAO.class);

		int result = dao.modify(req.getParameter("title"), req.getParameter("contents"), req.getParameter("srl"));
		System.out.println("result:"+result);
		if(result<=0) {
			map.put("modifyCode", 0);
		}
		else {
			map.put("modifyCode", 1);
		}		
		return map;
	}
}
