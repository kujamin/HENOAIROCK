package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.CommentVO;

public interface CommentDao extends WorkDiv<CommentVO>, PcwkLoger {

    List<CommentVO> getCommentsForPost(String postSeq) throws SQLException;


}








