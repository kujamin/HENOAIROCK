package com.heno.airock.service;

import org.springframework.stereotype.Service;

import com.heno.airock.dto.MusicHeartDTO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.member.repository.MusicLikeCntRepository;

@Service
public class MusicLikeCntService {
	private final MusicLikeCntRepository mlcRepository;
	
	public MusicLikeCntService(MusicLikeCntRepository mlcRepository) {
		this.mlcRepository = mlcRepository;
	}
	
	public int findLike(MusicHeartDTO mhDTO) {
		return mlcRepository.findLike(mhDTO);
	}
	
	public int saveHeart(MusicHeartDTO mhDTO) {
		return mlcRepository.musicSaveHeart(mhDTO);
	}
	
	public int deleteHeart(MusicHeartDTO mhDTO) {
		return mlcRepository.musicRemoveHeart(mhDTO);
	}
	
	public int heartUp(MusicHeartDTO mhDTO) {
		return mlcRepository.heartUp(mhDTO);
	}
	
	public int heartDown(MusicHeartDTO mhDTO) {
		return mlcRepository.heartDown(mhDTO);
	}
	
}
