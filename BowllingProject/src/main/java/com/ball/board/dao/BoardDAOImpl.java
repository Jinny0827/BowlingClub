package com.ball.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ball.board.dto.BoardDTOnotice;
import com.ball.common.util.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	//sql세션을 가져오자
	@Autowired
	private SqlSession sqlSession;
	
	//Namespace 가져오자 - xml의 namespace와 동일해야 한다.(대소문자 구별주의)
	private static String Namespace = "com.ball.board";

	//게시글 등록하기 처리 - 공지 게시판
	@Override
	public int boardRegister(BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("boardDAOImpl에서 공지 게시판 게시글 등록하기");
		
		return sqlSession.insert(Namespace + ".boardRegister", boardDTOnotice);
	}
	
	 
	//전체 글 갯수 - 공지 게시판
	@Override
	public int boardListnoticeCount(SearchCriteria sCri, BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("boardDAO의 공지 게시판 전체 글 갯수 시작");
		
		HashMap<String, Object> notice = new HashMap<String, Object>();
		notice.put("sCri", sCri);
		notice.put("boardDTOnotice", boardDTOnotice);
		
		
		return sqlSession.selectOne(Namespace + ".boardListnoticeCount", notice);
	}

	//전체 글 목록 - 공지 게시판
	@Override
	public List<BoardDTOnotice> boardListnotice(SearchCriteria sCri) throws Exception {
		
		logger.info("boardDAO의 공지 게시판 전체 글 목록");
		
		return sqlSession.selectList(Namespace + ".boardListnotice", sCri);
	}
	
	//게시글 조회수 증가에 대한 로직 - 공지게시판
	@Override
	public void updateReadCountNotice(int bno) {
		
		logger.info("BoardDAOImpl 공지 게시판 게시글 조회수 증가 로직 시작");
		
		sqlSession.update(Namespace + ".updateReadCountNotice", bno);
	}
	
	//게시글 번호에 해당하는 게시글 상세 조회 - 공지 게시판
	@Override
	public BoardDTOnotice boardDetailnotice(int bno, int flag) {
		
		logger.info("BoardDAOImpl 공지 게시판 게시글 상세 조회 시작");
		
		return sqlSession.selectOne(Namespace + ".boardDetailnotice", bno);
	}
	// 게시글 번호에 해당하는 게시글 수정 - 공지 게시판
	@Override
	public int boardUpdatenotice(BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("BoardDAOImpl에서 게시글에 해당하는 공지게시판 게시글 수정 시작");
		
		return sqlSession.update(Namespace + ".boardUpdatenotice", boardDTOnotice);
	}
	// 게시글 번호에 해당하는 게시글 삭제 - 공지 게시판
	@Override
	public int boardDeletenotice(int bno) throws Exception {
		
		logger.info("BoardDAOImpl에서 게시글에 해당하는 공지 게시판 게시글 삭제");
		
		return sqlSession.delete(Namespace + ".boardDeletenotice", bno);
	}
}
