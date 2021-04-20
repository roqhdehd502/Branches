package edu.bit.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCommentPageVO;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.MagazinePageVO;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.page.NoticePageVO;
import edu.bit.ex.service.BoardService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class BoardController {
	@Autowired
	private SecurityService securityService;
	@Autowired
	private BoardService boardService;

	// 페이징을 이용한 공지사항 게시판 리스트
	@GetMapping("/board/notice")
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

	// 공지사항 작성페이지(관리자)
	@GetMapping("/admin/board/notice/write")
	public ModelAndView noticeWriteView(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) {
		log.info("noticeWriteView...");
		mav.setViewName("board/notice_write");
		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		return mav;
	}

	// 공지사항 작성(관리자)
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/admin/board/notice/write")
	public ResponseEntity<String> noticeWrite(@RequestBody BoardVO boardVO) {
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
	@GetMapping("/board/notice/{board_id}")
	public ModelAndView noticeContent(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeContent...");
		mav.setViewName("board/notice_content");
		mav.addObject("notice_content", boardService.getNoticeContent(boardVO.getBoard_id()));

		return mav;
	}

	// 공지사항 수정페이지(관리자)
	@GetMapping("/admin/board/notice/modify/{board_id}")
	public ModelAndView noticeModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeModifyView...");
		mav.setViewName("board/notice_modify");
		mav.addObject("notice_modify", boardService.getNoticeContent(boardVO.getBoard_id()));

		return mav;
	}

	// 공지사항 수정(관리자)
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/admin/board/notice/modify/{board_id}")
	public ResponseEntity<String> noticeModify(@RequestBody BoardVO boardVO) {
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

	// 공지사항 삭제(관리자)
	@Transactional(rollbackFor = Exception.class)
	@DeleteMapping("/admin/board/notice/modify/{board_id}")
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
	@GetMapping("/board/magazine")
	public ModelAndView magazineList(MagazineCriteria cri, ModelAndView mav) {
		log.info("magazineList...");
		mav.setViewName("board/magazine_list");
		mav.addObject("magazine_list", boardService.getMagazineList(cri));

		int total = boardService.getMagazineTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MagazinePageVO(cri, total));

		return mav;
	}

	// 매거진 작성페이지(관리자)
	@GetMapping("/admin/board/magazine/write")
	public ModelAndView magazineWriteView(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) {
		log.info("magazineWriteView...");
		mav.setViewName("board/magazine_write");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		return mav;
	}

	// 첨부사진 업로드(관리자)
	// CKEditor의 경우 이미지를 첨부할때 서버에 선 등록후 게시글이 submit이 될 때 같이 적용된다
	@Transactional(rollbackFor = Exception.class)
	@RequestMapping("/admin/board/boardImageUpload.do")
	public void magazineImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		log.info("magazineImageUpload...");
		boardService.magazineImageUpload(request, response, upload);
	}

	// 매거진 작성(관리자)
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/admin/board/magazine/write")
	public ResponseEntity<String> magazineWrite(BoardVO boardVO) {
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
	@GetMapping("/board/magazine/{board_id}")
	public ModelAndView magazineContent(@AuthenticationPrincipal MemberDetails memberDetails, MbrVO mbrVO, BoardVO boardVO,
			MagazineCommentCriteria cri, ModelAndView mav) {
		log.info("magazineContent...");
		mav.setViewName("board/magazine_content");

		// MemberDetails이 null일 때 ModelAndView에 addObject를 하면 예외처리가 된다
		// 따라서 null일 때(로그인 상태가 아닐때) 해당 정보를 addObject 하지 않고 페이지를 출력한다
		if (memberDetails != null) {
			// 인증 회원 정보
			MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
			// 회원 정보 받아오기
			mav.addObject("mbr", getMbr);
		}

		// 매거진 내용
		mav.addObject("magazine_content", boardService.getMagazineContent(boardVO.getBoard_id()));
		// 매거진 댓글 수 불러오기
		mav.addObject("magazine_comment_cnt", boardService.getMagazineCommentCnt(boardVO.getBoard_id()));
		// 페이징을 적용한 매거진 댓글 불러오기
		mav.addObject("magazine_comment", boardService.getMagazineComment(mbrVO.getMbr_id(), boardVO.getBoard_id(), cri));

		int total = boardService.getMagazineCommentTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MagazineCommentPageVO(cri, total));

		return mav;
	}

	// 매거진 게시글 추천
	@Transactional(rollbackFor = Exception.class)
	@PutMapping("/board/magazine/{board_id}")
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
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/board/magazine/{board_id}")
	public ResponseEntity<String> magazineCommentWrite(@RequestBody BoardBoardCommentVO boardBoardCommentVO) {
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

	// 매거진 댓글 삭제
	@Transactional(rollbackFor = Exception.class)
	@DeleteMapping("/board/magazine/{board_id}")
	public ResponseEntity<String> magazineCommentDelete(BoardCommentVO boardCommentVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineCommentDelete...");

		try {
			boardService.magazineCommentRemove(boardCommentVO.getComment_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 수정페이지(관리자)
	@GetMapping("/admin/board/magazine/modify/{board_id}")
	public ModelAndView magazineModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("magazineModifyView...");
		mav.setViewName("board/magazine_modify");
		// 매거진 게시글 가져오기
		mav.addObject("magazine_modify", boardService.getMagazineContent(boardVO.getBoard_id()));

		return mav;
	}

	// 매거진 수정(관리자)
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/admin/board/magazine/modify/{board_id}")
	public ResponseEntity<String> magazineModify(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineModify..");

		MultipartFile[] uploadfiles = boardVO.getUploadfiles(); // 썸네일 파일 가져오기
		String onedeletefiles = boardVO.getOnedeletefiles(); // 이미지만 삭제

		try {
			if (uploadfiles != null && onedeletefiles == null) {
				// 수정페이지에서 사진을 새로 추가할 경우 진행한다
				boardService.setMagazineModifyAddImg(boardVO);
			} else if (uploadfiles == null && onedeletefiles != null) {
				// 이미지만 삭제할 경우 진행한다
				boardService.magazineImageOnlyRemove(boardVO);
			} else {
				// 사진을 새로 추가하지 않고 내용만 변경된 경우 진행한다
				boardService.setMagazineModify(boardVO);
			}

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 삭제(관리자)
	@Transactional(rollbackFor = Exception.class)
	@DeleteMapping("/admin/board/magazine/modify/{board_id}")
	public ResponseEntity<String> magazineDelete(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineDelete...");

		try {
			boardService.magazineRemove(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}