package com.cafe24.ourplanners.mypage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cafe24.ourplanners.mypage.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl {
	
	@Inject
	MyPageDAO dao;
}
