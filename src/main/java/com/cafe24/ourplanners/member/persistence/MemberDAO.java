package com.cafe24.ourplanners.member.persistence;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;


public interface MemberDAO {

	public int registMemberNotNullCol(MemberVO vo);
	
	public int hasId(String userId);
	
	
	public LoginDTO login(String id, String pass);
}
