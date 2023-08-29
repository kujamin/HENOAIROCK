package com.heno.airock.dto;

public class MusicHeartDTO extends MusicVO {
	private String likeSeq;
	
	public MusicHeartDTO () {}
	
	public String getLikeSeq() {
		return likeSeq;
	}
	public void setLikeSeq(String likeSeq) {
		this.likeSeq = likeSeq;
	}
	
	public void setUserId(String userId) {
        super.setUserId(userId);
    }

    public String getUserId() {
        return super.getUserId();
    }
    
	public String getMusicId() {
		return super.getMusicId();
	}
	
	public void setMusicId(String musicId) {
		super.setMusicId(musicId);
	}

	@Override
	public String toString() {
		return "MusicHeartDTO [likeSeq=" + likeSeq + ", getUserId()=" + getUserId() + ", getMusicId()=" + getMusicId()
				+ "]";
	}

	public MusicHeartDTO(String likeSeq) {
		super();
		this.likeSeq = likeSeq;
	}

	

}
