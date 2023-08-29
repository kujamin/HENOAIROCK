package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.StringUtil;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.CodeService;
import com.heno.airock.service.MemberService;
import com.heno.airock.service.PostService;

@Controller
@RequestMapping("/setting")
public class SettingController implements PcwkLoger{
	
	@Autowired
	private final MemberService memberService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	CodeService codeService;

	public SettingController(MemberService memberService) {
		this.memberService = memberService;
	}

	// Administrator login page
	@GetMapping("")
	public String setting(HttpSession session) {

		return "/setting/setting";
	}
	
	@GetMapping("setting_agree")
	public String setting_agree(HttpSession session) {

		return "/setting/setting_agree";
	}
	
	@GetMapping("setting_service")
	public String setting_service(HttpSession session) {

		return "/setting/setting_service";
	}
	
	
	
	
	/* @PostMapping("/checkPassword")
	    @ResponseBody
	    public String checkPassword(@RequestParam("password") String inputPassword, HttpSession session) {
	        MemberDTO member = (MemberDTO) session.getAttribute("user");
	        
	        if (member != null && member.checkPassword(inputPassword)) {
	            return "success"; // 인증 성공
	        } else {
	            return "failure"; // 인증 실패
	        }
	    }
	    
	    @GetMapping("/deleteProcess")
	    public String deleteProcess(HttpSession session) {
	        // 회원탈퇴 처리 로직 추가 (DB에서 회원 삭제 등)
	        session.invalidate(); // 세션 무효화
	        return "redirect:/"; // 메인 페이지로 리다이렉트
	    } */
	
  /*  @RequestMapping("")
    public String logout(HttpServletRequest request) {
        // 세션 무효화 등 로그아웃 처리
        request.getSession().invalidate();
        
        // 로그아웃 후 메인 화면으로 이동
        return "redirect:/member/login"; // 여기서 "/"는 메인 화면 URL입니다.
    }*/


}
