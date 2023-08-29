package com.heno.airock.dto;

public class ChatMessageDetailVO extends ChatMessageVO{
	
	private String chatContents; // 채팅 내용
	private String chatDt; //채팅 시간
	private String chatContentsId; //채팅 개별 ID
	
	public ChatMessageDetailVO() {}
	
	
	public String getChatContents() {
		return chatContents;
	}

	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}

	public String getChatSeq() {
		return super.getChatSeq();
	}
	
	public void setChatSeq(String chatSeq) {
		super.setChatSeq(chatSeq);
	}
	
	public String getChatDiv() {
		return super.getChatDiv();
	}
	
	public void setChatDiv(String chatDiv) {
		super.setChatDiv(chatDiv);
	}

	public String getChatDt() {
		return chatDt;
	}

	public void setChatDt(String chatDt) {
		this.chatDt = chatDt;
	}
	
	public String getChatContentsId() {
		return chatContentsId;
	}


	public void setChatContentsId(String chatContentsId) {
		this.chatContentsId = chatContentsId;
	}


	@Override
	public String toString() {
		return "ChatMessageDetailVO [chatContents=" + chatContents + ", chatDt=" + chatDt + ", chatContentsId="
				+ chatContentsId + ", getChatSeq()=" + getChatSeq() + ", getChatDiv()=" + getChatDiv() + "]";
	}


	public ChatMessageDetailVO(String chatContents, String chatDt, String chatContentsId) {
		super();
		this.chatContents = chatContents;
		this.chatDt = chatDt;
		this.chatContentsId = chatContentsId;
	}


	

	
	
}
