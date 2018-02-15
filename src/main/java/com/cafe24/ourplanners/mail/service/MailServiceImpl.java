package com.cafe24.ourplanners.mail.service;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.ourplanners.member.domain.MemberAuthMailVO;
import com.cafe24.ourplanners.member.persistence.MemberDAO;
import com.cafe24.ourplanners.util.General;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private MemberDAO dao;

	@Transactional
	@Override
	public void sendAuthMail(HttpServletRequest req, Map<String, Object> map) {

		String auth_key = General.getAuth_key();
		
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		
		String from = "ourplanners@ourplanners.com";
		String name = "기획자들";
		String to = req.getParameter("to"); // 받는 사람 이메일
		
		
		String subject = "기획자들 회원가입 인증 메일 입니다.";
		String content = "아래의 인증 토큰을 회원가입 창에서 입력하세요.\r\n인증 토큰 : ".concat(auth_key);

		java.util.Date utilDate = new java.util.Date();
		
		java.sql.Date regdate = new java.sql.Date(utilDate.getTime());
			
		MemberAuthMailVO vo = new MemberAuthMailVO(auth_key, user_id, password, "N", regdate);
			
		//dao.insertAuthKey(dto);
		dao.mergeAuthKey(vo);

		
		try {

			MimeMessage message = mailSender.createMimeMessage();
			
			Address fromAddr = new InternetAddress(from,name);
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			//messageHelper.setFrom(from);
			messageHelper.setFrom((InternetAddress) fromAddr); // 보내는 사람 생략시 작동안됨
			 
			messageHelper.setTo(to); // 받는사람
			messageHelper.setSubject(subject); // 제목은 생략 가능
			messageHelper.setText(content); // 내용

			mailSender.send(message);

			map.put("result", "success");

		} catch (Exception e) {
			map.put("result", "fail");
			e.printStackTrace();
		}
		
	}

	@Override
	public void sendMail(HttpServletRequest req, Map<String, Object> map) {
		String from = "ourplanners@ourplanners.com";
		String to = req.getParameter("to"); // 받는 사람 이메일
		String subject = req.getParameter("subject"); // 제목
		String content = req.getParameter("content"); // 내용
		
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(from); // 보내는 사람 생략시 작동안됨
			messageHelper.setTo(to); // 받는사람
			messageHelper.setSubject(subject); // 제목은 생략 가능
			messageHelper.setText(content); // 내용

			mailSender.send(message);

			map.put("result", "success");

		} catch (Exception e) {
			map.put("result", "fail");
			e.printStackTrace();
		}
		
	}

	
}
