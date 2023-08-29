package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class PostVO extends DTO {
	private String postSeq;
	private String userId;
	private String postTitle;
	private String postContents;
	private int readCnt;
	private int likeCnt;
	private String updateDt;
	private String postDt;
	private String postDiv;
	private String musicId;
	
	private String title	  ;
	private String album	  ;
	private String artist	  ;
	private String genre	  ;
	private String feeling	  ;
	private String albumPath  ;
	
	
	

	public PostVO() {
	}

	public String getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(String postSeq) {
		this.postSeq = postSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}

	public String getPostDt() {
		return postDt;
	}

	public void setPostDt(String postDt) {
		this.postDt = postDt;
	}

	public String getPostDiv() {
		return postDiv;
	}

	public void setPostDiv(String postDiv) {
		this.postDiv = postDiv;
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

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	public String getAlbumPath() {
		return albumPath;
	}

	public void setAlbumPath(String albumPath) {
		this.albumPath = albumPath;
	}

	@Override
	public String toString() {
		return "PostVO [postSeq=" + postSeq + ", userId=" + userId + ", postTitle=" + postTitle + ", postContents="
				+ postContents + ", readCnt=" + readCnt + ", likeCnt=" + likeCnt + ", updateDt=" + updateDt
				+ ", postDt=" + postDt + ", postDiv=" + postDiv + ", musicId=" + musicId + ", title=" + title
				+ ", album=" + album + ", artist=" + artist + ", genre=" + genre + ", feeling=" + feeling
				+ ", albumPath=" + albumPath + "]";
	}

	public PostVO(String postSeq, String userId, String postTitle, String postContents, int readCnt, int likeCnt,
			String updateDt, String postDt, String postDiv, String musicId, String title, String album, String artist,
			String genre, String feeling, String albumPath) {
		super();
		this.postSeq = postSeq;
		this.userId = userId;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.readCnt = readCnt;
		this.likeCnt = likeCnt;
		this.updateDt = updateDt;
		this.postDt = postDt;
		this.postDiv = postDiv;
		this.musicId = musicId;
		this.title = title;
		this.album = album;
		this.artist = artist;
		this.genre = genre;
		this.feeling = feeling;
		this.albumPath = albumPath;
	}
	
	

}
