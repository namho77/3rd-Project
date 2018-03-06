package com.cafe24.ourplanners.notice.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.cafe24.ourplanners.notice.domain.NoticeVO;
import com.cafe24.ourplanners.util.SearchCriteria;

public interface NoticeService {
	void getNoticeListJson(SearchCriteria scri, HashMap<String, Object> map);

	int deleteNotice(int notice_srl);

	int writeNotice(HttpServletRequest req, Map<String, Object> map);

	void readNotice(Integer notice_srl, Model model);

	int modifyNotice(NoticeVO vo);
}
