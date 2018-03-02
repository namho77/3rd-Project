package com.cafe24.ourplanners.faq.domain;

public class FAQVO {
	
	private int faq_srl;
   private int category_srl;
   private int service_Srl;
   private String title;
   private String contents;
public int getFaq_srl() {
	return faq_srl;
}
public void setFaq_srl(int faq_srl) {
	this.faq_srl = faq_srl;
}
public int getCategory_srl() {
	return category_srl;
}
public void setCategory_srl(int category_srl) {
	this.category_srl = category_srl;
}
public int getService_Srl() {
	return service_Srl;
}
public void setService_Srl(int service_Srl) {
	this.service_Srl = service_Srl;
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
