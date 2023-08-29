package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.MyPlaylistDao;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.MyPlayListVO;

@Service
public class MyPlayListServiceImpl implements MyPlayListService {
	
	@Autowired
	MyPlaylistDao dao;
	
	@Override
	public int save(MyPlayListVO inVO) throws SQLException {
		return dao.save(inVO);
	}

	@Override
	public int delete(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MyPlayListVO selectOne(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyPlayListVO> showPlayLists(MyPlayListVO inVO) throws SQLException {
		
		return dao.showPlayLists(inVO);
	}

	@Override
	public List<MyPlayListVO> select(MyPlayListVO inVO) throws SQLException {
		return dao.select(inVO);
	}

	@Override
	public int saveMusic(MyPlayListVO inVO) throws SQLException {
		return dao.saveMusic(inVO);
	}

	@Override
	public MyPlayListVO selectLikeSeq(MyPlayListVO inVO) throws SQLException {
		return dao.selectLikeList(inVO);
	}
	
	@Override
	public int deleteMusic(MyPlayListVO inVO) throws SQLException {
		return dao.deleteMusic(inVO);
	}

	@Override
	public List<MyPlayListVO> selectCustomSeq(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectCustomList(inVO);
	}
	
	@Override
	public List<MusicVO> selectCustomListMusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectCustomListMusic(inVO);
	}

	@Override
	public int addCustomList(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.addCustomList(inVO);
	}

	@Override
	public int delCustomList(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.delCustomList(inVO);
	}

	@Override
	public MyPlayListVO selectCustom(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectCustom(inVO);
	}

	@Override
	public int delCustomListMusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.delCustomListMusic(inVO);
	}

	@Override
	public int modCustomTitle(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.modCustomTitle(inVO);
	}

	@Override
	public List<MusicVO> selmusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selmusic(inVO);
	}

	@Override
	public int addCustom(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.addCustom(inVO);
	}

	@Override
	public MemberDTO selMypageProfile(MemberDTO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selMypageProfile(inVO);
	}
	

}
