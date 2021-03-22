package edu.bit.ex.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.BoardService;
import edu.bit.ex.service.FileService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctImageVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/board/*")
public class BoardController {
	private BoardService boardService;
	private FileService fileSerive;

	// 페이징을 이용한 공지사항 게시판 리스트
	@Transactional
	@GetMapping("/notice")
	public ModelAndView noticeList(Criteria cri, ModelAndView mav) {// Criteria cri
		log.info("noticeList...");
		log.info(cri.toString());
		mav.setViewName("board/notice_list");
		mav.addObject("notice_list", boardService.getNoticeList(cri));

		int total = boardService.getTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// 공지사항 게시글
	@GetMapping("/notice/{board_id}")
	public ModelAndView noticeContent(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeContent...");
		mav.setViewName("board/notice_content");
		mav.addObject("notice_content", boardService.getNoticeContent(boardVO.getBoard_id()));
		return mav;
	}

	// 공지사항 삭제
	@DeleteMapping("/notice/{board_id}")
	public ResponseEntity<String> noticeDelete(BoardVO boardVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("noticeDelete...");

		try {
			boardService.noticeRemove(boardVO.getBoard_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 공지사항 수정페이지
	@GetMapping("/notice/modify/{board_id}")
	public ModelAndView noticeModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeModifyView...");
		mav.setViewName("board/notice_modify");
		mav.addObject("notice_modify", boardService.getNoticeContent(boardVO.getBoard_id()));
		return mav;
	}

	// 공지사항 수정
	@PutMapping("/notice/modify/{board_id}")
	public ResponseEntity<String> noticeModify(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("noticeModify..");
		try {
			boardService.setNoticeModify(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 공지사항 작성페이지
	@GetMapping("/notice/write")
	public ModelAndView noticeWriteView(MbrVO mbrVO, ModelAndView mav) {
		log.info("noticeWriteView...");
		mav.setViewName("board/notice_write");
		mav.addObject("notice_write", boardService.getNoticeMember(mbrVO.getMbr_id()));
		return mav;
	}

	// 공지사항 작성
	@PutMapping("/notice/write")
	public ResponseEntity<String> noticeWrite(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("noticeWrite..");
		try {
			boardService.setNoticeWrite(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 게시판 리스트
	@GetMapping("/magazine")
	public ModelAndView magazineList(ModelAndView mav) {
		log.info("magazineList...");
		mav.setViewName("board/magazine_list");
		mav.addObject("magazine_list", boardService.getMagazineList());
		return mav;
	}

	// 매거진 게시글
	@GetMapping("/magazine/{board_id}")
	public ModelAndView magazineContent(BoardVO boardVO, PrdctImageVO prdctImageVO, ModelAndView mav) {
		log.info("magazineContent...");
		mav.setViewName("board/magazine_content");
		mav.addObject("magazine_content", boardService.getMagazineContent(boardVO.getBoard_id()));
		mav.addObject("magazine_img", fileSerive.getMagazineImage(prdctImageVO.getImage_number()));
		return mav;
	}
}