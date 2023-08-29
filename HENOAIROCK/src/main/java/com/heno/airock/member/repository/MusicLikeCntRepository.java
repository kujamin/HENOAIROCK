package com.heno.airock.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MusicHeartDTO;
import com.heno.airock.dto.MusicVO;

@Repository
public class MusicLikeCntRepository {
	
	private final SqlSessionTemplate sql;
	
	public MusicLikeCntRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	public int musicSaveHeart(MusicHeartDTO heartDTO) {
		return sql.insert("MusicHeart.heart_save", heartDTO);
	}
	
	public int musicRemoveHeart(MusicHeartDTO heartDTO) {
		return sql.delete("MusicHeart.heart_remove", heartDTO);
	}
	
	public int findLike(MusicHeartDTO heartDTO) {
		return sql.selectOne("MusicHeart.findLike", heartDTO);
	}
	
	public int heartUp(MusicHeartDTO heartDTO) {
		return sql.update("MusicHeart.heart_up", heartDTO);
	}
	
	public int heartDown(MusicHeartDTO heartDTO) {
		return sql.update("MusicHeart.heart_down", heartDTO);
	}
	
}
