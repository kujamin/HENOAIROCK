package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MusicVO;

@Repository
public class MusicDaoImpl implements MusicDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int save(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("Music.save", inVO);
	}
	
	@Override
	public int delete(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.delete("Music.delete",inVO);
	}
	
	@Override
	public int update(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.update("Music.update",inVO);
	}
	
	@Override
	public MusicVO selectOne(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.selectOne("Music.selectOne", inVO);
	}

	@Override
	public List<MusicVO> select(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.selectList("Music.doRetrieve", inVO);
	}

	@Override
	public List<MusicVO> selectGenre(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.selectList("Music.genre", inVO);
	}
	
	@Override
	public List<MusicVO> selectFeeling(MusicVO inVO) throws SQLException {
		return sqlSessionTemplate.selectList("Music.feeling", inVO);
	}

	@Override
	public MusicVO selectChatRec(MusicVO inVO) {
		return sqlSessionTemplate.selectOne("Music.chatRec", inVO);
	}

}