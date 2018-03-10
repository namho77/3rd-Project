package com.cafe24.ourplanners.comment.persistence;

import java.util.List;

import com.cafe24.ourplanners.comment.domain.CommentVO;
import com.cafe24.ourplanners.util.CommentCriteria;

public interface CommentDAO {
	public List<CommentVO> getCommentListJson(CommentCriteria scri);
	
	public int getTotalCount(CommentCriteria scri);
}
