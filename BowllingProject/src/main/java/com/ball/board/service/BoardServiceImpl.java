package com.ball.board.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ball.board.dao.BoardDAO;
import com.ball.board.dto.BoardDTOnotice;
import com.ball.common.util.SearchCriteria;

import lombok.extern.slf4j.Slf4j;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
		
	

	@Inject
	private BoardDAO boardDAO;

	// 게시글 작성 - 공지 게시판
	@Override
	public int boardRegister(BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("BoardServiceImpl 공지게시판 게시글 등록 처리 시작");
		
		return boardDAO.boardRegister(boardDTOnotice);
	}
	
	
	
	  //전체 게시글 갯수 - 공지 게시판
	  
	  @Override 
	  public int boardListnoticeCount(SearchCriteria sCri, BoardDTOnotice
	  boardDTOnotice) throws Exception {
	  
	  logger.info("boardServiceImpl에서 공지 게시판의 전체 게시글 갯수");
	  
	  return boardDAO.boardListnoticeCount(sCri, boardDTOnotice); } //공지 게시판의 전체 게시글 목록
	 
	  // 게시글 목록 - 공지 게시판
	  @Override 
	  public List<BoardDTOnotice> boardListnotice(SearchCriteria sCri)
	  throws Exception {
	  
	  logger.info("boardServiceImpl에서 공지 게시판의 전체 게시글 목록");
	  
	  return boardDAO.boardListnotice(sCri); }
	 
	  
	  // 게시글 번호에 해당하는 게시글 상세 조회 - 공지 게시판
	  @Override
	public BoardDTOnotice boardDetailnotice(int bno, int flag) throws Exception {
		
		  logger.info("boardServiceImpl에서 공지 게시글 상세조회 시작");
		  
		 //url 뒤에 붙는 flag값이 0이면 조회수를 증가시키고
		 //1이면 조회수를 증가시키지 않는다. -> 비지니스 로직
		  if(flag == 0) {
			  boardDAO.updateReadCountNotice(bno);
		  }
		  
		return boardDAO.boardDetailnotice(bno, flag);
	}
	  
	  // 게시글 번호에 해당하는 게시글 수정 - 공지 게시판
	  @Override
	public int boardUpdatenotice(BoardDTOnotice boardDTOnotice) throws Exception {
		  
		  logger.info("boardServiceImpl에서 게시글에 해당하는 공지게시판 게시글 수정 시작");
		
		  return boardDAO.boardUpdatenotice(boardDTOnotice);
	}
	//게시글 번호에 해당하는 게시글 삭제 - 공지 게시판
	@Override
	public int boardDeletenotice(int bno) throws Exception {
		
		logger.info("boardServiceImpl에서 공지게시판 게시글 삭제하기 시작");
		
		return boardDAO.boardDeletenotice(bno);
	}
	  
}

