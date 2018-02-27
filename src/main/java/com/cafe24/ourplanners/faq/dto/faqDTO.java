package com.cafe24.ourplanners.faq.dto;

public class faqDTO {
	
	private int qna_srl;
   private int category;
   private int service;
   private String title;
   private String contents;
	
   public faqDTO() {}
   
   public faqDTO(int qna_srl, int category, int service, String title, String contents) {
	
		this.qna_srl = qna_srl;
		this.category = category;
		this.service = service;
		this.title = title;
		this.contents = contents;
	}

	public int getQna_srl() {
		return qna_srl;
	}

	public void setQna_srl(int qna_srl) {
		this.qna_srl = qna_srl;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getService() {
		return service;
	}

	public void setService(int service) {
		this.service = service;
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
}
