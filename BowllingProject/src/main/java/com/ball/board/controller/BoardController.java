package com.ball.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ball.board.dao.BoardDAO;
import com.ball.board.dto.BoardDTOnotice;
import com.ball.board.dto.BoardDTOplayer;
import com.ball.board.service.BoardService;
import com.ball.common.util.PageMaker;
import com.ball.common.util.SearchCriteria;

//게시판 관리 컨트롤러
@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	/*
	 * @Inject private BoardDAO boardDAO;
	 * 
	 * @Inject private BoardDTOplayer boardDTOplayer;
	 * 
	 * @Inject private BoardDTOnotice boardDTOnotice;
	 */
	
	
	// 게시글 쓰기 화면 불러오기
	@RequestMapping(value = "/boardRegisterForm", method = RequestMethod.GET)
	public String boardRegisterForm() throws Exception {
		
		logger.info("BoardController에서 게시판 화면 불러오기 시작()");
		
		return "/board/boardRegisterForm";
	}
	// 게시글 등록하기 ( 공지 게시판 )
	@ResponseBody
	@RequestMapping(value = "/boardRegister", method = RequestMethod.POST)
	public String boardRegister(BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("BoardController 공지게시판 게시글 등록하기");
		logger.info("BoardDTOnotice의 값 : " + boardDTOnotice);
		
		if(boardService.boardRegister(boardDTOnotice) == 1) {
			// 게시글 등록 완료시
			return "Y";
		} else {
			//게시글 등록 오류시
			return "N";
		}
		
		
	}
	
	//게시글 목록보기 - 공지 게시판
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView boardListNotice(SearchCriteria sCri, BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("BoardController에서 공지게시판 게시글 목록보기 시작");
		
		ModelAndView mav = new ModelAndView("/board/notice");
		
		mav.addObject("searchType", sCri.getSearchType());
		mav.addObject("keyword", sCri.getKeyword());
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(sCri);
		pageMaker.setTotalCount(boardService.boardListnoticeCount(sCri, boardDTOnotice));
		System.out.println("SearchType => " + sCri);
		
		
		List<BoardDTOnotice> boardListnotice = boardService.boardListnotice(sCri);
		
		mav.addObject("boardListnotice", boardListnotice);
		mav.addObject("pageMakernotice", pageMaker);
		
		return mav;
	}
	
	//게시글 목록보기 - 공지사항(notice) 게시판
	
}
	
	


























