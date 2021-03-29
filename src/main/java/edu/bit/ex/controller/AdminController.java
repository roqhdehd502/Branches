package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.service.AdminService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;

	// 업체 등록 admin
	@GetMapping("/seller_register")
	public String seller_register(Model model) {
		log.info("seller_register...");
		return "nmw/seller_register";
	}

	// 공지사항 작성페이지 admin
	@GetMapping("/notice/write")
	public ModelAndView noticeWriteView(MbrVO mbrVO, ModelAndView mav) {
		log.info("noticeWriteView...");
		mav.setViewName("board/notice_write");
		// mav.addObject("notice_write", boardService.getNoticeMember(mbrVO.getMbr_id()));
		return mav;
	}

	// 공지사항 작성 admin
	@PostMapping("/notice/write")
	public ResponseEntity<String> noticeWrite(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("noticeWrite..");
		try {
			// boardService.setNoticeWrite(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 공지사항 수정페이지 admin
	@GetMapping("/notice/modify/{board_id}")
	public ModelAndView noticeModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeModifyView...");
		mav.setViewName("board/notice_modify");
		// mav.addObject("notice_modify", boardService.getNoticeContent(boardVO.getBoard_id()));
		return mav;
	}

	// 공지사항 수정 admin
	@PostMapping("/notice/modify/{board_id}")
	public ResponseEntity<String> noticeModify(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("noticeModify..");
		try {
			// boardService.setNoticeModify(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 공지사항 삭제 admin
	@DeleteMapping("/notice/modify/{board_id}")
	public ResponseEntity<String> noticeDelete(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("noticeDelete...");

		try {
			// boardService.noticeRemove(boardVO.getBoard_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 매거진 작성페이지 admin
	@GetMapping("/magazine/write")
	public ModelAndView magazineWriteView(MbrVO mbrVO, ModelAndView mav) {
		log.info("magazineWriteView...");
		mav.setViewName("board/magazine_write");
		// mav.addObject("magazine_write", boardService.getMagazineMember(mbrVO.getMbr_id()));
		return mav;
	}

	// 매거진 작성 admin
	@PostMapping("/magazine/write")
	public ResponseEntity<String> magazineWrite(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineWrite..");
		try {
			// boardService.setMagazineWrite(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 수정페이지 admin
	@GetMapping("/magazine/modify/{board_id}")
	public ModelAndView magazineModifyView(BoardVO boardVO, ModelAndView mav) {
		log.info("magazineModifyView...");
		mav.setViewName("board/magazine_modify");
		// mav.addObject("magazine_modify", boardService.getMagazineContent(boardVO.getBoard_id()));
		return mav;
	}

	// 매거진 수정 admin
	@PostMapping("/magazine/modify/{board_id}")
	public ResponseEntity<String> magazineModify(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("magazineModify..");
		try {
			// boardService.setMagazineModify(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 매거진 삭제 admin
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

	// 관리자 마이페이지...(admin)
	@GetMapping("/adminpage")
	public String adminpage(Model model) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		return "adminpage";
	}

	// 관리자 유저 Q&A 조회페이지...(admin)
	@GetMapping("/adminQnA")
	public ModelAndView adminQnA(ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("adminQnA");
		log.info("adminQnA");
		mav.setViewName("adminQnA");
		// mav.addObject("board", hsService.getBoard());
		// mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	// 관리자 매출조회 페이지..(admin)
	@GetMapping("/admintotal")
	public ModelAndView admintotal(ModelAndView mav) throws Exception {
		log.debug("admintotal");
		log.info("admintotal");

		mav.setViewName("admintotal");
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	// 관리자 회원정보 조회 페이지...(admin)
	@GetMapping("/adminSearchMember")
	public String adminSearchMember(Model model, SearchCriteria cri) throws Exception {
		log.info("adminSearchMember.........");
		// model.addAttribute("mem", hsService.getMemberList(cri));

		// int total = hsService.getTotal(cri);
		log.info("total..........");
		// model.addAttribute("pageMaker", new SearchPageVO(cri, total));

		return "/adminSearchMember";
	}

	// 관리자 매출 조회 검색페이지?...(admin)
	@GetMapping("/adminSearchtotal")
	public ModelAndView adminSearchtotal(ModelAndView mav) throws Exception {
		log.debug("adminSearchtotal");
		log.info("adminSearchtotal");
		mav.setViewName("adminSearchtotal");
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}
}