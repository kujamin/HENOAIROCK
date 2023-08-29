package com.heno.airock.controller;

import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;
import com.heno.airock.dto.ChatRespondVO;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.service.ChatResService;
import com.heno.airock.service.ChatService;
import com.heno.airock.service.MusicService;

@Controller
@RequestMapping("/main")
public class MainController implements PcwkLoger{
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	ChatResService chatResService;
	
	@Autowired
	MusicService musicService;
	
	
	//클릭시 상세 채팅 내용 조회
	@GetMapping(value = "/selectOne")
	public String selectOne(
			MusicVO musicVO, 
			ChatRespondVO resVO, 
			ChatMessageDetailVO inVO, 
			Model model, HttpSession session, 
			HttpServletRequest request) throws SQLException {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		String viewPage = "/common/main";
		
		if (memberDTO != null) {
		
		inVO.setUserId(memberDTO.getUserId());
		List<ChatMessageDetailVO> Msglist = chatService.select(inVO);
		LOG.debug("list:" + Msglist);
		model.addAttribute("MsgList", Msglist);
		
		
		LOG.debug("request.getParameter(\"chatSeq\"):" + request.getParameter("chatSeq"));
		inVO.setChatSeq(request.getParameter("chatSeq"));
		LOG.debug("inVO:" + inVO);
		List<ChatMessageDetailVO> list = chatService.ContentsSelect(inVO);
		
		resVO.setChatSeq(request.getParameter("chatSeq"));
		LOG.debug("resVO:" + resVO);
		List<ChatRespondVO> resList = chatResService.select(resVO);

		LOG.debug("list:" + list);
		LOG.debug("resList:" + resList);
		model.addAttribute("contentsList", list);
		model.addAttribute("respondList", resList);

			return viewPage;
		} else {
			return "redirect:/member/login";
		}
	}
	
	//채팅방 리스트 뿌리기
	@RequestMapping(value = "")
	public String main(ChatMessageDetailVO inVO, Model model, HttpSession session) throws SQLException {
		String viewPage = "/common/main";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			inVO.setUserId(memberDTO.getUserId());
			List<ChatMessageDetailVO> list = chatService.select(inVO);
			LOG.debug("list:" + list);
			model.addAttribute("MsgList", list);
			
			return viewPage;
		} else {
			return "redirect:/member/login";
		}
		
	}
	
	//decode 및 응답 메세지 작성
	@PostMapping("/decode")
	public String decode(
			@RequestParam String encodedData,
			@RequestParam String chatSeq,
			@RequestParam String chatContentsId, 
			ChatRespondVO inVO,
			MusicVO musicVO
			) {
		String viewPage = "/common/main";
        try {
        	// URL 디코딩
            String decodedData = URLDecoder.decode(encodedData, "UTF-8");
            LOG.debug("│chatSeq                          │" + chatSeq);
            LOG.debug("│decodedData                          │" + decodedData);
            LOG.debug("│chatContentsId                          │" + chatContentsId);
            inVO.setFeeling(decodedData);
            inVO.setChatSeq(chatSeq);
            
            // JSON 파싱
            JsonObject jsonObject = JsonParser.parseString(decodedData).getAsJsonObject();

            // 각각의 감정과 값을 변수에 String으로 저장
            String 상처 = jsonObject.get("상처").getAsString();
            String 기쁨 = jsonObject.get("기쁨").getAsString();
            String 당황 = jsonObject.get("당황").getAsString();
            String 분노 = jsonObject.get("분노").getAsString();
            String 불안 = jsonObject.get("불안").getAsString();
            String 슬픔 = jsonObject.get("슬픔").getAsString();
            
            LOG.debug("│상처                          │" + 상처);
            LOG.debug("│기쁨                          │" + 기쁨);
            LOG.debug("│당황                          │" + 당황);
            LOG.debug("│분노                          │" + 분노);
            LOG.debug("│불안                          │" + 불안);
            LOG.debug("│슬픔                          │" + 슬픔);
            
            inVO.setHurt(상처);
            inVO.setHappy(기쁨);
            inVO.setEmbarrassed(당황);
            inVO.setAnger(분노);
            inVO.setUnrest(불안);
            inVO.setSad(슬픔);
            
            // 감정 수치를 정수로 변환하여 비교
            int 상처Int = Integer.parseInt(상처);
            int 기쁨Int = Integer.parseInt(기쁨);
            int 당황Int = Integer.parseInt(당황);
            int 분노Int = Integer.parseInt(분노);
            int 불안Int = Integer.parseInt(불안);
            int 슬픔Int = Integer.parseInt(슬픔);

            // 가장 높은 값을 가진 감정을 선택
            String selectedEmotion = "";

            int maxEmotionValue = Math.max(상처Int, Math.max(기쁨Int, Math.max(당황Int, Math.max(분노Int, Math.max(불안Int, 슬픔Int)))));
            if (maxEmotionValue == 상처Int) {
                selectedEmotion = "상처";
            } else if (maxEmotionValue == 기쁨Int) {
                selectedEmotion = "기쁨";
            } else if (maxEmotionValue == 당황Int) {
                selectedEmotion = "당황";
            } else if (maxEmotionValue == 분노Int) {
                selectedEmotion = "분노";
            } else if (maxEmotionValue == 불안Int) {
                selectedEmotion = "불안";
            } else if (maxEmotionValue == 슬픔Int) {
                selectedEmotion = "슬픔";
            }
            inVO.setChatResContents("저희가 추론한 가장 높은 감정은:  " + selectedEmotion + "입니다");
            inVO.setFeeling(selectedEmotion);
            inVO.setChatContentsId(chatContentsId);
            
            String feeling = selectedEmotion;
		    LOG.debug("feeling:" + feeling);
		    musicVO.setFeeling(feeling);
		    LOG.debug("musicVO:" + musicVO);
       
            MusicVO musicList = musicService.selectChatRec(musicVO);
            inVO.setMusicId(musicList.getMusicId());
    		
            int flag = chatResService.save(inVO);
            LOG.debug("│flag                          │" + flag);
            
            return viewPage;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error processing data.";
        }
    }
	
	@RequestMapping(value="/chat",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String newChat(@RequestBody String decodedData, ChatMessageDetailVO inVO, Model model, HttpSession session)throws SQLException {
		String jsonString = "";
		MessageDTO message = new MessageDTO();
		
		
		inVO.setChatDiv("10");
		int result = chatService.MessageSave(inVO);
		if(result == 1) {
			message.setMsgId("1");
			message.setMsgContents(inVO.getChatContentsId());
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents(inVO.getChatContentsId());
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		}
		
			
		
		
	}
	
	//채팅시작시 POST 방식으로 내용 저장
	@RequestMapping(value= "/start", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String start(@RequestBody String decodedData, ChatMessageVO inVO, HttpSession session, Model model) throws SQLException {
		String jsonString = "";
		MessageDTO message = new MessageDTO();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			inVO.setChatDiv("10");
			
			int flag = this.chatService.save(inVO);
			
			
			if (1 == flag) {
				message.setMsgId("1");
				LOG.debug("│inVO                          │" + inVO);
				message.setMsgContents(inVO.getChatSeq());
	
		        jsonString = new Gson().toJson(message);
	
		        return jsonString;		
	        
			} else {
				message.setMsgId("2");
				message.setMsgContents("문제 발생 재접속 바랍니다!");
			}
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {
			message.setMsgId("3");
			message.setMsgContents("로그인 후  이용 가능합니다!");
			
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	
		
	}
	
	

}
