package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.heno.airock.service.CodeService;
import com.heno.airock.service.MusicLikeCntService;
import com.heno.airock.service.MusicService;
import com.heno.airock.service.MyPlayListService;

@Controller
@RequestMapping("/music")
public class MusicController implements PcwkLoger {

	@Autowired
	MusicService musicService;

	@Autowired
	CodeService codeService;

	@Autowired
	MyPlayListService myPlayListService;

	private final MusicLikeCntService musicLikeCntService;

	public MusicController(MusicLikeCntService musicLikeCntService) {
		this.musicLikeCntService = musicLikeCntService;
	}

	@ResponseBody
	@RequestMapping(value = "/saveHeart", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String save_heart(@ModelAttribute MusicHeartDTO mhDTO, @ModelAttribute MyPlayListVO myplayVO,
			@RequestBody MusicHeartDTO mDTO) throws SQLException {
		String jsonString = "";
		MessageDTO message = new MessageDTO();
		LOG.debug("mhDTO:" + mhDTO);
		LOG.debug("mDTO:" + mDTO);

		mhDTO.setMusicId(mDTO.getMusicId());
		mhDTO.setUserId(mDTO.getUserId());

		LOG.debug("myplayVO" + myplayVO);
		int saveHeartResult = musicLikeCntService.saveHeart(mhDTO);

		LOG.debug("saveHeartResult:" + saveHeartResult);
		if (saveHeartResult == 1) {
			int heartUp = musicLikeCntService.heartUp(mhDTO);

			if (heartUp == 1) {
				myplayVO.setUserId(mDTO.getUserId());
				MyPlayListVO outVO = myPlayListService.selectLikeSeq(myplayVO);
				LOG.debug("myplayVO:" + myplayVO);

				myplayVO.setMyListSeq(outVO.getMyListSeq());

				if (myplayVO.getMyListSeq() != null) {

					myplayVO.setMusicId(mDTO.getMusicId());

					LOG.debug("myplayVO:" + myplayVO);
					int saveMusic = myPlayListService.saveMusic(myplayVO);

					if (saveMusic == 1) {
						message.setMsgId("1");
						message.setMsgContents("정상적으로 좋아요 완료!!");
						jsonString = new Gson().toJson(message);
						return jsonString;
					} else {
						message.setMsgId("2");
						message.setMsgContents("실패!");
						jsonString = new Gson().toJson(message);
						return jsonString;
					}
				} else {
					message.setMsgId("2");
					message.setMsgContents("실패!");
					jsonString = new Gson().toJson(message);
					return jsonString;
				}

			} else {
				message.setMsgId("2");
				message.setMsgContents("실패!");
				jsonString = new Gson().toJson(message);
				return jsonString;
			}

		} else {
			message.setMsgId("2");
			message.setMsgContents("실패!");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}

	}

	@ResponseBody
	@RequestMapping(value = "/deleteHeart", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String delete_heart(@ModelAttribute MusicHeartDTO mhDTO, @ModelAttribute MyPlayListVO myplayVO,
			@RequestBody MusicHeartDTO mDTO) throws SQLException {
		String jsonString = "";
		MessageDTO message = new MessageDTO();

		mhDTO.setMusicId(mDTO.getMusicId());
		mhDTO.setUserId(mDTO.getUserId());
		LOG.debug("mhDTO:" + mhDTO);
		LOG.debug("mDTO:" + mDTO);

		int deleteHeartResult = musicLikeCntService.deleteHeart(mhDTO);

		if (deleteHeartResult == 1) {

			int heartDown = musicLikeCntService.heartDown(mhDTO);

			if (heartDown == 1) {
				myplayVO.setUserId(mDTO.getUserId());

				LOG.debug("myplayVO:" + myplayVO);

				MyPlayListVO outVO = myPlayListService.selectLikeSeq(myplayVO);

				myplayVO.setMyListSeq(outVO.getMyListSeq());

				if (myplayVO.getMyListSeq() != null) {

					myplayVO.setMusicId(mDTO.getMusicId());

					LOG.debug("myplayVO:" + myplayVO);
					int deleteMusic = myPlayListService.deleteMusic(myplayVO);

					if (deleteMusic == 1) {
						message.setMsgId("1");
						message.setMsgContents("정상적으로 좋아요 취소 완료!!");
						jsonString = new Gson().toJson(message);
						return jsonString;
					} else {
						message.setMsgId("2");
						message.setMsgContents("실패!");
						jsonString = new Gson().toJson(message);
						return jsonString;
					} 
				}else {
						message.setMsgId("2");
						message.setMsgContents("실패!");
						jsonString = new Gson().toJson(message);
						return jsonString;
					}
				} else {
					message.setMsgId("2");
					message.setMsgContents("실패!");
					jsonString = new Gson().toJson(message);
					return jsonString;
			}
		} else {
			message.setMsgId("2");
			message.setMsgContents("실패!");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}	



	@GetMapping("/music_detail")
	public String selectOne(@RequestParam(value = "musicId") String musicId, @ModelAttribute MusicVO inVO, Model model,
			HttpSession httpSession) throws SQLException {
		String view = "/music/music_detail";
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("user");
		MusicHeartDTO to = new MusicHeartDTO();

		if (null != inVO && null != musicId) {
			inVO.setMusicId(musicId);
			if (memberDTO == null) {
				return "redirect:/member/login";
			}
			to.setUserId(memberDTO.getUserId());
			to.setMusicId(musicId);
			httpSession.setAttribute("userId", memberDTO.getUserId());
			LOG.debug("inVO:" + inVO);
			LOG.debug("to:" + to);

			MusicVO musicDetail = musicService.selectOne(inVO);

			model.addAttribute("like", musicLikeCntService.findLike(to));
			model.addAttribute("musicDetail", musicDetail);
			model.addAttribute("inVO", inVO);

			return view;

		} else {

			return "/music/music";
		}

	}

	// 음악 순위 게시판
	@GetMapping("/music_rank")
	public String music_rank(
			@RequestParam(value = "genre", required = false) String genre,
			@RequestParam(value = "feeling", required = false) String feeling,
			MusicVO inVO, Model model) throws SQLException {
		String viewPage = "/music/music_rank";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(100);
		}
		
		// genre
		if (null != inVO && null != genre) {
			inVO.setGenre(genre);
		}
		
		// feeling
		if (null != inVO && null != feeling) {
			inVO.setFeeling(feeling);
		}

		List<MusicVO> musicList = this.musicService.select(inVO);

		model.addAttribute("musicList", musicList);
		model.addAttribute("inVO", inVO);

		return viewPage;

	}

	@GetMapping("")
	public String select(
			@RequestParam(value = "genre", required = false) String genre,
			@RequestParam(value = "feeling", required = false) String feeling,
			MusicVO inVO, Model model)
			throws SQLException {
		String viewPage = "/music/music";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(100);
		}

		// searchWord
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}

		// searchDiv
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv("");
		}

