package com.cafe24.ourplanners.member.service;

import com.cafe24.ourplanners.member.domain.MemberVO;

public interface MemberService {

	public int registMemberNotNullCol(MemberVO member) throws Exception;
	
	public int hasId(String userId) throws Exception;
	
}
