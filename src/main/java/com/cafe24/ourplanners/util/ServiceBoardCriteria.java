package com.cafe24.ourplanners.util;

public class ServiceBoardCriteria extends Criteria{
	
	private int category_srl;
	private int subcategory_srl;
	private String board_type;
	
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


	public String getBoard_type() {
		return board_type;
	}


	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
}
