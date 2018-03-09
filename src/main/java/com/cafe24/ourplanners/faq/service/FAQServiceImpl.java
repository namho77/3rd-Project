package com.cafe24.ourplanners.faq.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.faq.persistence.FAQDAO;
import com.cafe24.ourplanners.util.PagingUtil;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

@Service
public class FAQServiceImpl implements FAQService {

	@Inject
	private FAQDAO dao;


	@Override
	public void getFAQListJson(SearchFAQCriteria scri, HashMap<String, Object> map) {

		List<FAQVO> lists = new ArrayList<FAQVO>();
		lists = dao.getFAQListJson(scri);
		
		for(FAQVO list:lists) {
			
			//싱글 쿼테이션 더블 쿼테이션 변경
			list.setContents(list.getContents().replaceAll("'", "\"").replaceAll("’", "\"").replaceAll("‘", "\"").replaceAll("\"", "\""));
			//줄바꿈 처리
			//list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
			//list.setContents(list.getContents().replaceAll(System.getProperty("line.separator"), "<br/>"));
		}
	
		
		int totalRecordCount = dao.getTotalCount(scri);
		String pagingDiv = PagingUtil.pagingAjaxFAQ(totalRecordCount, scri, "faqPaging");
		
		map.put("faqLists", lists);
		map.put("pagingDiv", pagingDiv);
	}

	@Override
	public int writeFAQ(HttpServletRequest req, Map<String, Object> map) {
		int service_srl = Integer.parseInt(req.getParameter("service_srl"));
		int category_srl = Integer.parseInt(req.getParameter("category_srl"));
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		FAQVO vo = new FAQVO();
		vo.setService_srl(service_srl);
		vo.setCategory_srl(category_srl);
		vo.setTitle(title);
		vo.setContents(contents);		
		return dao.writeFAQ(vo);
	}
	

	@Override
	public int deleteFAQ(int faq_srl) {
		return dao.deleteFAQ(faq_srl);
	}



	@Override
	public int modifyFAQ(FAQVO vo) {
		
		return dao.modifyFAQ(vo);
		
	}

	@Override
	public void readFAQ(Integer faq_srl, Model model) {
		// TODO Auto-generated method stub
		FAQVO vo = new FAQVO();
		vo = dao.readFAQ(faq_srl);
		//싱글 쿼테이션 더블 쿼테이션 변경
		vo.setContents(vo.getContents().replaceAll("'", "\"").replaceAll("’", "\"").replaceAll("‘", "\"").replaceAll("\"", "\""));
		//줄바꿈 처리
		//vo.setContents(vo.getContents().replaceAll("\r\n", "<br/>"));
		//vo.setContents(vo.getContents().replaceAll(System.getProperty("line.separator"), "<br/>"));
		model.addAttribute("faqVO", vo);
	}
	
}
