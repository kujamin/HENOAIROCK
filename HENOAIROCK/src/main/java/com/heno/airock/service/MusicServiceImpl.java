package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.MusicDao;
import com.heno.airock.dto.MusicVO;

@Service
public class MusicServiceImpl implements MusicService {

	@Autowired
	MusicDao dao;
	
	@Override
	public int save(MusicVO inVO) throws SQLException {
		return dao.save(inVO);
	}

	@Override
	public int delete(MusicVO inVO) throws SQLException {
		return dao.delete(inVO);
	}

	@Override
	public int update(MusicVO inVO) throws SQLException {
		return dao.update(inVO);
	}

	@Override
	public MusicVO selectOne(MusicVO inVO) throws SQLException {
		return dao.selectOne(inVO);
	}

	@Override
	public List<MusicVO> select(MusicVO inVO) throws SQLException {
		return dao.select(inVO);
	}
	
	
	@Override
	public List<MusicVO> selectGenre(MusicVO inVO) throws SQLException {
		return dao.selectGenre(inVO);
	}

	@Override
	public List<MusicVO> selectFeeling(MusicVO inVO) throws SQLException {
		return dao.selectFeeling(inVO);
	}

	@Override
	public MusicVO selectChatRec(MusicVO inVO) {
		return dao.selectChatRec(inVO);
	}

}
