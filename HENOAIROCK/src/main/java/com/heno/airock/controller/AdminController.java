package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

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
@RequestMapping("/admin")
public class AdminController implements PcwkLoger{
	
	@Autowired
	private final MemberService memberService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	CodeService codeService;

	public AdminController(MemberService memberService) {
		this.memberService = memberService;
	}

	// Administrator login page
	@GetMapping("/login")
	public String adminLoginForm(HttpSession session) {
		// 이미 로그인된 관리자인 경우 로그인 페이지로 리다이렉트
		if (session.getAttribute("loggedInAdmin") != null) {
			return "redirect:/admin/dashboard";
		}
		return "/admin/admin_login";
	}

	@PostMapping("/login")
	@ResponseBody
	public String adminLogin(@ModelAttribute MemberDTO adminDTO, HttpSession session) {
		String jsonString = "";
		boolean loginResult = memberService.login(adminDTO);
		MessageDTO message = new MessageDTO();
		if (loginResult && isAdmin(adminDTO)) {
			session.setAttribute("loggedInAdmin", adminDTO); // Store admin info in session
			message.setMsgId("1");
			message.setMsgContents(adminDTO.getUserId() + "님 환영합니다! (관리자)");
			jsonString = new Gson().toJson(message);
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents("관리자 아이디 또는 비밀번호를 확인해주세요.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}

	// Check if the user is an administrator
	private boolean isAdmin(MemberDTO memberDTO) {
		// Add your logic here to determine if the user is an administrator
		// For example, you might check a role or privilege in the memberDTO
		return memberDTO.isAdmin();
	}

	@GetMapping("/dashboard")
	public String adminDashboard(HttpSession session, Model model) {
		MemberDTO loggedInAdmin = (MemberDTO) session.getAttribute("loggedInAdmin");
		if (loggedInAdmin == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loggedInAdmin", loggedInAdmin);
		return "admin/admin_dashboard";
	}

	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("loggedInAdmin"); // 세션에서 관리자 정보 삭제
		return "redirect:/admin/login";
	}

	@GetMapping("/users")
	public ModelAndView userListPage() {
		ModelAndView modelAndView = new ModelAndView("admin/user_list");
		List<MemberDTO> userList = memberService.getAllUsers(); // 사용자 목록 조회
		modelAndView.addObject("userList", userList); // 사용자 목록을 modelAndView에 추가
		return modelAndView;
	}

	// 사용자 삭제 기능
	@PostMapping("/users/{userId}/delete")
	@ResponseBody
	public String deleteUser(@PathVariable String userId) {
		try {
			memberService.deleteUser(userId);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	@GetMapping("/users/{userId}")
	public ModelAndView viewUserProfile(@PathVariable String userId) {
		ModelAndView modelAndView = new ModelAndView("admin/user_profile");
		MemberDTO user = memberService.getUserById(userId); // 사용자 정보 조회 메소드
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	@RequestMapping(value="/post")
	public String select(PostVO inVO, Model model) throws SQLException {
		String viewPage = "/admin/admin_post";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// searchWord
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}

		// searchDiv
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv("");
		}
		
		// postDiv
		if (null != inVO && null == inVO.getPostDiv()) {
			inVO.setPostDiv("10");
		}
		
		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("BOARD_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);
		
		//코드조회: 페이지 사이즈
		codeVO.setCodeId("CMN_PAGE_SIZE");
		List<CodeVO> pageSizeList = codeService.select(codeVO);
		model.addAttribute("pageSizeList", pageSizeList);
		
		List<PostVO> list = postService.select(inVO);
		LOG.debug("list:" + list);
		model.addAttribute("list", list);
		
		//총글수
		int totalCnt = 0;
		if(null !=list && list.size() >0 ) {
			totalCnt = list.get(0).getTotalCnt();
		}
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET
			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(PostVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		
		
		int flag = postService.delete(inVO);
		
		String message = "";
		if (1 == flag) {// 삭제 성공
			message = "게시글이 삭제되었습니다";
		} else {// 등록실패
			message = inVO.getPostSeq() + " 삭제 실패";
		}

		jsonString = StringUtil.validMessageTOJson(flag + "", message);
		LOG.debug("│jsonString                          │" + jsonString);
		
	    return 	jsonString;
	}
	// 여기에 다른 어드민 관리 기능의 핸들러들을 추가할 수 있습니다.
}
