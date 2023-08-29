package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.cmn.StringUtil;

@Repository
public class MyPlayListDaoImpl implements MyPlaylistDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int save(MyPlayListVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("MyPlayList.LikeListSave", inVO);
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
	public List<MyPlayListVO> select(MyPlayListVO inVO) throws SQLException {
		
		return sqlSessionTemplate.selectList("MyPlayList.likeList", inVO);
	}

	
	@Override
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException {
		
		return sqlSessionTemplate.selectList("MyPlayList.selectList", myPlayListVO);
	}

	@Override
	public List<MyPlayListVO> useradd(MyPlayListVO myPlayListVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveMusic(MyPlayListVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("MyPlayList.saveLikeMusic", inVO);
	}

	@Override
	public MyPlayListVO selectLikeList(MyPlayListVO inVO) throws SQLException {
		return sqlSessionTemplate.selectOne("MyPlayList.selectLikeSeq", inVO);
	}
	
	@Override
	public int deleteMusic(MyPlayListVO inVO) throws SQLException {
		
		return sqlSessionTemplate.delete("MyPlayList.deleteLikeMusic", inVO);
	}

	@Override
	public List<MyPlayListVO> selectCustomList(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("MyPlayList.selectCustomSeq", inVO);
	}

	@Override
	public List<MusicVO> selectCustomListMusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("MyPlayList.selectCustomListMusic", inVO);
	}

	@Override
	public int addCustomList(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		
		String seq = StringUtil.getPK();
		inVO.setMyListSeq(seq);
		
		return sqlSessionTemplate.insert("MyPlayList.addCustomList", inVO);
	}

	@Override
	public int delCustomList(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("MyPlayList.delCustomList", inVO);
	}

	@Override
	public MyPlayListVO selectCustom(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("MyPlayList.selectCustom", inVO);
	}

	@Override
	public int delCustomListMusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("MyPlayList.delCustomListMusic", inVO);
	}

	@Override
	public int modCustomTitle(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("MyPlayList.modCustomTitle", inVO);
	}

	@Override
	public List<MusicVO> selmusic(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("MyPlayList.selmusic", inVO);
	}

	@Override
	public int addCustom(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("MyPlayList.addCustom", inVO);
	}

	@Override
	public MemberDTO selMypageProfile(MemberDTO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("MyPlayList.selMypageProfile", inVO);
	}
	

}








