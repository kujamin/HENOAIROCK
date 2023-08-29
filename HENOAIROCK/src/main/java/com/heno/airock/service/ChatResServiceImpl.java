package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.ChatResDao;
import com.heno.airock.dto.ChatRespondVO;

@Service
public class ChatResServiceImpl implements ChatResService{
	
	@Autowired
	ChatResDao chatResDao;
	
	//채팅 시작시 응답 메세지 작성
	@Override
	public int save(ChatRespondVO inVO) throws SQLException {
		return chatResDao.save(inVO);
	}

	@Override
	public int delete(ChatRespondVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ChatRespondVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatRespondVO selectOne(ChatRespondVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRespondVO> select(ChatRespondVO inVO) throws SQLException {
		return chatResDao.select(inVO);
	}
	


}
