/**
 *<pre>
 * com.pcwk.ehr.cmn
 * Class Name : WorkDiv.java
 * Description : 공통규격 interface
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2023-06-07           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2023-06-07 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.heno.airock.cmn;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.dto.CommentVO;
/**
 * 
 * @author user
 *
 * @param <T>
 */
public interface WorkDiv<T> {
   //CRUD : doSave(),doDelete(),doUpdate(),doSelectOne(),doRetrieve()
	
	
	/**
	 * 등록
	 * @param inVO 
	 * @return T
	 * @throws SQLException
	 */
	public abstract int save(T inVO)throws SQLException;
	
	/**
	 * 삭제
	 * @param inVO
	 * @return T
	 * @throws SQLException
	 */
	int delete(T inVO)throws SQLException;
	
	/**
	 * 수정
	 * @param inVO
	 * @return T
	 * @throws SQLException
	 */
	int update(T inVO)throws SQLException;
	
	/**
	 * 단건 조회
	 * @param inVO
	 * @return T
	 * @throws SQLException
	 */
	T selectOne(T inVO)throws SQLException;
	
	
	
	/**
	 * 목록조회
	 * @param inVO
	 * @return List<T>
	 * @throws SQLException
	 */
	List<T> select(T inVO)throws SQLException;
	
	
	
	
}
