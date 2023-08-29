package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.dto.MemberDTO;


public interface MyPlayListService extends WorkDiv<MyPlayListVO>{

	public List<MyPlayListVO> showPlayLists(MyPlayListVO inVO) throws SQLException;
	
	public int saveMusic(MyPlayListVO inVO) throws SQLException;
	
	public MyPlayListVO selectLikeSeq(MyPlayListVO inVO) throws SQLException;
	
	public int deleteMusic(MyPlayListVO inVO) throws SQLException;
	
	public List<MyPlayListVO> selectCustomSeq(MyPlayListVO inVO) throws SQLException;
	
	public List<MusicVO> selectCustomListMusic(MyPlayListVO inVO) throws SQLException;

	public int addCustomList(MyPlayListVO inVO) throws SQLException;
	
	public int delCustomList(MyPlayListVO inVO) throws SQLException;
	
	public MyPlayListVO selectCustom(MyPlayListVO inVO) throws SQLException;

	public int delCustomListMusic(MyPlayListVO inVO) throws SQLException;

	public int modCustomTitle(MyPlayListVO inVO) throws SQLException;

	public List<MusicVO> selmusic(MyPlayListVO inVO) throws SQLException;
	
	public int addCustom(MyPlayListVO inVO) throws SQLException;

	public MemberDTO selMypageProfile(MemberDTO inVO) throws SQLException;
 
}