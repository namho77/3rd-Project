package com.cafe24.ourplanners.util;

public class SearchMessageCriteria  extends MessageCriteria{
	private String Message_type;

	public String getMessage_type() {
		return Message_type;
	}

	public void setMessage_type(String message_type) {
		Message_type = message_type;
	}
	@Override
	public String toString() {
		return super.toString() +"SearchCriteria [message_type"+
				Message_type + "]";
	}
	
}
