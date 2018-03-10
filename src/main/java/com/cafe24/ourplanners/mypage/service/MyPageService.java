package com.cafe24.ourplanners.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.board.domain.BoardVO;

public interface MyPageService {
	
	public BoardVO view(Integer boardSrl) throws Exception;
	
	public void visitCount(Integer boardSrl) throws Exception;
	
	public void modify(Integer board_srl, Model model) throws Exception;
	
	public int modifyAction(HttpServletRequest req) throws Exception;

	public int delete(Integer board_srl) throws Exception;
	
	public int getClientListCheck_TotalRecordConut(String user_id) throws Exception;
	
	public int getClientList_TotalRecordConut(String user_id) throws Exception;
	
	public int getEngineerListCheck_TotalRecordConut(String user_id) throws Exception;
	
	public int getEngineerList_TotalRecordConut(String user_id) throws Exception;

}