		// genre
		if (null != inVO && null != genre) {
			inVO.setGenre(genre);
		}
		
		// feeling
		if (null != inVO && null != feeling) {
			inVO.setFeeling(feeling);
		}
		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("MUSIC_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);

		// 코드조회: 페이지 사이즈
		codeVO.setCodeId("CMN_PAGE_SIZE");
		List<CodeVO> pageSizeList = codeService.select(codeVO);
		model.addAttribute("pageSizeList", pageSizeList);

		List<MusicVO> musicList = this.musicService.select(inVO);
		model.addAttribute("musicList", musicList);

		// 총글수
		int totalCnt = 0;
		if (null != musicList && musicList.size() > 0) {
			totalCnt = musicList.get(0).getTotalCnt();
		}

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}

	@GetMapping("/music_reg")
	public String select_reg(@RequestParam(value = "music_reg/genre", required = false) String genre, MusicVO inVO,
			Model model) throws SQLException {
		String viewPage = "/music/music_reg";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(50);
		}

		// searchWord
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}

		// searchDiv
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv("");
		}

		// genre
		if (null != inVO && null != genre) {
			inVO.setGenre(genre);
		}
		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("MUSIC_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);

		List<MusicVO> musicList = this.musicService.select(inVO);
		model.addAttribute("musicList", musicList);

		// 총글수
		int totalCnt = 0;
		if (null != musicList && musicList.size() > 0) {
			totalCnt = musicList.get(0).getTotalCnt();
		}

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}

}