package com.cafe24.ourplanners.board.domain;

public class SubCategoryVO {
	
	private int category_srl;
	private String category_name;
	private int subcategory_srl;
	private String subcategory_name;
	
	public int getCategory_srl() {
		return category_srl;
	}
	public void setCategory_srl(int category_srl) {
		this.category_srl = category_srl;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getSubcategory_srl() {
		return subcategory_srl;
	}
	public void setSubcategory_srl(int subcategory_srl) {
		this.subcategory_srl = subcategory_srl;
	}
	public String getSubcategory_name() {
		return subcategory_name;
	}
	public void setSubcategory_name(String subcategory_name) {
		this.subcategory_name = subcategory_name;
	}
	
}
