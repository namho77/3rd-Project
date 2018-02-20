package com.cafe24.ourplanners.announcementboard.persistence;

import java.util.ArrayList;

import com.cafe24.ourplanners.announcementboard.dto.ABoardDTO;

public interface ABoardDAO {

	public ArrayList<ABoardDTO> listPage(int start, int end);
	
	public int getTotalCount();
}
