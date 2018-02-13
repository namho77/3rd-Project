package com.cafe24.ourplanners.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO dao;

	@Transactional
	@Override
	public int registMemberNotNullCol(MemberVO member) throws Exception {
		
		dao.registMemberNotNullCol(member);
		
		return 0;
	}

	@Override
	public int hasId(String userId) throws Exception {
		
		int hasId = dao.hasId(userId);
		
		return hasId;
	}
	  
}
