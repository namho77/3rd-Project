package com.cafe24.ourplanners.comment.domain;

import java.sql.Date;

public class CommentVO {
	private int comment_srl;
	private int parent_board_srl;
	private String user_id;
	private String comments;
	private Date postdate;
	private int parent_comment_srl;
	private int step;
	private int indent;
	private Date last_update;
	
	public CommentVO() {}
	
	public CommentVO(int comment_srl, int parent_board_srl, String user_id, String comments, Date postdate,
			int parent_comment_srl, int step, int indent, Date last_update) {
		this.comment_srl = comment_srl;
		this.parent_board_srl = parent_board_srl;
		this.user_id = user_id;
		this.comments = comments;
		this.postdate = postdate;
		this.parent_comment_srl = parent_comment_srl;
		this.step = step;
		this.indent = indent;
		this.last_update = last_update;
	}
	public int getComment_srl() {
		return comment_srl;
	}
	public void setComment_srl(int comment_srl) {
		this.comment_srl = comment_srl;
	}
	public int getParent_board_srl() {
		return parent_board_srl;
	}
	public void setParent_board_srl(int parent_board_srl) {
		this.parent_board_srl = parent_board_srl;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getcomments() {
		return comments;
	}
	public void setcomments(String comments) {
		this.comments = comments;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public int getParent_comment_srl() {
		return parent_comment_srl;
	}
	public void setParent_comment_srl(int parent_comment_srl) {
		this.parent_comment_srl = parent_comment_srl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public Date getLast_update() {
		return last_update;
	}
	public void setLast_update(Date last_update) {
		this.last_update = last_update;
	}
}
