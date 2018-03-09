package com.cafe24.ourplanners.message.domain;

public class MessageVO {
	private int message_srl;
	private int receiver_srl;
	private int sender_srl;
	private String title;
	private String contents;
	private String postdate;
	public int getMessage_srl() {
		return message_srl;
	}
	public void setMessage_srl(int message_srl) {
		this.message_srl = message_srl;
	}
	public int getReceiver_srl() {
		return receiver_srl;
	}
	public void setReceiver_srl(int receiver_srl) {
		this.receiver_srl = receiver_srl;
	}
	public int getSender_srl() {
		return sender_srl;
	}
	public void setSender_srl(int sender_srl) {
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
