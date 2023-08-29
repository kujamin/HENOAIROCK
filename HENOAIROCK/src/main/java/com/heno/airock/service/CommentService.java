package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.CommentVO;

public interface CommentService extends WorkDiv<CommentVO>{

	List<CommentVO> getCommentsForPost(String postSeq) throws SQLException;

	

}
