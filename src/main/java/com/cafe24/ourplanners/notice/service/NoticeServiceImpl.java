package com.cafe24.ourplanners.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.ourplanners.notice.domain.NoticeVO;
import com.cafe24.ourplanners.notice.persistence.NoticeDAO;
import com.cafe24.ourplanners.util.PagingUtil;
import com.cafe24.ourplanners.util.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject 
	private NoticeDAO dao;
	
	@Override
	public void getNoticeListJson(SearchCriteria scri, HashMap<String, Object> map) {

		List<NoticeVO> lists = new ArrayList<NoticeVO>();
		lists = dao.getNoticeListJson(scri);
		
		for(NoticeVO list:lists) {
			list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
		}
	
		
		int totalRecordCount = dao.getTotalCount();
		String pagingDiv = PagingUtil.pagingAjaxBySearchCriteria(totalRecordCount, scri, "noticePaging");
		
		map.put("noticeLists", lists);
		map.put("pagingDiv", pagingDiv);
	}

	@Override
	public int writeNotice(HttpServletRequest req, Map<String, Object> map) {
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setContents(contents);		
		return dao.writeNotice(vo);
	}
	

	@Override
	public int deleteNotice(int notice_srl) {
		return dao.deleteNotice(notice_srl);
	}

	@Override
	public int modifyNotice(NoticeVO vo) {
		
		return dao.modifyNotice(vo);
	}

	@Override
	public void readNotice(Integer notice_srl, Model model) {
		// TODO Auto-generated method stub
		NoticeVO vo = new NoticeVO();
		vo = dao.readNotice(notice_srl);
		vo.setContents(vo.getContents().replaceAll("\r\n", "<br/>"));
		model.addAttribute("noticeVO", vo);
	}
}
