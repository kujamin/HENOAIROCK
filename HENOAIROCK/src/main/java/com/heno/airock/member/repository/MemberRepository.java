package com.heno.airock.member.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MemberDTO;


@Repository
public class MemberRepository {
	
	private final SqlSessionTemplate sql;
	//**Mapper.xml 과 일치해야함 namespace.id
	
	public MemberRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	public MemberDTO login(MemberDTO memberDTO) {
    	return sql.selectOne("Member.login", memberDTO);
    }
	
	public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO); 
    }
    
    public int idChk(MemberDTO memberDTO) {
    	return sql.selectOne("Member.idChk", memberDTO);
    }
    public int find(MemberDTO memberDTO) {
    	return sql.update("Member.find", memberDTO);
    }
    
 // 어드민--------------------------------------------------
    public MemberDTO adminLogin(MemberDTO memberDTO) {
        return sql.selectOne("Member.adminLogin", memberDTO);
    }
    public int deleteUser(String userId) {
        return sql.update("Member.deleteUser", userId);
    }
    public MemberDTO getUserById(String userId) {
        return sql.selectOne("Member.getUserById", userId);
    }
    public List<MemberDTO> getAllUsers() {
        return sql.selectList("Member.getAllUsers");
    }
	
}
