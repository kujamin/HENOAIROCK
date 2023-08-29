package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class MemberDTO extends DTO{
	private String userId;
	private String password;
	private String name;
	private String nickname;
	private String memberDt;
	private String birth;
	private String profileImg;

	public MemberDTO() {}

	public MemberDTO(String userId, String password, String name, String nickname, String memberDt, String birth,
			String profileImg) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.memberDt = memberDt;
		this.birth = birth;
		this.profileImg = profileImg;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberDt() {
		return memberDt;
	}

	public void setMemberDt(String memberDt) {
		this.memberDt = memberDt;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", memberDt=" + memberDt + ", birth=" + birth + ", profileImg=" + profileImg + "]";
	}

    // 사용자가 관리자인지 확인하는 메소드
    public boolean isAdmin() {
        // 예: 특정 조건을 만족하는 경우에만 관리자로 간주
        // 예를 들어, 사용자의 아이디가 "admin"인 경우에만 관리자로 간주
        return "어드민".equalsIgnoreCase(userId);
    }

	public boolean checkPassword(String inputPassword) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
}
