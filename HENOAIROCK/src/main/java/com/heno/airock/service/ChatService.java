package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;

public interface ChatService extends WorkDiv<ChatMessageVO>{

	List<ChatMessageDetailVO> ContentsSelect(ChatMessageDetailVO inVO);

	int MessageSave(ChatMessageVO inVO) throws SQLException;

	List<ChatMessageDetailVO> select(ChatMessageDetailVO inVO) throws SQLException;

}
