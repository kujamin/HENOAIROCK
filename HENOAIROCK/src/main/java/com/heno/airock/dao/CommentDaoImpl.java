package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.CommentVO;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; // SqlSession을 주입 받습니다.

	@Override
	public int save(CommentVO inVO) {
		// 댓글 저장 쿼리 호출
		return sqlSessionTemplate.insert("comment.save", inVO);
	}

	@Override
	public int delete(CommentVO inVO) {
		// 댓글 삭제 쿼리 호출
		return sqlSessionTemplate.delete("comment.delete", inVO);
	}

	@Override
	public int update(CommentVO inVO) {
		// 댓글 수정 쿼리 호출
		return sqlSessionTemplate.update("comment.update", inVO);
	}

	@Override
	public CommentVO selectOne(CommentVO inVO) {
		// 댓글 조회 (단일) 쿼리 호출
		return sqlSessionTemplate.selectOne("comment.selectOne", inVO);
	}

	@Override
	public List<CommentVO> select(CommentVO inVO) {
		// 댓글 조회 (다중) 쿼리 호출
		return sqlSessionTemplate.selectList("comment.select", inVO);
	}
	
    @Override
    public List<CommentVO> getCommentsForPost(String postSeq) throws SQLException {
        return sqlSessionTemplate.selectList("comment.getCommentsForPost", postSeq);
    }

    
    
    

}

