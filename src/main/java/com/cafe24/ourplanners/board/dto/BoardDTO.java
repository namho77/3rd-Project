package com.cafe24.ourplanners.board.dto;

import java.sql.Date;

public class BoardDTO {

	private int board_srl;
	private String user_id;
	private String title;
	private String contents;
    private String location;
    private java.sql.Date service_time_start;
    private java.sql.Date service_time_end;     	
    private int contact_time_start;
    private int contact_time_end;  
    private int category_srl;
    private int subcategory_srl;
    private int service_cost; 
    private String board_type;
    
    public BoardDTO() {}
    
	public BoardDTO(int board_srl, String user_id, String title, String contents, String location, Date service_time_start,
			Date service_time_end, int contact_time_start, int contact_time_end, int category_srl, int subcategory_srl,
			int service_cost, String board_type) {
		super();
		this.board_srl = board_srl;
		this.user_id = user_id;
		this.title = title;
		this.contents = contents;
		this.location = location;
		this.service_time_start = service_time_start;
		this.service_time_end = service_time_end;
		this.contact_time_start = contact_time_start;
		this.contact_time_end = contact_time_end;
		this.category_srl = category_srl;
		this.subcategory_srl = subcategory_srl;
		this.service_cost = service_cost;
		this.board_type = board_type;
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

	public int getService_cost() {
		return service_cost;
	}

	public void setService_cost(int service_cost) {
		this.service_cost = service_cost;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}		
    
    
    
   
}
