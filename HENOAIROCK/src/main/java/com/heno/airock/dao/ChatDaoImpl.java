package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;

@Repository
public class ChatDaoImpl implements ChatDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //DB연

	@Override
	public int save(ChatMessageVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("chat.start", inVO);
	}
	
	@Override
	public int MessageSave(ChatMessageVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("chat.message", inVO);
	}
	

	@Override
	public int delete(ChatMessageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ChatMessageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatMessageVO selectOne(ChatMessageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatMessageDetailVO> select(ChatMessageDetailVO inVO) {
		return sqlSessionTemplate.selectList("chat.selectMsgList", inVO);
	}

	@Override
	public List<ChatMessageDetailVO> ContentsSelect(ChatMessageDetailVO inVO) {
		return sqlSessionTemplate.selectList("chat.contentSelect", inVO);
	}

	@Override
	public List<ChatMessageVO> select(ChatMessageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
