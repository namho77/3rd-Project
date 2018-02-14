package com.cafe24.ourplanners.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {

	public int registMember(HttpServletRequest req, Model model);
	
	public void checkAuthkey(HttpServletRequest req, HashMap<String, Object> map );
	
	public int hasId(String userId) throws Exception;
	
}
