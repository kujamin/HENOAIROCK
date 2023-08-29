package com.heno.airock.dto;


public class MyPlayListVO extends MemberDTO{
	
	private String myListSeq;
	private String title;
	private String artist;
	private String albumImg;
	private String feeling;
	private String albumPath;
	private String ytLink;
	private int myListDiv;
	private String musicId;
	
	public MyPlayListVO() {}
	
	
	public String getMyListSeq() {
		return myListSeq;
	}

	public void setMyListSeq(String myListSeq) {
		this.myListSeq = myListSeq;
	}


	public int getMyListDiv() {
		return myListDiv;
	}

	public void setMyListDiv(int myListDiv) {
		this.myListDiv = myListDiv;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getAlbumImg() {
		return albumImg;
	}

	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
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



	public void setUserId(String userId) {
        super.setUserId(userId);
    }

    public String getUserId() {
        return super.getUserId();
    }

    public void setPageNo(int pageNo) {
        super.setPageNo(pageNo);
    }

    public int getPageNo() {
        return super.getPageNo();
    }
    
    public void setPageSize(int pageSize) {
        super.setPageSize(pageSize);
    }

    public int getPageSize() {
        return super.getPageSize();
    }   
    
	public String getYtLink() {
		return ytLink;
	}

	public void setYtLink(String ytLink) {
		this.ytLink = ytLink;
	}
	
	public String getMusicId() {
		return musicId;
	}

	public void setMusicId(String musicId) {
		this.musicId = musicId;
	}




	@Override
	public String toString() {
		return "MyPlayListVO [myListSeq=" + myListSeq + ", title=" + title + ", artist=" + artist + ", albumImg="
				+ albumImg + ", feeling=" + feeling + ", albumPath=" + albumPath + ", ytLink=" + ytLink + ", myListDiv="
				+ myListDiv + ", musicId=" + musicId + "]";
	}



	public MyPlayListVO(String myListSeq, String title, String artist, String albumImg, String feeling,
			String albumPath, String ytLink, int myListDiv, String musicId) {
		super();
		this.myListSeq = myListSeq;
		this.title = title;
		this.artist = artist;
		this.albumImg = albumImg;
		this.feeling = feeling;
		this.albumPath = albumPath;
		this.ytLink = ytLink;
		this.myListDiv = myListDiv;
		this.musicId = musicId;
	}



	


	
}
