package com.cafe24.ourplanners.faq.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.util.SearchCriteria;
import com.cafe24.ourplanners.util.SearchFAQCriteria;


public interface FAQService {

	void getFAQListJson(SearchFAQCriteria scri, HashMap<String, Object> map);

	int deleteFAQ(int faq_srl);

	int writeFAQ(HttpServletRequest req, Map<String, Object> map);

	void readFAQ(Integer faq_srl, Model model);

	int modifyFAQ(FAQVO vo);
	
}
