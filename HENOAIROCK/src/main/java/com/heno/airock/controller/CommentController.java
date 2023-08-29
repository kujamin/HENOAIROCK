package com.heno.airock.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heno.airock.dto.CommentVO;
import com.heno.airock.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	@PostMapping("/create")
	public String createComment(@RequestParam String postSeq,
	                    @RequestParam String userId,
	                    @RequestParam String cmtContents) throws SQLException {
		CommentVO comment = new CommentVO();
		comment.setPostSeq(postSeq);
		comment.setUserId(userId);
		comment.setCmtContents(cmtContents);
		
		int result = commentService.save(comment);

		if (result == 1) {
			// 댓글 생성 성공 시 처리
		} else {
			// 댓글 생성 실패 시 처리
		}

		return "redirect:/post/select?seq=" + postSeq;
	}

	@PostMapping("/update")
	public String updateComment(@RequestParam String cmtSeq,
	                    @RequestParam String cmtContents) throws SQLException {
		CommentVO comment = new CommentVO();
		comment.setCmtSeq(cmtSeq);
		comment.setCmtContents(cmtContents);
		
		int result = commentService.update(comment);

		if (result == 1) {
			// 댓글 수정 성공 시 처리
		} else {
			// 댓글 수정 실패 시 처리
		}

		return "redirect:/post/select?seq=" + comment.getPostSeq();
	}
	
	@PostMapping("/delete")
	public String deleteComment(@RequestParam Long cmtSeq) throws SQLException {
	    CommentVO comment = new CommentVO();
	    comment.setCmtSeq(String.valueOf(cmtSeq)); // CommentVO의 setCmtSeq 메서드는 String 타입을 받기 때문에 String.valueOf로 변환

	    int result = commentService.delete(comment);

	    if (result == 1) {
	        // 댓글 삭제 성공 시 처리
	    } else {
	        // 댓글 삭제 실패 시 처리
	    }

	    return "redirect:/post/select?seq=" + comment.getPostSeq();
	}
}
