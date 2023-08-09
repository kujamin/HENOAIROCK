package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.CommentVO;

@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //DB 연결

	@Override
	public int save(CommentVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("Comment.save", inVO);
	}

	@Override
	public int delete(CommentVO inVO) throws SQLException {
		return sqlSessionTemplate.delete("Comment.delete", inVO);
	}

	@Override
	public int update(CommentVO inVO) throws SQLException {
		return sqlSessionTemplate.update("Comment.update", inVO);
	}

	@Override
	public CommentVO selectOne(CommentVO inVO) throws SQLException {
		return sqlSessionTemplate.selectOne("Comment.selectOne", inVO);
	}

	@Override
	public List<CommentVO> select(CommentVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doRetrieve                    │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │ select");
		LOG.debug("└──────────────────────────────┘");	
		return sqlSessionTemplate.selectList("Comment.select", inVO);
	}

}
