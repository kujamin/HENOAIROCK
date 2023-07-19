package com.heno.airock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.service.MemberService;

@Controller
@RequestMapping("/member") // 공통 주소 처리
public class MemberController {

	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		String jsonString = "";
		boolean loginResult = memberService.login(memberDTO);
		MessageDTO message = new MessageDTO();
		if (loginResult) {
			session.setAttribute("loginEmail", memberDTO.getEmail());
			message.setMsgId("1");
			message.setMsgContents(memberDTO.getEmail() + "님 환영합니다!");
			jsonString = new Gson().toJson(message);
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents("아이디 또는 비밀번호를 확인해주세요.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}

}