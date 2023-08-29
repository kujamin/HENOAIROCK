package com.heno.airock.dto;

public class MessageDTO {
	
	private String msgContents; //메시지
	private String msgId; //메세지 ID
	
	public MessageDTO () {}

	public MessageDTO(String msgContents, String msgId) {
		super();
		this.msgContents = msgContents;
		this.msgId = msgId;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	@Override
	public String toString() {
		return "MessageDTO [msgContents=" + msgContents + ", msgId=" + msgId + "]";
	}


}
