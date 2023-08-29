package com.heno.airock.board;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.service.MyPlayListService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"}) // 테스트 컨텍스트가 자동으로 만들어줄
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MyPlayListServiceTest implements PcwkLoger{
	
	final Logger LOG = LogManager.getLogger(getClass());


	
	@Autowired
	MyPlayListService service;


	MyPlayListVO myplaylistVO;
	MyPlayListVO myplaylistVO1;
	MyPlayListVO myplaylistVO2;
	MyPlayListVO myplaylistVO3;
	MyPlayListVO myplaylistVO4;
	MyPlayListVO myplaylistVO5;

	
	@Before
	public void setUp() {
		
		LOG.debug("*************************");
		LOG.debug("*************************");
		
		// null이 아니면 성공
		myplaylistVO = new MyPlayListVO();
		
		
//		myplaylistVO1 = new MyPlayListVO("Super Shy","NewJeans","NewJeans 2nd EP 'Get Up'","신남");
//		myplaylistVO2 = new MyPlayListVO("Seven (feat. Latto) - Clean Ver.","정국","Seven (feat. Latto) - Clean Ver.","신남");
//		myplaylistVO3 = new MyPlayListVO("ETA","NewJeans","NewJeans 2nd EP 'Get Up'","신남");
//		myplaylistVO4 = new MyPlayListVO("퀸카 (Queencard)","(여자)아이들","I feel","신남");
//		myplaylistVO5 = new MyPlayListVO("I AM","IVE (아이브)","I've IVE","신남");


		//myplaylistVO.setUserId("procss2696@gmail.com");
		myplaylistVO = new MyPlayListVO();
		myplaylistVO.setUserId("procss2696@gmail.com");
		myplaylistVO.setFeeling("슬픔");
		myplaylistVO.setPageNo(1);
		myplaylistVO.setPageSize(10);
		myplaylistVO.setMyListDiv(10);
		
		
	}
	
	@Test
	public void showPlayList() throws SQLException{
		
		LOG.debug("┌───────────────────────────┐");
		LOG.debug("│            showPlaylist   │");
		LOG.debug("└───────────────────────────┘");
		List<MyPlayListVO> list = service.showPlayLists(myplaylistVO);
	    LOG.debug("List: " + list); // list 변수를 출력하여 확인
	    for (MyPlayListVO item : list) {
	        LOG.debug(item);
	    }
		
		
	}
	
	
	@After
	public void tearDown() {
		LOG.debug("--------------");
		LOG.debug("-tearDown-");
		LOG.debug("--------------");
	} // tearDown()

}
