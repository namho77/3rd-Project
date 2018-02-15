package com.cafe24.ourplanners.mail.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface MailService {

	public void sendAuthMail(HttpServletRequest req, Map<String, Object> map);

	public void sendMail(HttpServletRequest req, Map<String, Object> map);

	
}
