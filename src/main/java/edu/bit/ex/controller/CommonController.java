package edu.bit.ex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.service.CommonService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class CommonController {
	@Autowired
	private CommonService commonService;

	// 고객 등록 페이지 common
	@GetMapping("/member-register")
	public ModelAndView memberRegister(ModelAndView mav) {
		log.info("memberRegister...");
		mav.setViewName("member/member_register");
		return mav;
	}

	// 페이징을 이용한 공지사항 게시판 리스트 common
	@Transactional
	@GetMapping("/notice")
	public ModelAndView noticeList(NoticeCriteria cri, ModelAndView mav) {
		log.info("noticeList...");
		log.info(cri.toString());
		mav.setViewName("board/notice_list");
		// mav.addObject("notice_list", boardService.getNoticeList(cri));

		// int total = boardService.getNoticeTotal(cri);
		// log.info("total" + total);
		// mav.addObject("pageMaker", new NoticePageVO(cri, total));

		return mav;
	}

	// 공지사항 게시글 common
	@GetMapping("/notice/{board_id}")
	public ModelAndView noticeContent(BoardVO boardVO, ModelAndView mav) {
		log.info("noticeContent...");
		mav.setViewName("board/notice_content");
		/* mav.addObject("notice_content", boardService.getNoticeContent(boardVO.getBoard_id())); */
		return mav;
	}

	// 페이징을 적용한 매거진 게시판 리스트 common
	@Transactional
	@GetMapping("/magazine")
	public ModelAndView magazineList(BoardVO boardVO, BoardPrdctImageVO bPrdctImageVO, MagazineCriteria cri, ModelAndView mav) {
		log.info("magazineList...");
		mav.setViewName("board/magazine_list");
		/*
		 * mav.addObject("magazine_list", boardService.getMagazineList(cri));
		 * 
		 * int total = boardService.getMagazineTotal(cri); log.info("total" + total); mav.addObject("pageMaker", new MagazinePageVO(cri, total));
		 */
		return mav;
	}

	// 매거진 게시글 common
	@Transactional
	@GetMapping("/magazine/{board_id}")
	public ModelAndView magazineContent(MbrVO mbrVO, BoardVO boardVO, MagazineCommentCriteria cri, ModelAndView mav) {
		log.info("magazineContent...");
		mav.setViewName("board/magazine_content");
		// 매거진 내용
		/*
		 * mav.addObject("magazine_content", boardService.getMagazineContent(boardVO.getBoard_id())); // 매거진 사진 mav.addObject("magazine_img",
		 * boardService.getMagazineImage(boardVO.getBoard_id())); // 매거진 댓글 수 불러오기 mav.addObject("magazine_comment_cnt",
		 * boardService.getMagazineCommentCnt(mbrVO.getMbr_id(), boardVO.getBoard_id())); // 페이징을 적용한 매거진 댓글 불러오기 mav.addObject("magazine_comment",
		 * boardService.getMagazineComment(mbrVO.getMbr_id(), boardVO.getBoard_id()));
		 */
		/* mav.addObject("magazine_comment", boardService.getMagazineComment(mbrVO.getMbr_id(), boardVO.getBoard_id(), cri)); */

		/*
		 * int total = boardService.getMagazineCommentTotal(cri); log.info("total" + total); mav.addObject("pageMaker", new MagazineCommentPageVO(cri,
		 * total));
		 */
		return mav;
	}

	// 상품 상세페이지 common
	@GetMapping("/prd/{prdct_id}")
	public ModelAndView ProductDetail(@PathVariable("prdct_id") String p_id, PrdQnACriteria cri, ModelAndView mav) throws Exception {

		log.info("product..");
		mav.setViewName("ej/productDetail");
		// mav.addObject("productDetail", (ejService.getProductDetail(p_id)));
		// mav.addObject("productInfo", (ejService.getProductInfo(p_id)));

		log.info("prdQnAList...");
		log.info(cri.toString());

		// mav.addObject("prdQnAList", ejService.getPrdQnAList(cri, p_id));

		// int total = ejService.getPrdQnATotal(cri);
		// log.info("total" + total);
		// mav.addObject("pageMaker", new PrdQnAPageVO(cri, total));

		return mav;
	}

	// 장바구니 담기 //common
	/*
	 * @PutMapping(value = "/prd/{prdc_id}") public ResponseEntity<String> ProductDetail(@RequestBody PrdctVO prdctVO) { ResponseEntity<String> entity
	 * = null;
	 * 
	 * log.info("rest_update.."); try { ejService.PrdDetailCartIn(prdctVO); log.info("PrdDetailCartIn"); entity = new
	 * ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	 * 
	 * return entity;
	 * 
	 * }
	 */

	// 장바구니 common
	@GetMapping("/cart")
	public ModelAndView MemberCart(HttpSession session, ModelAndView mav) throws Exception {
		log.debug("cart list");
		log.info("cart list..");
		mav.setViewName("ej/memberCart");
		// mav.addObject("cart_list", ejService.getCartList());
		return mav;
	}

	// 비회원 주문정보 입력 common
	@GetMapping("/order")
	public String OderInput(Model model) throws Exception {
		log.debug("order");
		log.info("order..");

		return "ej/orderInput";
	}

	/*
	 * //비회원 주문확인 common
	 * 
	 * @GetMapping("/nmcheck") public String NonMemberOrderCheck(Model model) throws Exception { log.debug("nmcheck"); log.info("nmcheck..");
	 * 
	 * return "ej/nonMemberOrderCheck"; }
	 */
}