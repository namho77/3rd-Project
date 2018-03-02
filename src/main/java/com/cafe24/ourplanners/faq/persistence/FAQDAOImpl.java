package com.cafe24.ourplanners.faq.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.faq.domain.FAQVO;
import com.cafe24.ourplanners.util.SearchFAQCriteria;

@Repository
public class FAQDAOImpl implements FAQDAO{
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.kosmo.mapper.FAQMapper";
	@Override
	public List<FAQVO> getFAQListJson(SearchFAQCriteria scri) {
		
		return sqlSession.selectList(namespace + ".getFAQListJson", scri);
	}
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteFAQ(int faq_srl) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + ".deleteFAQ", faq_srl);
	}
	@Override
	public int modifyFAQ(String title, String contents, int faq_srl) {
		
		Map<String,Object> paramMap = new HashMap<String , Object>();
		paramMap.put("title", title);
		paramMap.put("contents", contents);
		paramMap.put("faq_srl", faq_srl);
		return sqlSession.delete(namespace + ".modifyFAQ", paramMap);
		
	}
	@Override
	public int writeFAQ(String title, String contents) {
		Map<String,Object> paramMap = new HashMap<String , Object>();
		paramMap.put("title", title);
		paramMap.put("contents", contents);
		return sqlSession.insert(namespace + ".writeFAQ", paramMap);
	}
	
	
}
