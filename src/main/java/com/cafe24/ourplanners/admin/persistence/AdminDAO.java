package com.cafe24.ourplanners.admin.persistence;

import java.util.HashMap;
import java.util.List;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.member.domain.MemberVO;
import com.cafe24.ourplanners.util.SearchMemberCriteria;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;

public interface AdminDAO {

	public List<MemberVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map);

	public int getTotalMemberCount(SearchMemberCriteria scri);

	public int deleteMember(String user_id);
	
	public int deleteBoard(Integer board_srl);
	
	public int deleteComment(Integer comment_srl);
	
	public int deleteNotice(Integer notice_srl);

}
