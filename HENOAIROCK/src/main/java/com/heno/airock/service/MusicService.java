 package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MusicVO;

public interface MusicService extends WorkDiv<MusicVO> {

	List<MusicVO> selectGenre(MusicVO inVO) throws SQLException;
	
	List<MusicVO> selectFeeling(MusicVO inVO) throws SQLException;

	MusicVO selectChatRec(MusicVO musicVO);
	
}
