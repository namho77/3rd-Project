package com.cafe24.ourplanners.notice.dto;

import java.sql.Date;

public class ABoardDTO {

	private int notice_srl;
   private String title;
   private String contents;
   private java.sql.Date postdate;
   
	public ABoardDTO() {}

	public ABoardDTO(int notice_srl, String title, String contents, Date postdate) {
		
		this.notice_srl = notice_srl;
		this.title = title;
		this.contents = contents;
		this.postdate = postdate;
	}
		
	public int getNotice_srl() {
		return notice_srl;
	}
	public void setNotice_srl(int notice_srl) {
		this.notice_srl = notice_srl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

	
   
}
