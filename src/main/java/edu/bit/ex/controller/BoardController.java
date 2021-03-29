package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.MagazinePageVO;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.page.NoticePageVO;
import edu.bit.ex.service.BoardService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService boardService;

	// 페이징을 이용한 공지사항 게시판 리스트
	@Transactional
	@GetMapping("/notice")
	public ModelAndView noticeList(NoticeCriteria cri, ModelAndView mav) {
		log.info("noticeList...");
		log.info(cri.toString());
		mav.setViewName("board/notice_list");
		mav.addObject("notice_list", boardService.getNoticeList(cri));

		int total = boardService.getNoticeTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new NoticePageVO(cri, total));

		return mav;
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
	@PostMapping("/notice/write")
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

	// 공지사항 게시글
	@GetMapping("/notice/{board_id}")
	public ModelAndView noticeContent(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeContent...");
		mav.setViewName("board/notice_content");
		mav.addObject("notice_content", boardService.getNoticeContent(boardVO.getBoard_id()));
		return mav;
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
	@PostMapping("/notice/modify/{board_id}")
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

	// 공지사항 삭제
	@DeleteMapping("/notice/modify/{board_id}")
	public ResponseEntity<String> noticeDelete(BoardVO boardVO) {
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

	// 페이징을 적용한 매거진 게시판 리스트
	@Transactional
	@GetMapping("/magazine")
	public ModelAndView magazineList(BoardVO boardVO, BoardPrdctImageVO bPrdctImageVO, MagazineCriteria cri, ModelAndView mav) {
		log.info("magazineList...");
		mav.setViewName("board/magazine_list");
		mav.addObject("magazine_list", boardService.getMagazineList(cri));

		int total = boardService.getMagazineTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MagazinePageVO(cri, total));
		return mav;
	}

	// 매거진 작성페이지
	@GetMapping("/magazine/write")
	public ModelAndView magazineWriteView(MbrVO mbrVO, ModelAndView mav) {
		log.info("magazineWriteView...");
		mav.setViewName("board/magazine_write");
		mav.addObject("magazine_write", boardService.getMagazineMember(mbrVO.getMbr_id()));
		return mav;
	}

	// 매거진 작성
	@PostMapping("/magazine/write")
	public ResponseEntity<String> magazineWrite(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineWrite..");
		try {
			boardService.setMagazineWrite(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 게시글
	@Transactional
	@GetMapping("/magazine/{board_id}")
	public ModelAndView magazineContent(MbrVO mbrVO, BoardVO boardVO, MagazineCommentCriteria cri, ModelAndView mav) {
		log.info("magazineContent...");
		mav.setViewName("board/magazine_content");
		// 매거진 내용
		mav.addObject("magazine_content", boardService.getMagazineContent(boardVO.getBoard_id()));
		// 매거진 사진
		mav.addObject("magazine_img", boardService.getMagazineImage(boardVO.getBoard_id()));
		// 매거진 댓글 수 불러오기
		mav.addObject("magazine_comment_cnt", boardService.getMagazineCommentCnt(mbrVO.getMbr_id(), boardVO.getBoard_id()));
		// 페이징을 적용한 매거진 댓글 불러오기
		mav.addObject("magazine_comment", boardService.getMagazineComment(mbrVO.getMbr_id(), boardVO.getBoard_id()));
		/* mav.addObject("magazine_comment", boardService.getMagazineComment(mbrVO.getMbr_id(), boardVO.getBoard_id(), cri)); */

		/*
		 * int total = boardService.getMagazineCommentTotal(cri); log.info("total" + total); mav.addObject("pageMaker", new MagazineCommentPageVO(cri,
		 * total));
		 */
		return mav;
	}

	// 매거진 게시글 추천
	@PutMapping("/magazine/{board_id}")
	public ResponseEntity<String> magazineUpLike(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineUpLike...");

		try {
			boardService.magazineUpLike(boardVO.getBoard_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 매거진 게시글 댓글 작성
	@PostMapping("magazine/{board_id}")
	public ResponseEntity<String> magazineCommentWrite(@RequestBody BoardBoardCommentVO boardBoardCommentVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineCommentWrite...");
		try {
			boardService.setMagazineCommentWrite(boardBoardCommentVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 댓글 삭제(오류수정할것)
	@DeleteMapping("/magazine/{board_id}")
	public ResponseEntity<String> magazineCommentDelete(BoardCommentVO boardCommentVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineDelete...");

		try {
			boardService.magazineCommentRemove(boardCommentVO.getComment_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 매거진 수정페이지
	@GetMapping("/magazine/modify/{board_id}")
	public ModelAndView magazineModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("magazineModifyView...");
		mav.setViewName("board/magazine_modify");
		mav.addObject("magazine_modify", boardService.getMagazineContent(boardVO.getBoard_id()));
		return mav;
	}

	// 매거진 수정
	@PostMapping("/magazine/modify/{board_id}")
	public ResponseEntity<String> magazineModify(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineModify..");
		try {
			boardService.setMagazineModify(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 삭제
	@DeleteMapping("/magazine/modify/{board_id}")
	public ResponseEntity<String> magazineDelete(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineDelete...");

		try {
			// boardService.magazineRemove(boardVO.getBoard_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}