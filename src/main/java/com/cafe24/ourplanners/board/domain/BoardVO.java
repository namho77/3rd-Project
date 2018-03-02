package com.cafe24.ourplanners.board.domain;

import java.sql.Date;

public class BoardVO {

	private int board_srl;
	private String user_id;
	private String location;
	private java.sql.Date service_time_start;
	private java.sql.Date service_time_end;
	private String title;
	private String contents;
	private java.sql.Date postdate;
	private int visitcount;
	private int contact_time_start;
	private int contact_time_end;
	private String like_user_id;
	private String main_image;
	private String contents_image;
	private int category_srl;
	private int subcategory_srl;
	private String service_expired;
	private int service_cost;
	private int limit_person;
	private String board_type;
	private int service_score;
	private java.sql.Date last_update;
	
	
	public BoardVO() {}
	
	public BoardVO(int board_srl, String user_id, String location, Date service_time_start, Date service_time_end,
			String title, String contents, Date postdate, int visitcount, int contact_time_start,
			int contact_time_end, String like_user_id, String main_image, String contents_image, int category_srl,
			int subcategory_srl, String service_expired, int service_cost, int limit_person, String board_type,
			int service_score, Date last_update) {
		
		this.board_srl = board_srl;
		this.user_id = user_id;
		this.location = location;
		this.service_time_start = service_time_start;
		this.service_time_end = service_time_end;
		this.title = title;
		this.contents = contents;
		this.postdate = postdate;
		this.visitcount = visitcount;
		this.contact_time_start = contact_time_start;
		this.contact_time_end = contact_time_end;
		this.like_user_id = like_user_id;
		this.main_image = main_image;
		this.contents_image = contents_image;
		this.category_srl = category_srl;
		this.subcategory_srl = subcategory_srl;
		this.service_expired = service_expired;
		this.service_cost = service_cost;
		this.limit_person = limit_person;
		this.board_type = board_type;
		this.service_score = service_score;
		this.last_update = last_update;
	}

	public int getBoard_srl() {
		return board_srl;
	}
	public void setBoard_srl(int board_srl) {
		this.board_srl = board_srl;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public java.sql.Date getService_time_start() {
		return service_time_start;
	}
	public void setService_time_start(java.sql.Date service_time_start) {
		this.service_time_start = service_time_start;
	}
	public java.sql.Date getService_time_end() {
		return service_time_end;
	}
	public void setService_time_end(java.sql.Date service_time_end) {
		this.service_time_end = service_time_end;
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
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	public int getContact_time_start() {
		return contact_time_start;
	}
	public void setContact_time_start(int contact_time_start) {
		this.contact_time_start = contact_time_start;
	}
	public int getContact_time_end() {
		return contact_time_end;
	}
	public void setContact_time_end(int contact_time_end) {
		this.contact_time_end = contact_time_end;
	}
	public String getLike_user_id() {
		return like_user_id;
	}
	public void setLike_user_id(String like_user_id) {
		this.like_user_id = like_user_id;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	public String getContents_image() {
		return contents_image;
	}
	public void setContents_image(String contents_image) {
		this.contents_image = contents_image;
	}
	public int getCategory_srl() {
		return category_srl;
	}
	public void setCategory_srl(int category_srl) {
		this.category_srl = category_srl;
	}
	public int getSubcategory_srl() {
		return subcategory_srl;
	}
	public void setSubcategory_srl(int subcategory_srl) {
		this.subcategory_srl = subcategory_srl;
	}
	public String getService_expired() {
		return service_expired;
	}
	public void setService_expired(String service_expired) {
		this.service_expired = service_expired;
	}
	public int getService_cost() {
		return service_cost;
	}
	public void setService_cost(int service_cost) {
		this.service_cost = service_cost;
	}
	public int getLimit_person() {
		return limit_person;
	}
	public void setLimit_person(int limit_person) {
		this.limit_person = limit_person;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public int getService_score() {
		return service_score;
	}
	public void setService_score(int service_score) {
		this.service_score = service_score;
	}

	public java.sql.Date getLast_update() {
		return last_update;
	}
	public void setLast_update(java.sql.Date last_update) {
		this.last_update = last_update;
	}
}
