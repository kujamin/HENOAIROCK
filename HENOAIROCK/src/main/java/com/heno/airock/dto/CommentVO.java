package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class CommentVO extends DTO{
	public String cmtSeq;
	public String postSeq;
	public String userId;
	public String cmtDt;
	public String cmtContents;
	public String cmtUpdateDt;
	
	
	public CommentVO() {}

	public String getCmtSeq() {
		return cmtSeq;
	}

	public void setCmtSeq(String cmtSeq) {
		this.cmtSeq = cmtSeq;
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

	public String getCmtDt() {
		return cmtDt;
	}

	public void setCmtDt(String cmtDt) {
		this.cmtDt = cmtDt;
	}

	public String getCmtContents() {
		return cmtContents;
	}

	public void setCmtContents(String cmtContents) {
		this.cmtContents = cmtContents;
	}
	
	


	public String getCmtUpdateDt() {
		return cmtUpdateDt;
	}

	public void setCmtUpdateDt(String cmtUpdateDt) {
		this.cmtUpdateDt = cmtUpdateDt;
	}

	@Override
	public String toString() {
		return "CommentVO [cmtSeq=" + cmtSeq + ", postSeq=" + postSeq + ", userId=" + userId + ", cmtDt=" + cmtDt
				+ ", cmtContents=" + cmtContents + ", cmtUpdateDt=" + cmtUpdateDt + "]";
	}

	public CommentVO(String cmtSeq, String postSeq, String userId, String cmtDt, String cmtContents,
			String cmtUpdateDt) {
		super();
		this.cmtSeq = cmtSeq;
		this.postSeq = postSeq;
		this.userId = userId;
		this.cmtDt = cmtDt;
		this.cmtContents = cmtContents;
		this.cmtUpdateDt = cmtUpdateDt;
	}

	
	
	
}
