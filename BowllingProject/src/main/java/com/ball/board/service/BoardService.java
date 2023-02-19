package com.ball.board.service;

import java.util.List;

import com.ball.board.dto.BoardDTOnotice;
import com.ball.common.util.SearchCriteria;

public interface BoardService {
	
	
	// 게시글 등록하기 처리 - 공지 게시판
	public int boardRegister(BoardDTOnotice boardDTOnotice) throws Exception;

	//게시글 총 갯수 - 공지 게시판 
	public int boardListnoticeCount(SearchCriteria sCri, BoardDTOnotice boardDTOnotice) throws Exception;
	  
	//게시글 목록보기 - 공지 게시판 
	public List<BoardDTOnotice> boardListnotice(SearchCriteria sCri) throws Exception;
	 
	//게시글 번호에 해당하는 게시글 상세 조회 - 공지 게시판
	public BoardDTOnotice boardDetailnotice(int bno, int flag) throws Exception;

	//게시글 번호에 해당하는 게시글 수정 - 공지 게시판
	public int boardUpdatenotice(BoardDTOnotice boardDTOnotice) throws Exception;

	//게시글 번호에 해당하는 게시글 삭제 - 공지 게시판
	public int boardDeletenotice(int bno) throws Exception;	
}
