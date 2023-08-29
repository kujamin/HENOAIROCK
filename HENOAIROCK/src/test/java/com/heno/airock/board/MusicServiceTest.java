package com.heno.airock.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dao.MusicDao;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.service.MusicService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"}) // 테스트 컨텍스트가 자동으로 만들어줄
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MusicServiceTest implements PcwkLoger {

	@Autowired
	MusicService service;
	
	@Autowired
	MusicDao dao;
	
	MusicVO music01;
	MusicVO music02;
	MusicVO music03;
	MusicVO music04;
	MusicVO music05;
	
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("┌───────┐");
		LOG.debug("│setUp()│");
		LOG.debug("└───────┘");
		
		music01 = new MusicVO("21351", "title", "album", "artist", "lyrics", "genre", "feeling", "album213", "yt1235", "23/8/03", 0, null);	
		music02 = new MusicVO("22315", "title1", "album1","artist1", "lyrics1", "genre1", "feeling1","album124","yt344", "23/08/01", 0, null);
		music03 = new MusicVO("23354", "title2", "album2","artist2","lyrics2","genre2","feeling2","album123","yt233","23/07/01", 0, null);
		music04 = new MusicVO("35234","title3","album3","artist3","lyrics3","genre3","feeling3","album532","yt351","23/04/25", 0, null);
		music05 = new MusicVO("51241","title4","album4","artist4","lyrics4","genre4","feeling4","album424","yt352","23/05/15", 0, null);
		
	}
	
	@Test
	@Ignore
	public void select() throws SQLException{
		service.delete(music01);
		service.delete(music02);
		service.delete(music03);
		service.delete(music04);
		service.delete(music05);
		
		service.save(music01);
		service.save(music02);
		service.save(music03);
		service.save(music04);
		service.save(music05);
		
		
		service.selectOne(music01);
		service.selectOne(music02);
		service.selectOne(music03);
		service.selectOne(music04);
		service.selectOne(music05);
		
		MusicVO vo = dao.selectOne(music01);
		LOG.debug("┌──┐");
		LOG.debug("│vo│"+vo);
		LOG.debug("└──┘");
		
	}

	
	
	
	
	
	@Test
	public void bean() {
		LOG.debug("┌────────────┐");
		LOG.debug("│bean service│"+service);
		LOG.debug("└────────────┘");
		
		assertNotNull(service);
	}

}
