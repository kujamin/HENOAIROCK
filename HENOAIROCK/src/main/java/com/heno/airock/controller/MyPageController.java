package com.heno.airock.controller;
import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.dto.MusicHeartDTO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.MyPlayListService;


@Controller
@RequestMapping("/mypage")
public class MyPageController implements PcwkLoger {
	
	@Autowired
	MyPlayListService myPlayListService;
	
	
	@RequestMapping(value="")
	public String select(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession session) throws SQLException {
		String viewPage = "/member/mypage";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			//좋아요 리스트
			MyPlayListVO outVO = myPlayListService.selectLikeSeq(inVO);
			List<MyPlayListVO> list2 = myPlayListService.selectCustomSeq(inVO);
			MemberDTO outVO3 = myPlayListService.selMypageProfile(inVO);
			LOG.debug("│outVO                          │" + outVO);
			LOG.debug("│outVO2                          │" + list2);

			inVO.setMyListSeq(outVO.getMyListSeq());
			LOG.debug("│inVO                          │" + inVO);
			if (inVO != null) {
				List<MyPlayListVO> list = myPlayListService.select(inVO);
				
				LOG.debug("list:" + list);
				LOG.debug("list2:" + list2);
				model.addAttribute("list", list);
				model.addAttribute("list2", list2);
				model.addAttribute("outVO3", outVO3);

			}
 			
			
			return viewPage;
		} else {
			return "redirect:/member/login";
		}
		
	}
	
	@GetMapping("/list_detail")
	public String selectList(@RequestParam(value = "myListSeq") String myListSeq, @ModelAttribute MyPlayListVO inVO, Model model,
	        HttpSession httpSession) throws SQLException {
		String view = "/member/list_detail";
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("user");
		
		if (null != inVO && null != myListSeq) {
			
			if (memberDTO == null) {
				return "redirect:/member/login";
			}
			inVO.setMyListSeq(myListSeq);
			inVO.setUserId(memberDTO.getUserId());
			MyPlayListVO outVO = myPlayListService.selectCustom(inVO);
			List<MusicVO> outVO2 = myPlayListService.selectCustomListMusic(inVO);
			
			httpSession.setAttribute("userId", memberDTO.getUserId());
			LOG.debug("inVO:" + inVO);
			LOG.debug("outVO:" + outVO);
			LOG.debug("outVO:" + outVO2);
			
			model.addAttribute("outVO", outVO);
			model.addAttribute("outVO2", outVO2);

			return view;
				
		} else {

			return "/music/music";
		}

	}
	
	
	@GetMapping("/listAdd")
	public String addList(@RequestParam(value = "myListSeq") String myListSeq, @ModelAttribute MyPlayListVO inVO, Model model,
	        HttpSession httpSession) throws SQLException {
		String view = "/member/listAdd";
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("user");
		
		if (null != inVO && null != myListSeq) {
			
			if (memberDTO == null) {
				return "redirect:/member/login";
			}
			inVO.setMyListSeq(myListSeq);
			List<MusicVO> outVO2 = myPlayListService.selmusic(inVO);

			inVO.setUserId(memberDTO.getUserId());
			MyPlayListVO outVO = myPlayListService.selectCustom(inVO);
			
			httpSession.setAttribute("userId", memberDTO.getUserId());
			LOG.debug("inVO:" + inVO);
			LOG.debug("outVO:" + outVO);
			LOG.debug("outVO2:" + outVO2);

			model.addAttribute("outVO", outVO);
			model.addAttribute("outVO2", outVO2);

			return view;
				
		} else {

			return "/music/music";
		}

	}
	
	@RequestMapping(value="list_reg")
	public String viewList(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession httpSession) throws SQLException {
		String viewPage = "/member/list_add";
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("user");
		
		if (memberDTO != null) {
			
			return viewPage;
		} else {
			return "redirect:/member/login";
		}
		
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addList(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession session) throws SQLException {

		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│delCustomList                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = myPlayListService.addCustomList(inVO);

		MessageDTO message = new MessageDTO();
		if (1 == flag) {// 삭제 성공
			message.setMsgId("1");
			message.setMsgContents("등록되었습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {// 등록실패
			message.setMsgId("2");
			message.setMsgContents("등록실패했습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		}
		
	}
	
	
	@RequestMapping(value = "delCustomList", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delCustomList(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession session) throws SQLException {

		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│delCustomList                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = myPlayListService.delCustomList(inVO);

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
	
	@RequestMapping(value = "delCustomListMusic", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delCustomListMusic(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession session) throws SQLException {

		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│delCustomList                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = myPlayListService.delCustomListMusic(inVO);

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
	
	@RequestMapping(value = "modCustomTitle", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modCustomTitle(MyPlayListVO inVO, Model model, HttpServletRequest request, HttpSession session) throws SQLException {

		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│modCustomTitle                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = myPlayListService.modCustomTitle(inVO);
		
		MessageDTO message = new MessageDTO();
		if (1 == flag) {// 삭제 성공
			message.setMsgId("1");
			message.setMsgContents("수정되었습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {// 등록실패
			message.setMsgId("2");
			message.setMsgContents("수정실패되었습니다!");
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		}
		
	}	
	
	@RequestMapping(value = "addCustom", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCustom(@RequestBody Map<String, Object> requestData, HttpServletRequest request, HttpSession session, MyPlayListVO inVO) throws SQLException {
	    String jsonString = "";

	    MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
	    int flag = 0;

	    // JSON 데이터에서 myListSeq와 musicIds를 추출
	    String myListSeq = (String) requestData.get("myListSeq");
	    List<String> musicIds = (List<String>) requestData.get("musicIds");
		LOG.debug("myListSeq : " + myListSeq);
		LOG.debug("musicIds : " + musicIds);
	    for (String musicId : musicIds) {
	        // 데이터베이스에 레코드 추가
	        inVO = new MyPlayListVO(); // 새로운 객체 생성
	        inVO.setUserId(memberDTO.getUserId());
	        inVO.setMyListSeq(myListSeq);
	        inVO.setMusicId(musicId);
			LOG.debug("inVO.getUserId : " + inVO.getUserId());
			LOG.debug("inVO.getMyListSeq : " + inVO.getMyListSeq());
			LOG.debug("inVO.getMusicId : " + inVO.getMusicId());
			
			flag += myPlayListService.addCustom(inVO);
	    }

	    MessageDTO message = new MessageDTO();
	    if (flag >= 1) {
	        message.setMsgId(Integer.toString(flag));
	        message.setMsgContents("추가되었습니다!");
	        jsonString = new Gson().toJson(message);

	        return jsonString;
	    } else {
	        message.setMsgId("0");
	        message.setMsgContents("실패되었습니다!");
	        jsonString = new Gson().toJson(message);

	        return jsonString;
	    }
	}	
	

	
	
	
}
