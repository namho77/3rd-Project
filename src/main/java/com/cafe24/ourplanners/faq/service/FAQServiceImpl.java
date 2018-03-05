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
import com.cafe24.ourplanners.notice.dto.ABoardDTO;
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
			list.setContents(list.getContents().replaceAll("\r\n", "<br/>"));
		}
		int pageSize = scri.getPageSize();
		int blockPage = scri.getBlockPage();
		int nowPage = scri.getNowPage();
		
		int totalRecordCount = dao.getTotalCount();
		String pagingDiv = PagingUtil.pagingAjax2(totalRecordCount, pageSize, blockPage, nowPage, "faqPaging");
		
		map.put("faqLists", lists);
		map.put("pagingDiv", pagingDiv);
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
