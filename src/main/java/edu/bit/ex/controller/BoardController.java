package edu.bit.ex.controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/board/*")
public class BoardController {
	private BoardService boardService;

	// 페이징을 이용한 공지사항 게시판 리스트
	@Transactional
	@GetMapping("/notice")
	public ModelAndView noticeList(ModelAndView mav) {
		log.info("noticeList...");
		mav.setViewName("board/notice_list");
		mav.addObject("notice_list", boardService.getNoticeList());
		/*
		 * int total = boardService.getTotal(cri); log.info("total" + total); mav.addObject("pageMaker", new PageVO(cri, total));
		 */
		return mav;
	}

}