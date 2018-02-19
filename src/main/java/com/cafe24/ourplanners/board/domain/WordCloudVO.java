package com.cafe24.ourplanners.board.domain;

public class WordCloudVO {
	
	private String searchword;
	private java.util.Date searchdate;
	private int category_srl;
	private int subcategory_srl;
	private int searchcount;
	private int ranking;
	
	
	public int getSearchcount() {
		return searchcount;
	}
	public void setSearchcount(int searchcount) {
		this.searchcount = searchcount;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public java.util.Date getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(java.util.Date searchdate) {
		this.searchdate = searchdate;
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
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	

	
}
