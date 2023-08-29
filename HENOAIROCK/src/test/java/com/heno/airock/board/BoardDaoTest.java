package com.heno.airock.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

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
import com.heno.airock.dao.CodeDao;
import com.heno.airock.dao.PostDao;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.PostVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"}) // 테스트 컨텍스트가 자동으로 만들어줄
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class BoardDaoTest implements PcwkLoger{
	
	@Autowired
	PostDao dao;
	
	@Autowired
	CodeDao codeDao;
	
	PostVO board01;
	PostVO board02;
	PostVO board03;
	
	PostVO search;
	
	CodeVO codeVO;
	
	@Before
	public void setUp() throws Exception {
//		board01 = new PostVO("33", "kjmin1124@naver.com", "test_title3", "test_contents3", 0, 0, "등록일 x", "등록일 x", "10", "x");
//		board02 = new PostVO("43", "kjmin1124@naver.com", "test_title4", "test_contents4", 0, 0, "등록일 x", "등록일 x", "20", "x");
//		board03 = new PostVO("53", "kjmin1124@naver.com", "test_title5", "test_contents5", 0, 0, "등록일 x", "등록일 x", "20", "x");
//		
//		search = new PostVO("3", "kjmin1124@naver.com", "test", "test", 0, 0, "등록일x", "수정일x", "10", "x");
		
		codeVO = new CodeVO();
	}
	
	@Test
	@Ignore
	public void codeDoRetrieve() throws SQLException {
		codeVO.setCodeId("BOARD_SEARCH");
		List<CodeVO> list = codeDao.select(codeVO);
		assertEquals(3, list.size());
	}
	
	@Test
	public void selectall() throws SQLException {
		//1. 삭제
		//2. 등록
		//3. 조회
		//4. 조회 데이터 비교
		dao.delete(board01);
		dao.delete(board02);
		dao.delete(board03);
		
		dao.save(board01);
		dao.save(board02);
		dao.save(board03);
		
		//pageSize
		search.setSearchDiv("10");//제목 검색
		search.setSearchWord("test");
		search.setPageSize(10);
		search.setPageNo(1);
		List<PostVO> list = dao.select(search);
		for(PostVO vo: list) {
			LOG.debug("┌──────────────────────────────┐");
			LOG.debug("│vo	                          │" + vo);
		}
		assertEquals(2, list.size());
		
	}
	
	@Test
	public void addAndGet() throws SQLException {
		//1. 삭제
		//2. 등록
		//3. 조회
		//4. 조회 데이터 비교
		dao.delete(board01);
		dao.delete(board02);
		dao.delete(board03);
		
		dao.save(board01);
		dao.save(board02);
		dao.save(board03);
		
		PostVO outVO01 = dao.selectOne(board01);
		PostVO outVO02 = dao.selectOne(board02);
		PostVO outVO03 = dao.selectOne(board03);
		
		isSameData(outVO01,board01);
		isSameData(outVO02,board02);
		isSameData(outVO03,board03);
		
	}
	private void isSameData(PostVO outVO01, PostVO board01) {
		assertEquals(outVO01.getPostSeq(), board01.getPostSeq());
		assertEquals(outVO01.getPostTitle(), board01.getPostTitle());
		assertEquals(outVO01.getPostContents(), board01.getPostContents());
		assertEquals(outVO01.getUserId(), board01.getUserId());
	}
	
	@Test
	@Ignore
	public void bean() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│bean                          │");
		LOG.debug("│dao                           │"+dao);
		LOG.debug("│codeDao                       │"+codeDao);
		LOG.debug("└──────────────────────────────┘");	
		
		assertNotNull(codeDao);
		assertNotNull(dao);
	}
	
}
