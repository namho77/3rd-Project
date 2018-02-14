package com.cafe24.ourplanners.member.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.persistence.MemberDAO;
import com.cafe24.ourplanners.util.SHA256;


@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO dao;

	@Transactional
	@Override
	public int registMember(HttpServletRequest req , Model model) {
		
		String member_type = req.getParameter("member_type");
		
		String user_id = req.getParameter("user_id");
		
		String email_address = req.getParameter("email_address");
		
		String password = req.getParameter("password");
		
		String email_id = req.getParameter("email_id");
		
		String email_host = req.getParameter("email_host");
		
		String user_name = req.getParameter("user_name");
		
		int find_account_question = Integer.parseInt(req.getParameter("find_account_question"));

		String find_account_answer = req.getParameter("find_account_answer");
	
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String strBirthday = req.getParameter("birthday");

		java.util.Date utilDate =null;
		
		try {
			utilDate = format.parse(strBirthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlBirthday = new java.sql.Date(utilDate.getTime());

		
		String allow_mailing = req.getParameter("emailreceive");
		String allow_message = req.getParameter("smsreceive");
		
		String gender = req.getParameter("gender");
		
		String address = req.getParameter("address");
		
		String mobile = req.getParameter("mobile");
		
		String career = req.getParameter("career");

		String career_history =req.getParameter("career_history");
		
		String license_date = req.getParameter("license_date");
		
		String license_provider = req.getParameter("license_provider");
		
		String license_description = req.getParameter("license_description");
		
		String company_name = req.getParameter("company_name");
		
		String company_number = req.getParameter("company_number");

		
		utilDate = new java.util.Date();
		java.sql.Date regdate = new java.sql.Date(utilDate.getTime());
		
		String denied = "N";
		
		java.sql.Date limit_date = null;
		
		String is_admin = req.getParameter("is_admin") == null ? "N" : req.getParameter("is_admin")  ;
		
		java.sql.Date change_password_date = regdate;
		
		String profile_img_path = "profile.jpg";

		String member_grade = "E";
		
		java.sql.Date last_login = null;
		

		//비밀번호 암호화 			
		String salt = SHA256.generateSalt();
        
        MemberVO joinInfo = new MemberVO(member_type,user_id,email_address,password,salt,
    			email_id,email_host,user_name,find_account_question,find_account_answer,
    			sqlBirthday,allow_mailing,allow_message,gender,address,mobile,
    			career,career_history,license_date,license_provider,
    			license_description,company_name,company_number,regdate,denied,
    			limit_date,is_admin,change_password_date,profile_img_path,member_grade,
    			last_login);
        
        String newPassword = SHA256.encrypt(joinInfo.getPassword(), salt);

        joinInfo.setPassword(newPassword);
        joinInfo.setSalt(salt);
		
        //System.out.println("저장된 솔트 : "+salt+"\n비밀번호 : "+memInfo.getPassword());
		
		model.addAttribute("action", "authmail");
		model.addAttribute("joinInfo", joinInfo);
		
		
		try {
			dao.registMemberNotNullCol(joinInfo);
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int hasId(String userId) throws Exception {
		//System.out.println("다오 호출");
		int hasId = dao.hasId(userId);
		
		return hasId;
	}

	@Override
	public void checkAuthkey(HttpServletRequest req, HashMap<String, Object> map) {
		
		String user_id = req.getParameter("user_id");

		String password = req.getParameter("password");
		String authkey = req.getParameter("authkey");
		 
		 int result = dao.isValidAuthKey(user_id, password,authkey);
		 
		 if(result ==1)
	      {
			  dao.updateIsRegister("Y", authkey, user_id, password);
	    	  map.put("result", "success");
	      }
		 else if (result==0){
	    	  map.put("result", "fail");
	      }
		
	}
	  
}
