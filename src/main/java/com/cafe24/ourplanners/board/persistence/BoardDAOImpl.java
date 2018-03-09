package com.cafe24.ourplanners.board.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.dto.BoardDTO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;
import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosmo.mapper.BoardMapper";
	
	/*@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList(namespace + ".list");	
	}*/
	
	@Override
	public List<BoardVO> getBoardListJson(SearchServiceBoardCriteria scri) {
		return sqlSession.selectList(namespace + ".getBoardListJson", scri);
	}
	
	@Override
	public int getTotalCount(SearchServiceBoardCriteria scri) {
		return sqlSession.selectOne(namespace + ".getTotalCount", scri);
	}
	
	@Override
	public List<BoardVO> listPage(int start, int end) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String ,Object>();
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		return sqlSession.selectList(namespace + ".listPage", paramMap);	
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTotalCount1");
	}
	
	@Override
	public BoardVO view(Integer boardSrl) throws Exception{
		return sqlSession.selectOne(namespace + ".view", boardSrl);
	}
	
	@Override
	public void visitCount(Integer boardSrl) throws Exception {
		sqlSession.update(namespace + ".visitCount", boardSrl);
	}
	
	@Override
	public int write(BoardDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".insert", dto); 
	}
	
	@Override
	public BoardVO modify(Integer board_srl) {
		return sqlSession.selectOne(namespace + ".modify", board_srl);
	}
	
	@Override
	public int modifyAction(BoardDTO dto) throws Exception {
		return sqlSession.update(namespace + ".modifyAction", dto); 
	}
	
	@Override
	public int delete(Integer board_srl) throws Exception {
		return sqlSession.delete(namespace + ".delete", board_srl); 
	}
}
