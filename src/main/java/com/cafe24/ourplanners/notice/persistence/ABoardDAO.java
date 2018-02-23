package com.cafe24.ourplanners.notice.persistence;

import java.util.ArrayList;

import com.cafe24.ourplanners.notice.dto.ABoardDTO;

public interface ABoardDAO {

	public ArrayList<ABoardDTO> listPage(int start, int end);
	
	public int getTotalCount();
	
	public ABoardDTO view(String srl);
	
	public int delete(String srl);
	
	public int write(String title, String contents);
}
