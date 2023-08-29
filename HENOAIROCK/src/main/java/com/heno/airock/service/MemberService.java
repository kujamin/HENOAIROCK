package com.heno.airock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.heno.airock.dto.MemberDTO;
import com.heno.airock.member.repository.MemberRepository;

@Service
public class MemberService {
	private final MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public boolean login(MemberDTO memberDTO) {
		MemberDTO loginMember = memberRepository.login(memberDTO);
		if (loginMember != null) {
			return true;
		} else {
			return false;
		}
	}

	public int save(MemberDTO memberDTO) {
		return memberRepository.save(memberDTO);
	}

	public int idChk(MemberDTO memberDTO) {
		return memberRepository.idChk(memberDTO);
	}

	public int find(MemberDTO memberDTO) {
		return memberRepository.find(memberDTO);
	}
//	어드민 -----------------------------------------------------
	public boolean adminLogin(MemberDTO memberDTO) {
		MemberDTO adminMember = memberRepository.adminLogin(memberDTO);
		if (adminMember != null) {
			return true;
		} else {
			return false;
		}
	}
	public MemberDTO getUserById(String userId) {
		return memberRepository.getUserById(userId);
	}
	public int deleteUser(String userId) {
		return memberRepository.deleteUser(userId);
	}
	public List<MemberDTO> getAllUsers() {
		return memberRepository.getAllUsers();
	}


	}


