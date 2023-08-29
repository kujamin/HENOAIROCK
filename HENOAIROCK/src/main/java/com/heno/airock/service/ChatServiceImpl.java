package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.ChatDao;
import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatDao chatDao;

	//채팅 시퀀스 생성(사용자 채팅서비스 사용시 생성)
	@Override
	public int save(ChatMessageVO inVO) throws SQLException {
		return chatDao.save(inVO);
	}
	
	//채팅 내용 저장(사용자 채팅 전송시 생성)
	@Override
	public int MessageSave(ChatMessageVO inVO) throws SQLException {
		return chatDao.MessageSave(inVO);	
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
	public List<ChatMessageDetailVO> select(ChatMessageDetailVO inVO) throws SQLException {
		return chatDao.select(inVO);
	}

	@Override
	public List<ChatMessageDetailVO> ContentsSelect(ChatMessageDetailVO inVO) {
		
		return chatDao.ContentsSelect(inVO);
	}

	@Override
	public List<ChatMessageVO> select(ChatMessageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
