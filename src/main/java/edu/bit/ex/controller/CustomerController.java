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

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.service.CustomerService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.MbrVO;
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

	// 찜하기 customer
	@GetMapping("/like")
	public String LikeProduct(Model model) throws Exception {
		log.debug("like");
		log.info("like..");

		return "ej/likeProduct";
	}

	// 최근본상품 customer
	@GetMapping("/recently")
	public String RecentlyProduct(Model model) throws Exception {
		log.debug("recently");
		log.info("recently..");

		return "ej/recentlyProduct";
	}

	// 회원 주문확인 customer
	@GetMapping("/mcheck")
	public String MemberOrderCheck(Model model) throws Exception {
		log.debug("mcheck");
		log.info("mcheck..");

		return "ej/memberOrderCheck";
	}

	// 상품 리뷰 등록 customer
	@GetMapping("/reviewup")
	public String ReviewRegister(Model model) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		return "ej/reviewRegister";
	}

	// 상품 Q&A 등록 customer
	@GetMapping("/prdqna")
	public ModelAndView ProductQnARegister(ModelAndView mav) throws Exception {
		log.info("productQnARegister..");
		mav.setViewName("ej/productQnARegister");
		// mav.addObject("ProductQnARegister", (ejService.getProductQnARegister(p_id)));

		return mav;
	}

	// 회원 마이페이지...(custom)
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("mypage.......");
		mav.setViewName("mypage");
		// mav.addObject("member", hsService.getMember());

		return mav;
	}

	// 회원 주문내역 조회페이지...(custom)
	@GetMapping("/myOrderList")
	public String myOrderList(Model model) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		return "myOrderList";
	}

	// 회원 브랜드 조회페이지...(custom)
	@GetMapping("/brandList")
	public String brandList(Model model, SearchCriteria cri) throws Exception {
		log.debug("brandList");
		log.info("brandList");
		// model.addAttribute("mem", hsService.getMemberList(cri));

		// int total = hsService.getTotal(cri);
		log.info("total..........");
		// model.addAttribute("pageMaker", new SearchPageVO(cri, total));

		return "brandList";
	}
}