package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;

public interface ChatDao extends WorkDiv<ChatMessageVO>, PcwkLoger {

	int MessageSave(ChatMessageVO inVO) throws SQLException;

	List<ChatMessageDetailVO> ContentsSelect(ChatMessageDetailVO inVO);
	
	List<ChatMessageDetailVO> select(ChatMessageDetailVO inVO);

}
