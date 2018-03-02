package com.cafe24.ourplanners.faq.persistence;

import java.util.List;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

public interface FAQDAO {

	public List<FAQVO> getFAQListJson(SearchFAQCriteria scri);
	
	public int getTotalCount();
	
	public int deleteFAQ(int faq_srl);
	
	public int modifyFAQ(String title, String contents, int faq_srl);

	public int writeFAQ(String title, String contents);

	

}
