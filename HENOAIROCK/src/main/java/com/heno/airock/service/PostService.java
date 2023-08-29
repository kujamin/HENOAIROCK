package com.heno.airock.service;

import java.sql.SQLException;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.PostVO;

public interface PostService extends WorkDiv<PostVO> {

	int admindelete(PostVO inVO) throws SQLException;
	
	
}
