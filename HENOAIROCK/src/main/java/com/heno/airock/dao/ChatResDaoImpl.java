package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.ChatRespondVO;

@Repository
public class ChatResDaoImpl implements ChatResDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //DB 연결

	@Override
	public int save(ChatRespondVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("chat.responseInsert", inVO);
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
		return sqlSessionTemplate.selectList("chat.responseList", inVO);
	}

}
