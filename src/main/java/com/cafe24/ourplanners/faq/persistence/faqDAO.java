package com.cafe24.ourplanners.faq.persistence;

import java.util.ArrayList;

import com.cafe24.ourplanners.faq.dto.faqDTO;

public interface faqDAO {

	public ArrayList<faqDTO> listPage(int start, int end);
	
	public int getTotalCount();
	
	public faqDTO view(String srl);
	
	public int delete(String srl);
	
	public int write(String title, String contents);
	
	public int modify(String title, String contents, String srl);
}
