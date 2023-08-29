package com.heno.airock.dto;

public class ChatRespondVO extends ChatMessageDetailVO{
	private String chatResSeq; //채팅 응답 시퀀스
	private String feeling; //분석한 감정
	private String chatResDt; //채팅 응답 시간
	private String chatResContents; //채팅응답 내용
	private String hurt;
	private String happy;
	private String embarrassed;
	private String anger;
	private String unrest;
	private String sad;
	private String chatContentsId;
	private String musicId;
	private String title;
	private String album;
	private String artist;
	private String albumPath;
	
	
	public ChatRespondVO() {}
	
	public String getChatSeq() {
		return super.getChatSeq();
	}
	
	public void setChatSeq(String chatSeq) {
		super.setChatSeq(chatSeq);
	}

	public String getChatResSeq() {
		return chatResSeq;
	}

	public void setChatResSeq(String chatResSeq) {
		this.chatResSeq = chatResSeq;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	public String getChatResDt() {
		return chatResDt;
	}

	public void setChatResDt(String chatResDt) {
		this.chatResDt = chatResDt;
	}
	
	public String getChatResContents() {
		return chatResContents;
	}

	public void setChatResContents(String chatResContents) {
		this.chatResContents = chatResContents;
	}

	public String getHurt() {
		return hurt;
	}

	public void setHurt(String hurt) {
		this.hurt = hurt;
	}

	public String getHappy() {
		return happy;
	}

	public void setHappy(String happy) {
		this.happy = happy;
	}

	public String getEmbarrassed() {
		return embarrassed;
	}

	public void setEmbarrassed(String embarrassed) {
		this.embarrassed = embarrassed;
	}

	public String getAnger() {
		return anger;
	}

	public void setAnger(String anger) {
		this.anger = anger;
	}

	public String getUnrest() {
		return unrest;
	}

	public void setUnrest(String unrest) {
		this.unrest = unrest;
	}

	public String getSad() {
		return sad;
	}

	public void setSad(String sad) {
		this.sad = sad;
	}
	

	public String getChatContentsId() {
		return chatContentsId;
	}

	public void setChatContentsId(String chatContentsId) {
		this.chatContentsId = chatContentsId;
	}
	
	public String getMusicId() {
		return musicId;
	}

	public void setMusicId(String musicId) {
		this.musicId = musicId;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	
	public String getAlbumPath() {
		return albumPath;
	}

	public void setAlbumPath(String albumPath) {
		this.albumPath = albumPath;
	}

	@Override
	public String toString() {
		return "ChatRespondVO [chatResSeq=" + chatResSeq + ", feeling=" + feeling + ", chatResDt=" + chatResDt
				+ ", chatResContents=" + chatResContents + ", hurt=" + hurt + ", happy=" + happy + ", embarrassed="
				+ embarrassed + ", anger=" + anger + ", unrest=" + unrest + ", sad=" + sad + ", chatContentsId="
				+ chatContentsId + ", musicId=" + musicId + ", title=" + title + ", album=" + album + ", artist="
				+ artist + ", albumPath=" + albumPath + ", getChatSeq()=" + getChatSeq() + "]";
	}

	public ChatRespondVO(String chatResSeq, String feeling, String chatResDt, String chatResContents, String hurt,
			String happy, String embarrassed, String anger, String unrest, String sad, String chatContentsId,
			String musicId, String title, String album, String artist, String albumPath) {
		super();
		this.chatResSeq = chatResSeq;
		this.feeling = feeling;
		this.chatResDt = chatResDt;
		this.chatResContents = chatResContents;
		this.hurt = hurt;
		this.happy = happy;
		this.embarrassed = embarrassed;
		this.anger = anger;
		this.unrest = unrest;
		this.sad = sad;
		this.chatContentsId = chatContentsId;
		this.musicId = musicId;
		this.title = title;
		this.album = album;
		this.artist = artist;
		this.albumPath = albumPath;
	}

	

	

	

	
	
}
