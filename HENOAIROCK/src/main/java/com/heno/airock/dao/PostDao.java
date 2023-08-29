package com.heno.airock.dao;

import java.sql.SQLException;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.PostVO;

public interface PostDao extends WorkDiv<PostVO> {
	
	public int updateReadCnt (PostVO inVO) throws SQLException;

	int admindelete(PostVO inVO) throws SQLException;
	
}
