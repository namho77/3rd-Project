package com.cafe24.ourplanners.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.member.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService{

	  @Inject
	  private MemberDAO dao;
	  
}
