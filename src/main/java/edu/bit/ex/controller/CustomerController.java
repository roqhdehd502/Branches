package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.service.CustomerService;
import edu.bit.ex.vo.BoardCommentVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/customer/*")
public class CustomerController {
	@Autowired
	private CustomerService customerService;

	// 매거진 게시글 댓글 작성 customer
	@PostMapping("/magazine/{board_id}")
	public ResponseEntity<String> magazineCommentWrite(@RequestBody BoardBoardCommentVO boardBoardCommentVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineCommentWrite...");
		try {
			// boardService.setMagazineCommentWrite(boardBoardCommentVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 댓글 삭제(오류수정할것) customer
	@DeleteMapping("/magazine/{board_id}")
	public ResponseEntity<String> magazineCommentDelete(BoardCommentVO boardCommentVO) {
		ResponseEntity<String> entity = null;
		log.info("magazineDelete...");

		try {
			// boardService.magazineCommentRemove(boardCommentVO.getComment_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}