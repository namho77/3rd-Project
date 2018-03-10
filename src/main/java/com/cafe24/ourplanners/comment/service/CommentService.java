package com.cafe24.ourplanners.comment.service;

import java.util.HashMap;

import com.cafe24.ourplanners.util.CommentCriteria;

public interface CommentService {
	void getCommentListJson(CommentCriteria scri, HashMap<String, Object> map);
}
