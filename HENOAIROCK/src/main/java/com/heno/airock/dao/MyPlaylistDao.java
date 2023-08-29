package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.MemberDTO;

public interface MyPlaylistDao extends WorkDiv<MyPlayListVO> {
	
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException;

	public List<MyPlayListVO> useradd(MyPlayListVO myPlayListVO) throws SQLException;
	
	public int saveMusic(MyPlayListVO myPlayListVO) throws SQLException;
	
	public MyPlayListVO selectLikeList(MyPlayListVO myPlayListVO) throws SQLException;

	public int deleteMusic(MyPlayListVO myPlayListVO) throws SQLException;
	
	public List<MyPlayListVO> selectCustomList(MyPlayListVO myPlayListVO) throws SQLException;
	
	public List<MusicVO> selectCustomListMusic(MyPlayListVO myPlayListVO) throws SQLException;

	public int addCustomList(MyPlayListVO myPlayListVO) throws SQLException;
	
	public int delCustomList(MyPlayListVO myPlayListVO) throws SQLException;
	
	public MyPlayListVO selectCustom(MyPlayListVO myPlayListVO) throws SQLException;
	
	public int delCustomListMusic(MyPlayListVO myPlayListVO) throws SQLException;

	public int modCustomTitle (MyPlayListVO myPlayListVO) throws SQLException;
	
	public List<MusicVO> selmusic(MyPlayListVO myPlayListVO) throws SQLException;
	
	public int addCustom (MyPlayListVO myPlayListVO) throws SQLException;
	
	public MemberDTO selMypageProfile(MemberDTO memberDTO) throws SQLException;

}
