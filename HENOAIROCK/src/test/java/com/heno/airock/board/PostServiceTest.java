package com.heno.airock.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dao.PostDao;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.PostService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"}) // 테스트 컨텍스트가 자동으로 만들어줄
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class PostServiceTest implements PcwkLoger{
	
	@Autowired
	PostService service;
	
	@Autowired
	PostDao dao;
	
	PostVO board01;
	PostVO board02;
	PostVO board03;
	PostVO board04;
	PostVO board05;
	
	PostVO search;

	@Before
	public void setUp() throws Exception {
//		board01 = new PostVO("33", "kjmin1124@naver.com", "test_title3", "test_contents3", 0, 0, "등록일 x", "등록일 x", "10", "x");
//		board02 = new PostVO("43", "kjmin1124@naver.com", "test_title4", "test_contents4", 0, 0, "등록일 x", "등록일 x", "20", "x");
//		board03 = new PostVO("53", "kjmin1124@naver.com", "test_title5", "test_contents5", 0, 0, "등록일 x", "등록일 x", "20", "x");
//		
//		search = new PostVO("3", "kjmin1124@naver.com", "test", "test", 0, 0, "등록일x", "수정일x", "10", "x");
	}

	@Test
	public void select() throws SQLException {
		service.delete(board01);
		service.delete(board02);
		service.delete(board03);
		

		service.save(board01);
		service.save(board02);
		service.save(board03);
		
		service.select(board01);
		
		service.selectOne(board01);
		service.selectOne(board01);
		service.selectOne(board01);
		
		PostVO vo = dao.selectOne(board01);
		LOG.debug("│vo                          │"+vo);
		assertEquals(3, vo.getReadCnt());
		
	}
	
	@Test
	public void bean() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│bean                          │");
		LOG.debug("│service                       │"+service);
		LOG.debug("└──────────────────────────────┘");		
		
		assertNotNull(service);
	}

}
