package com.ball.board.dao;

import java.util.List;

import com.ball.board.dto.BoardDTOnotice;
import com.ball.common.util.SearchCriteria;

public interface BoardDAO {

	
	//게시글 등록하기 처리하기 - 공지 게시판
	public int boardRegister(BoardDTOnotice boardDTOnotice) throws Exception;
	
	//전체 글 목록 갯수 - 공지 게시판
	public int boardListnoticeCount(SearchCriteria sCri, BoardDTOnotice boardDTOnotice) throws Exception;
	
	//전체 글 목록 - 공지 게시판
	public List<BoardDTOnotice> boardListnotice(SearchCriteria sCri) throws Exception;
	
	// 게시글 조회수 증가에 대한 로직 - 공지게시판
	public void updateReadCountNotice(int bno) throws Exception;
	
	//게시글번호에 해당하는 게시글 상세 조회 - 공지 게시판
	public BoardDTOnotice boardDetailnotice(int bno, int flag) throws Exception;

	//게시글 번호에 해당하는 게시글 수정 - 공지 게시판
	public int boardUpdatenotice(BoardDTOnotice boardDTOnotice) throws Exception;

	//게시글 번호에 해당하는 게시글 삭제 - 공지 게시판
	public int boardDeletenotice(int bno) throws Exception;
}
