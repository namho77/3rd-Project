package com.cafe24.ourplanners.util;

public class Criteria {

	
	//int pageSize = 3; // 한 페이지에 출력할 게시물의 개수
	//int blockPage = 2; // 한 블럭에 표시할 페이지 번호의 개수
	
	private int nowPage;	
	private int pageSize;
	
	public Criteria(){
		this.nowPage = 1;
		this.pageSize = 10;
	}

	public void setNowPage(int nowPage){
		
		if(nowPage <= 0){
			this.nowPage = 1;
			return;
		}
		
		this.nowPage = nowPage;
	}
	
	public void setPageSize(int pageSize){
		
		if(pageSize <= 0 || pageSize > 100){
			this.pageSize = 10;
			return;
		}
		
		this.pageSize = pageSize;
	}
	

	
	public int getNowPage() {
		return nowPage;
	}

	//method for MyBatis SQL Mapper - 
	public int getPageStart() {
		
		return (this.nowPage -1)* pageSize;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPageSize(){
		
		return this.pageSize;
	}

	@Override
	public String toString() {
		return "Criteria [nowPage=" + nowPage + ", pageSize=" + pageSize + "]";
	}
}


