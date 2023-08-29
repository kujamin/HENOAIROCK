package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.StringUtil;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.CommentVO;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.CodeService;
import com.heno.airock.service.CommentService;
import com.heno.airock.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController implements PcwkLoger {

	@Autowired
	CommentService commentService;
	
	@Autowired
	PostService postService;

	@Autowired
	CodeService codeService;

	public PostController() {
	}
	
	@PostMapping("/deleteComment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> deleteComment(@RequestParam String cmtSeq) throws SQLException {
	    Map<String, Object> response = new HashMap<>();

	    
	    CommentVO inVO = new CommentVO();
	    inVO.setCmtSeq(cmtSeq);
	    
	    int flag = commentService.delete(inVO);
	    if (flag == 1) {
	        response.put("success", true);
	        response.put("message", "댓글이 삭제되었습니다.");
	    } else {
	        response.put("success", false);
	        response.put("message", "삭제 실패");
	    }

	    return ResponseEntity.ok(response);
	}
	
	@PostMapping("/updateComment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updateComment(@RequestParam String cmtSeq, @RequestParam String cmtContents) throws SQLException {
	    Map<String, Object> response = new HashMap<>();

	    // 입력 값 유효성 검사 등 필요한 로직을 추가하세요.

	    CommentVO inVO = new CommentVO();
	    inVO.setCmtSeq(cmtSeq);
	    inVO.setCmtContents(cmtContents);

	    int flag = commentService.update(inVO);
	    if (flag == 1) {
	        response.put("success", true);
	        response.put("message", "댓글이 수정되었습니다.");
	        response.put("editedComment", inVO); // 수정된 댓글 정보를 응답에 포함시킴
	    } else {
	        response.put("success", false);
	        response.put("message", "수정 실패");
	    }

	    return ResponseEntity.ok(response);
	}

    
	@PostMapping("/create")
	@ResponseBody
	public Map<String, Object> addComment(@ModelAttribute CommentVO comment,
	                                      HttpServletRequest request,
	                                      HttpSession session) throws SQLException {
	    Map<String, Object> response = new HashMap<>();
	    
	    MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
	    if (memberDTO != null) {
	        String postSeq = request.getParameter("postSeq");
	        String cmtContents = request.getParameter("cmtContents");
	        
	        comment.setPostSeq(postSeq);
	        comment.setCmtContents(cmtContents);
	        comment.setUserId(memberDTO.getUserId());
	        
	        int result = commentService.save(comment);
	        if (result > 0) {
	            response.put("success", true);
	            response.put("message", "댓글이 추가되었습니다.");
	            response.put("comment", comment); // 추가된 댓글 정보를 응답에 포함시킴
	        } else {
	            response.put("success", false);
	            response.put("message", "댓글 추가에 실패했습니다.");
	        }
	    } else {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	    }
	    
	    return response;
	}
	
	@GetMapping("/select")
	public String select(@ModelAttribute PostVO inVO, Model model, HttpServletRequest reqeust, HttpSession session)
			throws SQLException {
		String view = "/post/post_detail";

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSelectOne                   │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
         
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setPostSeq(reqeust.getParameter("seq"));
			inVO.setUserId(memberDTO.getUserId());
			PostVO outVO = postService.selectOne(inVO);
			
			List<CommentVO> comments = commentService.getCommentsForPost(reqeust.getParameter("seq"));
			LOG.debug("│outVO                          │" + outVO);
			LOG.debug("│comments                          │" + comments);
			model.addAttribute("outVO", outVO);
			model.addAttribute("inVO", inVO);
			model.addAttribute("comments",comments);
			return view;
		} else {
			return "redirect:/member/login";
		}

	}
	
	@GetMapping("/post_mng")
	public String post_mng(@ModelAttribute PostVO inVO, Model model, HttpServletRequest reqeust, HttpSession session) throws SQLException {
		String view = "/post/post_mng";
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSelectOne                   │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
         
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setPostSeq(reqeust.getParameter("seq"));
			inVO.setUserId(memberDTO.getUserId());
			PostVO outVO = postService.selectOne(inVO);
			
			List<CommentVO> comments = commentService.getCommentsForPost(reqeust.getParameter("seq"));
			LOG.debug("│outVO                          │" + outVO);
			LOG.debug("│comments                          │" + comments);
			model.addAttribute("outVO", outVO);
			model.addAttribute("inVO", inVO);
			model.addAttribute("comments",comments);
			return view;
		} else {
			return "redirect:/member/login";
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String update(PostVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdate                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = this.postService.update(inVO);
		MessageDTO message = new MessageDTO();
		if (1 == flag) {
			message.setMsgId("1");
			message.setMsgContents("수정되었습니다.");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents("수정 실패");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		}
	}

	@RequestMapping(value = "")
	public String select(PostVO inVO, Model model) throws SQLException {
	    String viewPage = "/post/post";
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

	    // 코드조회: 페이지 사이즈
	    codeVO.setCodeId("CMN_PAGE_SIZE");
	    List<CodeVO> pageSizeList = codeService.select(codeVO);
	    model.addAttribute("pageSizeList", pageSizeList);

	    List<PostVO> allPosts = postService.select(inVO);
	    List<PostVO> adminPosts = new ArrayList<>();
	    List<PostVO> otherPosts = new ArrayList<>();

	    for (PostVO post : allPosts) {
	        if ("어드민".equals(post.getUserId())) {
	            adminPosts.add(post);
	        } else {
	            otherPosts.add(post);
	        }
	    }

	    adminPosts.addAll(otherPosts);
	    List<PostVO> sortedPosts = adminPosts;

	    // 총글수
	    int totalCnt = 0;
	    if (null != sortedPosts && sortedPosts.size() > 0) {
	        totalCnt = sortedPosts.get(0).getTotalCnt();
	    }

	    model.addAttribute("totalCnt", totalCnt);
	    model.addAttribute("list", sortedPosts);
	    model.addAttribute("inVO", inVO);
	    return viewPage;
	}

	@RequestMapping("post_reg")
	public String moveReg(PostVO inVO, Model model, HttpSession session) {
		String view = "/post/post_reg";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doMoveToReg                   │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");

		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			model.addAttribute("inVO", inVO);

			return view;
		} else {
			return "redirect:/member/login";
		}

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String save(PostVO inVO) throws SQLException {
		String jsonString = "";
		// 제목 미입력 오류코드 10
		if (null != inVO && inVO.getPostTitle().equals("")) {
			return StringUtil.validMessageTOJson("10", "제목을 입력 하세요.");
		}

		// 등록자:20
		if (null != inVO && inVO.getUserId().equals("") && null == inVO.getUserId()) {
			return StringUtil.validMessageTOJson("20", "등록자를 입력 하세요");
		}

		// 내용:30
		if (null != inVO && inVO.getPostContents().equals("")) {
			return StringUtil.validMessageTOJson("30", "내용을 입력 하세요");
		}
		// 서비스 호출
		int flag = this.postService.save(inVO);
		String message = "";
		if (1 == flag) {// 등록 성공
			message = inVO.getPostTitle() + " 등록 성공";
		} else {// 등록실패
			message = inVO.getPostTitle() + " 등록실패";
		}

		jsonString = StringUtil.validMessageTOJson(flag + "", message);

		return jsonString;
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(PostVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = postService.delete(inVO);

		MessageDTO message = new MessageDTO();
		if (1 == flag) {// 삭제 성공
			message.setMsgId("1");
			message.setMsgContents("삭제되었습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {// 등록실패
			message.setMsgId("2");
			message.setMsgContents("삭제실패했습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		}
		
	}

}
