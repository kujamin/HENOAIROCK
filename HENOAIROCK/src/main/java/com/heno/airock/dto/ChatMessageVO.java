package com.heno.airock.dto;

public class ChatMessageVO extends MemberDTO{
	private String chatSeq; //채팅 시퀀스
	private String chatDiv; //채팅 분류
	
	public ChatMessageVO() { }
	
	public String getChatSeq() {
		return chatSeq;
	}
	public void setChatSeq(String chatSeq) {
		this.chatSeq = chatSeq;
	}
	public String getChatDiv() {
		return chatDiv;
	}
	public void setChatDiv(String chatDiv) {
		this.chatDiv = chatDiv;
	}
	
	public String getUserId() {
		return super.getUserId();
	}
	
	public void setUserId(String userId) {
		super.setUserId(userId);
	}
	
	@Override
	public String toString() {
		return "ChatMessageVO [chatSeq=" + chatSeq + ", chatDiv=" + chatDiv;
	}
	public ChatMessageVO(String chatSeq, String chatDiv) {
		super();
		this.chatSeq = chatSeq;
		this.chatDiv = chatDiv;
	}
	
	
	
	
	
}
