package com.ball.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ball.board.dto.BoardDTOnotice;
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
		
		logger.info("BoardController에서 공지 게시판 작성 화면 불러오기 시작()");
		
		return "/board/boardRegisterForm";
	}
	// 게시글 등록하기 ( 공지 게시판 )
	@ResponseBody
	@RequestMapping(value = "/boardRegisternotice", method = RequestMethod.POST)
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
	// 공지게시판 게시글 번호에 해당하는 게시글 상세 조회 - 조회수 증가 비지니스 로직추가
	@RequestMapping(value = "/boardDetailnotice", method = RequestMethod.GET)
	public String boardDetail(Model model, HttpServletRequest request) throws Exception {
		
		logger.info("boardController에서 공지 게시글 상세조회 시작");
		
		//게시글 조회시에만 조회수가 증가할수있게 비지니스 로직을 짜준다.
		int bno = Integer.parseInt((String) request.getParameter("bno"));
		int flag = Integer.parseInt((String) request.getParameter("flag"));
		
		// 게시글 번호에 해당하는 게시글의 상세내용을 조회해올 수 있게 구현
		BoardDTOnotice boardDTOnotice = boardService.boardDetailnotice(bno, flag);
		
		//응답 경로에 보내줄 데이터 정보 - boardDTOnotice로 받아온 값들
		model.addAttribute("noticeDetail", boardDTOnotice);
		
		//응답 경로
		return "/board/boardDetailnotice";
	}
	// 공지 게시판 수정 화면 불러오기
	@RequestMapping(value = "/boardUpdatenoticeForm", method = RequestMethod.POST)
	public String boardUpdatenoticeForm(Model model, HttpServletRequest request) throws Exception {
		
		logger.info("BoardController에서 공지 게시판 수정 화면 불러오기 시작");
		
		int bno = Integer.parseInt((String)request.getParameter("bno"));
		int flag = Integer.parseInt((String) request.getParameter("flag"));
		
		BoardDTOnotice boardDTOnotice = boardService.boardDetailnotice(bno, flag);
		
		model.addAttribute("NoticeDetail", boardDTOnotice);
		
		return "/board/boardUpdatenotice";
	}
	//게시글 번호에 해당하는 게시글 내용 수정하기 - 공지 게시판
	//Ajax(비동기 통신 사용)
	@ResponseBody
	@RequestMapping(value = "/boardUpdatenotice", method = RequestMethod.POST)
	public String boardUpdatenotice(Model model, BoardDTOnotice boardDTOnotice) throws Exception {
		
		logger.info("BoardController에서 게시글 번호에 해당하는 게시글 수정 시작");
		
		if(boardService.boardUpdatenotice(boardDTOnotice) == 1) {
			return "Y";
		} else {
			return "N";
		}
		
	}
	//게시글 번호에 해당하는 게시글 삭제하기.
	// ajax, POST
	@ResponseBody
	@RequestMapping(value = "/boardDeletenotice", method = RequestMethod.POST)
	public String boardDeletenotice(Model model, HttpServletRequest request) throws Exception {
		
		logger.info("BoardController에서 공지 게시글 삭제하기 시작");
		
		if(boardService.boardDeletenotice(Integer.parseInt((String) request.getParameter("bno"))) == 1) {
		return "Y";	
		} else { 
		return "N";
		}
		
		
	}
	//게시글 목록보기 - 공지사항(notice) 게시판
	
}

	
	


























