package com.cafe24.ourplanners.search.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ourplanners.board.domain.BoardVO;
import com.cafe24.ourplanners.board.domain.SubCategoryVO;
import com.cafe24.ourplanners.board.domain.WordCloudVO;
import com.cafe24.ourplanners.util.Criteria;
import com.cafe24.ourplanners.util.SearchCriteria;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sqlSession;

	private static String namespace2 = "com.kosmo.mapper.SearchMapper";
	private static String namespace3 = "com.kosmo.mapper.WordCloudMapper";
	
	@Override
	public List<BoardVO> getHotServiceList(Criteria cri) {
		
		 return sqlSession.selectList(namespace2 + ".getHotServiceList", cri);		 
		 
	}
	@Override
	public List<WordCloudVO> getHotKeyWordList(Criteria cri) {
		
		return sqlSession.selectList(namespace3 + ".getHotWordCloud", cri);
	}
	@Override
	public List<SubCategoryVO> getSubCategoryListSearch(SubCategoryVO vo) {
		 return sqlSession.selectList(namespace2 + ".getSubCategoryListSearch", vo);		 
	}
	
	@Override
	public List<BoardVO> getServiceListSearch(SearchCriteria scri) {
		 return sqlSession.selectList(namespace2 + ".getServiceListSearch", scri);		 
	}
}
