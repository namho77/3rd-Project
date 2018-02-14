package com.cafe24.ourplanners.member.persistence;

import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.member.dto.LoginDTO;


public interface MemberDAO {

	public int registMemberNotNullCol(MemberVO vo) throws Exception;
	
	public int hasId(String userId);
	
	
	public LoginDTO login(String id, String pass);

	public int isValidAuthKey(String user_id, String password, String authkey);

	public int updateIsRegister(String is_regist, String authkey, String user_id, String password);
}
