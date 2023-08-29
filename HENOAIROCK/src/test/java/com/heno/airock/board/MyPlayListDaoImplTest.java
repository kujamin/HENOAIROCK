package com.heno.airock.board;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.dao.MyPlaylistDao;
import com.heno.airock.dao.MyPlayListDaoImpl;
import com.heno.airock.dto.MyPlayListVO;

@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨택스트 프레임워크의 JUnit 확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메서드를 오름차순으로 정렬한 순서대로 실행
public class MyPlayListDaoImplTest {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MyPlaylistDao dao;
	
	MyPlayListVO myplaylistVO;

	@Before
	public void setUp() throws Exception {
		LOG.debug("*************************");
		LOG.debug("*test 시작~~~~~**");
		LOG.debug("*************************");
		
		assertNotNull(dao);
		
		myplaylistVO = new MyPlayListVO();
		myplaylistVO.setUserId("procss2696@gmail.com");
		myplaylistVO.setFeeling("슬픔");
		myplaylistVO.setPageNo(1);
		myplaylistVO.setPageSize(10);
		myplaylistVO.setMyListDiv(10);

	}
	

	
	@Test
	public void showPlayLists() throws SQLException{
		LOG.debug("=====================");
		LOG.debug("=showPlayLists()==");
		LOG.debug("=====================");
		
		List<MyPlayListVO> list = dao.showPlayLists(myplaylistVO);
	    for (MyPlayListVO item : list) {
	        LOG.debug(item);
	    }
	    
		assertEquals(list.size(), 10);
		
		
	}
		
	@After
	public void tearDown() {
		LOG.debug("--------------");
		LOG.debug("-tearDown-");
		LOG.debug("--------------");
	}

}
