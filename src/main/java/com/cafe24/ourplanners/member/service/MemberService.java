package com.cafe24.ourplanners.member.service;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;

public interface MemberService {

	public void saveMember(HttpServletRequest req, Model model);
	
	public int registMember(MemberVO joinInfo);
	
	public void checkAuthkey(HttpServletRequest req, HashMap<String, Object> map );
	
	public void hasId(HttpServletRequest req, HashMap<String, Object> map);

	public MemberVO login(LoginDTO dto, Model model) throws Exception;
	
	public void uploadPicture(MemberVO vo) throws Exception ;
	
	public void keepLogin(Integer member_srl, String sessionKey, Date next) throws Exception;

	public MemberVO checkLoginBefore(String value);
}
