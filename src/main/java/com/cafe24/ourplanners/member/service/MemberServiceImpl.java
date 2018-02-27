package com.cafe24.ourplanners.member.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;
import com.cafe24.ourplanners.member.persistence.MemberDAO;
import com.cafe24.ourplanners.util.SHA256;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Transactional
	@Override
	public void saveMember(HttpServletRequest req, Model model) {

		String member_type = req.getParameter("member_type") == null ? "P" : req.getParameter("member_type");

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

		java.util.Date utilDate = null;

		try {
			utilDate = format.parse(strBirthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlBirthday = new java.sql.Date(utilDate.getTime());

		String allow_mailing = req.getParameter("allow_mailing");
		String allow_message = req.getParameter("allow_message");

		String gender = req.getParameter("gender");

		String address = req.getParameter("address");

		String mobile = req.getParameter("mobile");

		String career = req.getParameter("career");

		String career_history = req.getParameter("career_history");

		String license_date = req.getParameter("license_date");

		String license_provider = req.getParameter("license_provider");

		String license_description = req.getParameter("license_description");

		String company_name = req.getParameter("company_name");

		String company_number = req.getParameter("company_number");

		utilDate = new java.util.Date();
		java.sql.Date today = new java.sql.Date(utilDate.getTime());

		String denied = "N";

		java.sql.Date limit_date = null;

		String is_admin = req.getParameter("is_admin") == null ? "N" : req.getParameter("is_admin");

		java.sql.Date change_password_date = today;

		String profile_img_path = "profile.jpg";

		String member_grade = "E";

		java.sql.Date last_login = today;

		// 비밀번호 암호화
		String salt = SHA256.generateSalt();

		MemberVO joinInfo = new MemberVO(member_type, user_id, email_address, password, salt, email_id, email_host,
				user_name, find_account_question, find_account_answer, sqlBirthday, allow_mailing, allow_message,
				gender, address, mobile, career, career_history, license_date, license_provider, license_description,
				company_name, company_number, today, denied, limit_date, is_admin, change_password_date,
				profile_img_path, member_grade, last_login);

		String newPassword = SHA256.encrypt(joinInfo.getPassword(), salt);

		joinInfo.setPassword(newPassword);
		joinInfo.setSalt(salt);

		// System.out.println("저장된 솔트 : "+salt+"\n비밀번호 : "+memInfo.getPassword());

		model.addAttribute("action", "authmail");
		model.addAttribute("joinInfo", joinInfo);

	}

	public int registMember(MemberVO joinInfo) {

		int affected = 0;
		try {
			affected = dao.registMemberNotNullCol(joinInfo);
		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return affected;
	}

	@Override
	public void hasId(HttpServletRequest req, HashMap<String, Object> map) {

		int hasId = 0;

		String user_id = req.getParameter("user_id");

		String search_name = req.getParameter("name");
		String email_address = req.getParameter("email");

		if (search_name != null && email_address != null) {
			hasId = dao.hasIdByNameAndEmail(search_name, email_address);
		} else {
			// System.out.println("다오 호출");
			try {
				hasId = dao.hasId(user_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		//해당 하는 아이디가 없으면 success N
		//해당 하는 아이디가 있으면 fail Y
		if (hasId <= 0) {
			 System.out.println(hasId);
			map.put("result", "N");
		} else {
			map.put("result", "Y");
		}
		

	}

	@Override
	public void checkAuthkey(HttpServletRequest req, HashMap<String, Object> map) {

		HttpSession session = req.getSession();
		
		//아이디 찾기시 저장 되었던 email
		String email = (String)session.getAttribute("email");
		
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		String auth_key = req.getParameter("auth_key");
		
		int result=0;
		
		//회원가입시 인증키 확인
		if(user_id != null && password !=null)
		{
			result = dao.isValidAuthKey(user_id, password, auth_key);
			if (result == 1) {

				dao.updateIsRegister("Y", auth_key, user_id, password);
				
				map.put("result", "success");
			} else if (result == 0) {
				map.put("result", "fail");
			}
			
		}else {
			//아이디 찾기시 인증키 확인
			MemberVO vo = dao.getUserInfoByEmail(email);
			user_id = vo.getUser_id();
			
			result = dao.isValidAuthKeyWithoutPassword(user_id,auth_key);
			
			
			
			
			
			if (result == 1) {

				dao.updateIsRegisterWithoutPassword("Y", auth_key, user_id);
				session.setAttribute("find_id", user_id);
				session.setAttribute("find_regdate", vo.getRegdate());
				
				map.put("result", "success");
			}else if (result==0){
				map.put("result", "fail");
				map.put("errcode", "0");
			}else {
				map.put("result", "fail");
				map.put("errcode", "-1");
			}
			
		}
		
		
		
		
		
		
	}

	@Override
	public void keepLogin(Integer member_srl, String sessionKey, Date next) throws Exception {

		dao.keepLogin(member_srl, sessionKey, next);
	}

	public MemberVO checkLoginBefore(String value) {

		return dao.checkSessionKey(value);
	}

	@Transactional
	@Override
	public void uploadPicture(MemberVO vo) throws Exception {

		dao.uploadPicture(vo);

	}

	@Override
	public MemberVO login(LoginDTO dto, Model model) throws Exception {

		int hasId = 0;

		hasId = dao.hasId(dto.getUser_id());

		if (hasId <= 0) {
			model.addAttribute("ERROR_MSG", "입력한 아이디가 존재하지 않습니다. 아이디를 다시 한번 입력해 주세요.");
		} else {

			String memberSalt = dao.getSaltById(dto.getUser_id());

			String encPassword = SHA256.encrypt(dto.getPassword(), memberSalt);

			dto.setPassword(encPassword);

			int isValidPassword = 0;

			isValidPassword = dao.confirmIdPassword(dto);

			if (isValidPassword <= 0) {
				model.addAttribute("ERROR_MSG", "입력한 아이디와 비밀번호가 일치하지 않습니다. 아이디 또는 비밀번호를 다시 한번 입력해 주세요.");
			}
		}

		return dao.login(dto);
	}

	@Override
	public int updatePassword(Model model, HttpServletRequest req, HttpSession session) {

		String user_id = ((MemberVO) session.getAttribute("loginUserInfo")).getUser_id();
		String password = req.getParameter("password");
		String newPassword = req.getParameter("newPassword");

		// 현재 아이디의 솔트 가져오기
		String prevSalt = dao.getSaltById(user_id);
		// 입력받은 암호화 되지 않은 비밀번호를 솔트와 함께 비밀번호 암호화하여 DB에서 일치하는지 비교
		password = SHA256.encrypt(password, prevSalt);

		// 새로운 패스워드 암호화
		String newSalt = SHA256.generateSalt();
		newPassword = SHA256.encrypt(newPassword, newSalt);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("password", password);
		paramMap.put("newPassword", newPassword);
		paramMap.put("salt", newSalt);

		int affected = dao.updatePassword(paramMap);

		return affected;
	}

	@Override
	public int withdrawMember(Model model, HttpServletRequest req, HttpSession session) {
		// TODO Auto-generated method stub

		LoginDTO dto = new LoginDTO();

		String user_id = ((MemberVO) session.getAttribute("loginUserInfo")).getUser_id();
		String password = req.getParameter("password");

		dto.setUser_id(user_id);

		String salt = dao.getSaltById(user_id);

		password = SHA256.encrypt(password, salt);

		dto.setPassword(password);

		int affected = dao.confirmIdPassword(dto);

		if (affected <= 0) {
			model.addAttribute("error_msg", "비밀번호가 일치하지 않습니다. 비밀번호를 확인후 다시 시도해 주세요.");
			return affected;
		} else {
			int deletedRow = dao.deleteMember(user_id);
			// dao.dbClose();
			if (deletedRow <= 0) {
				model.addAttribute("isNotDeleteAccount", Boolean.TRUE);
				model.addAttribute("error_msg", "회원탈퇴에 실패하였습니다. 이미 탈퇴된 회원이거나 해당 하는 회원을 찾을 수 없습니다.");
			}
			return deletedRow;
		}

	}

	@Override
	public void findId(Model model, HttpServletRequest req, ModelAndView mv) {

		String action = req.getParameter("action");

		HttpSession session = req.getSession();

		if (action == null || action.length() == 0 || action.equalsIgnoreCase("checking_id")) {
			req.setAttribute("action", "checking_id");

		} else if (action.equalsIgnoreCase("masking_id")) {

			req.setAttribute("action", "masking_id");
			String searchName = req.getParameter("searchName");
			String searchEmail = req.getParameter("searchEmail");

			String searchValue = searchName.concat("/").concat(searchEmail);
			req.setAttribute("searchValue", searchValue);

			req.setAttribute("resultValue", dao.getAsteriskIdByNameAndEmail(searchName, searchEmail));

			session.setAttribute("email", searchEmail);

		} else if (action.equalsIgnoreCase("checking_auth")) {

			req.setAttribute("action", "checking_auth");

		} else if (action.equalsIgnoreCase("result")) {
			req.setAttribute("action", "result");

		} else if (action.equalsIgnoreCase("change_password")) {

			req.setAttribute("action", "change_password");

		} else if (action.equalsIgnoreCase("complete")) {

			String user_id = (String) session.getAttribute("find_id");
			String newPassword = req.getParameter("password");

			int affected = dao.updatePasswordWithoutPrevPassword(user_id, newPassword);

			session.removeAttribute("find_id");
			session.removeAttribute("email");
			session.removeAttribute("find_regdate");

			req.setAttribute("find_id", user_id);
			req.setAttribute("action", "complete");

		}

	}

	@Override
	public void findPassword(Model model, HttpServletRequest req, ModelAndView mv) {

		String action = req.getParameter("action");
		HttpSession session = req.getSession();

		if (action == null || action.length() == 0 || action.equalsIgnoreCase("checking_id")) {
			req.setAttribute("action", "checking_id");

		} else if (action.equalsIgnoreCase("checking_email")) {
			session.setAttribute("find_id", req.getParameter("searchId"));

			req.setAttribute("action", "checking_email");


		} else if (action.equalsIgnoreCase("checking_auth")) {
			req.setAttribute("action", "checking_auth");

			String searchName = req.getParameter("searchName");
			String searchEmail = req.getParameter("searchEmail");

			String searchValue = searchName.concat("/").concat(searchEmail);
			req.setAttribute("searchValue", searchValue);

			req.setAttribute("resultValue", dao.getAsteriskIdByNameAndEmail(searchName, searchEmail));

			session.setAttribute("email", searchEmail);



		} else if (action.equalsIgnoreCase("change_password")) {

			req.setAttribute("action", "change_password");


		} else if (action.equalsIgnoreCase("complete")) {

			String user_id = (String) session.getAttribute("find_id");
			String newPassword = req.getParameter("password");

			int affected = dao.updatePasswordWithoutPrevPassword(user_id, newPassword);

			session.removeAttribute("find_id");
			session.removeAttribute("email");
			session.removeAttribute("find_regdate");

			req.setAttribute("find_id", user_id);
			req.setAttribute("action", "complete");

		}

	}

}
