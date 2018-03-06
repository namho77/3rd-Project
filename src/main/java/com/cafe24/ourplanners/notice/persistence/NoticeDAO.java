package com.cafe24.ourplanners.notice.persistence;

import java.util.List;

import com.cafe24.ourplanners.notice.domain.NoticeVO;
import com.cafe24.ourplanners.util.SearchCriteria;

public interface NoticeDAO {
	public List<NoticeVO> getNoticeListJson(SearchCriteria scri);
	
	public int getTotalCount();
	
	public int deleteNotice(int notice_srl);
	
	public int modifyNotice(NoticeVO vo);

	public int writeNotice(NoticeVO vo);

	public NoticeVO readNotice(Integer notice_srl);
}
