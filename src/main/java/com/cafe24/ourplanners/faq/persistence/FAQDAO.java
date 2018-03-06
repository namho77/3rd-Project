package com.cafe24.ourplanners.faq.persistence;

import java.util.List;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

public interface FAQDAO {

	public List<FAQVO> getFAQListJson(SearchFAQCriteria scri);
	
	public int getTotalCount(SearchFAQCriteria scri);
	
	public int deleteFAQ(int faq_srl);
	
	public int modifyFAQ(FAQVO vo);

	public int writeFAQ(FAQVO vo);

	public FAQVO readFAQ(Integer faq_srl);

	

}
