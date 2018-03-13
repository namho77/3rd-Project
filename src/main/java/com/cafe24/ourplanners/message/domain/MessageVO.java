package com.cafe24.ourplanners.message.domain;

public class MessageVO {
	private int message_srl;
	private String receiver_srl;
	private String sender_srl;
	private String title;
	private String contents;
	private String postdate;
	private String readed;
	private String readed_date;
	public String getReaded() {
		return readed;
	}
	public void setReaded(String readed) {
		this.readed = readed;
	}
	public String getReaded_date() {
		return readed_date;
	}
	public void setReaded_date(String readed_date) {
		this.readed_date = readed_date;
	}
	public int getMessage_srl() {
		return message_srl;
	}
	public void setMessage_srl(int message_srl) {
		this.message_srl = message_srl;
	}
	
	public String getReceiver_srl() {
		return receiver_srl;
	}
	public void setReceiver_srl(String receiver_srl) {
		this.receiver_srl = receiver_srl;
	}
	public String getSender_srl() {
		return sender_srl;
	}
	public void setSender_srl(String sender_srl) {
		this.sender_srl = sender_srl;
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
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
}
