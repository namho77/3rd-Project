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
	public List<BoardVO> listPage(int start, int end) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String ,Object>();
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		return sqlSession.selectList(namespace + ".listPage", paramMap);	
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTotalCount");
	}
	
	@Override
	public BoardDTO view(Integer boardSrl) throws Exception{
		return sqlSession.selectOne(namespace + ".view", boardSrl);
	}
	

	
	
	
	@Override
	public BoardVO read(Integer bno) throws Exception {
		return sqlSession.selectOne(namespace + ".read", bno);
	}
	
	
	
	@Override
	public void write(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		//sqlSession.insert(namespace + ".create", vo);
		
		//return session.selectOne(namespace + ".read", bno);
	}
	

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
