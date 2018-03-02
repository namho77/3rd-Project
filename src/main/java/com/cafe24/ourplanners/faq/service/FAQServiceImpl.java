package com.cafe24.ourplanners.faq.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.faq.persistence.FAQDAO;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

@Service
public class FAQServiceImpl implements FAQService {

	@Inject
	private FAQDAO dao;


	@Override
	public void getFAQListJson(SearchFAQCriteria scri, HashMap<String, Object> map) {

		List<FAQVO> list = new ArrayList<FAQVO>();
		list = dao.getFAQListJson(scri);
		map.put("faqList", list);
	}

	@Override
	public int writeFAQ(HttpServletRequest req, Map<String, Object> map) {
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		return dao.writeFAQ(title, contents);
	}
	

	@Override
	public int deleteFAQ(int faq_srl) {
		// TODO Auto-generated method stub
		return dao.deleteFAQ(faq_srl);
	}



	@Override
	public int modifyFAQ(int faq_srl, HttpServletRequest req) {
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		return dao.modifyFAQ(title,contents,faq_srl);
	}
	
}
