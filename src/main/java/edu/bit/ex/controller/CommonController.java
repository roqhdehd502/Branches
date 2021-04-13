package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.page.PrdctListPageVO;
import edu.bit.ex.service.CommonService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class CommonController {
	@Autowired
	private CommonService commonService;

	// 메인 페이지
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mav, PrdctVO prdctVO) throws Exception {
		log.info("main.......");
		mav.setViewName("common/main");
		// mav.addObject("prdct", commonService.getProduct("테스트"));
		/* 하나씩 불러올때 ("해당 컬럼속성의 db값을 적기") */
		mav.addObject("prdct", commonService.getProduct());
		mav.addObject("member", commonService.getMember());
		return mav;
	}

	// 전체 상품리스트
	@GetMapping("/prdct")
	public ModelAndView prdctList(ModelAndView mav, PrdctListCriteria cri) {
		mav.setViewName("common/prdct_list");
		// mav.addObject("prdct", commonService.getPrdctListWithCri(cri));
		// mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		// log.info("total : " + total);
		return mav;
	}

	// 상품 상세페이지
	@RequestMapping(value = "/prdct/{prdct_id}/{board_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productDetail(@PathVariable("prdct_id") String p_id, @PathVariable("board_id") int board_id, PrdQnACriteria cri,
			ModelAndView mav, BoardPrdctImageVO bpvo) throws Exception {

		log.info("product..");
		// 상품 정보
		mav.setViewName("common/productDetail");

		mav.addObject("productDetail", (commonService.getProductDetail(p_id)));
		mav.addObject("productInfo", (commonService.getProductInfo(p_id)));

		mav.addObject("bvo", commonService.getContent(bpvo.getBoard_id()));
		mav.addObject("id", commonService.getboardId(board_id));

		// 리뷰 관련
		log.info("reviewList..");
		mav.addObject("reviewList", (commonService.getReviewList(p_id)));

		// 큐앤에이 관련
		log.info("prdQnAList...");
		log.info(cri.toString());
		// mav.addObject("prdQnAList", commonService.getPrdQnAList(cri, p_id));
		// int total = commonService.getPrdQnATotal(cri);
		// log.info("total" + total);
		// mav.addObject("pageMaker", new PrdQnAPageVO(cri, total));

		return mav;
	}

	// 모달 댓글
	@PutMapping("/prdct/{prdct_id}")
	public ResponseEntity<String> modalReply(@RequestBody BoardCommentVO boardCommentVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("modalReply...");
		try {

			// commonService.setModalReply(boardCommentVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 카테고리별 상품리스트
	@RequestMapping(value = "/category/{category_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView categoryPrdctList(@PathVariable("category_id") int c_id, PrdctListCriteria cri, ModelAndView mav) {
		mav.setViewName("common/category_prdct_list");
		mav.addObject("prdct", commonService.getCategoryPrdctListWithCri(cri, c_id));
		mav.addObject("category", commonService.getCategory(c_id));
		int total = commonService.getCategoryTotalCount(cri, c_id);
		mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 브랜드별 상품리스트
	@RequestMapping(value = "/brand/{brand_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView brandPrdctList(@PathVariable("brand_id") String b_id, PrdctListCriteria cri, ModelAndView mav) {
		mav.setViewName("common/brand_prdct_list");
		/*
		 * mav.addObject("mbr", commonService.getMemberInfo(b_id)); mav.addObject("prdct", commonService.getBrandPrdctListWithCri(cri, b_id)); int
		 * total = commonService.getBrandTotalCount(cri, b_id); mav.addObject("pageMaker", new PrdctListPageVO(cri, total)); log.info("total : " +
		 * total);
		 */
		return mav;
	}
}