package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.PostDao;
import com.heno.airock.dto.PostVO;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	PostDao dao;
	
	
	@Override
	public int save(PostVO inVO) throws SQLException {
		return dao.save(inVO);
	}

	@Override
	public int delete(PostVO inVO) throws SQLException {
		return dao.delete(inVO);
	}

	@Override
	public int update(PostVO inVO) throws SQLException {
		return dao.update(inVO);
	}

	@Override
	public PostVO selectOne(PostVO inVO) throws SQLException {
		//1. 단건 조회
		//2. 조회 count 증가
		PostVO vo = dao.selectOne(inVO);
		if (null != vo) {
			dao.updateReadCnt(inVO);
		}
		return vo;
	}

	@Override
	public List<PostVO> select(PostVO inVO) throws SQLException {
		return dao.select(inVO);
	}
	
	@Override
	public int admindelete(PostVO inVO) throws SQLException {
		return dao.admindelete(inVO);
	}


}
