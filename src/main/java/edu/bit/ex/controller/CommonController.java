package edu.bit.ex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.BrandCriteria;
import edu.bit.ex.page.BrandPageVO;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdQnAPageVO;
import edu.bit.ex.page.PrdReviewCriteria;
import edu.bit.ex.page.PrdReviewPageVO;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.page.PrdctListPageVO;
import edu.bit.ex.service.CommonService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctLikeVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.PrdctViewVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@SessionAttributes
public class CommonController {
	@Autowired
	private SecurityService securityService;
	@Autowired
	private CommonService commonService;

	// ?????? ?????????
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mav, PrdctVO prdctVO) throws Exception {
		log.info("main.......");
		mav.setViewName("common/main");
		// mav.addObject("prdct", commonService.getProduct("?????????"));
		/* ????????? ???????????? ("?????? ??????????????? db?????? ??????") */
		mav.addObject("prdct", commonService.getProduct());
		return mav;
	}

	// ?????? ??????????????? ????????????
	@GetMapping("/prdct")
	public ModelAndView prdctList(ModelAndView mav, PrdctListCriteria cri) {
		mav.setViewName("common/prdct_list");
		// mav.addObject("prdct", commonService.getPrdctListWithCri(cri));
		// mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		// log.info("total : " + total);
		return mav;
	}

	// ?????? ???????????????
	@RequestMapping(value = "/prdct/{prdct_id}", method = { RequestMethod.GET })
	@ResponseBody
	public ModelAndView productDetail(@PathVariable("prdct_id") String p_id, @AuthenticationPrincipal MemberDetails memberDetails,
			PrdReviewCriteria rcri, PrdQnACriteria qacri, PrdctLikeVO prdctLikeVO, ModelAndView mav, HttpServletRequest request, MbrVO mbrVO,
			BoardCommentVO bVO) throws Exception {
		log.info("productDetail...");
		mav.setViewName("common/productDetail");

		// ?????? ??????(21.04.27 ????????? ?????? ???????????? ???????????? ????????? ???????????? category_name ?????? ?????????)
		PrdctRegisterImageVO prdctvo = commonService.getPrdctBoard(p_id);
		// prdctvo.setCategory_name(commonService.getCategoryName(prdctvo.getCategory_number()));
		log.info("prdctvo: " + prdctvo);

		// MemberDetails??? null??? ??? ModelAndView??? addObject??? ?????? ??????????????? ??????
		// ????????? null??? ???(????????? ????????? ?????????) ?????? ????????? addObject ?????? ?????? ???????????? ????????????
		if (memberDetails != null) {
			// ?????? ?????? ??????
			MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
			// ?????? ?????? ????????????(????????? ????????? ?????????)
			mav.addObject("mbr", getMbr);
		}

		// ???????????? ?????????
		log.info("prdct...");
		mav.addObject("prdct", prdctvo);

		// ?????? ?????? ??????
		mav.addObject("starAvg", commonService.getStarAvg(p_id));

		// ?????? ??????
		log.info("reviewList...");
		mav.addObject("reviewList", commonService.getReviewList(rcri, p_id));
		int r_total = commonService.getPrdctReviewTotal(rcri, p_id);
		mav.addObject("PageMaker", new PrdReviewPageVO(rcri, r_total));

		// ?????? ?????? ?????????
		mav.addObject("commentList", commonService.getReviewCommentList(p_id));

		// ???????????? ??????
		log.info("prdQnAList...");
		mav.addObject("prdQnAList", commonService.getPrdQnAList(qacri, p_id, bVO.getBoard_id()));
		int total = commonService.getPrdQnATotal(qacri);
		log.info("total: " + total);
		mav.addObject("pageMaker", new PrdQnAPageVO(qacri, total));

		// ?????? ?????? ??? ?????? ????????? ????????? ????????????
		log.info("prdLikeVal...");
		mav.addObject("prdLikeVal", commonService.getPrdLikeVal(p_id));

		HttpSession session = request.getSession();
		// ????????? ?????? ?????? ?????? ????????????(?????? ??? ??????)
		log.info("HttpSession: " + session);
		session.setAttribute(prdctvo.getPrdct_id(), prdctvo);

		// ?????? ??????
		if (memberDetails != null) {
			log.info("prdViewCnt...");
			// ?????? ?????? ??????
			MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
			// ?????? ?????? ????????? ?????? ?????? ?????? ????????????
			List<PrdctViewVO> getPrdView = commonService.getPrdView(getMbr.getMbr_id(), p_id);

			// ????????? ???????????? ?????????????????? ????????? ??????
			if (getPrdView.isEmpty()) {
				// ?????? ??????
				commonService.addPrdView(getMbr.getMbr_id(), p_id);
			}
		}

		return mav;
	}

	// ?????? ?????? ??????
	@PostMapping("/prdct/{prdct_id}/comment")
	public ResponseEntity<String> sellerQnARegister(BoardBoardCommentVO bbcVO, ModelAndView mav, MbrVO mbr) {

		ResponseEntity<String> entity = null;
		log.info("sellerQnARegister...");
		try {
			/* sellerService.prdInsert(prdctIVO); */
			commonService.commentInsert(bbcVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// ?????? ??????
	/*
	 * @PutMapping("/prdct/{prdct_id}") public ResponseEntity<String> modalReply(@RequestBody BoardCommentVO boardCommentVO, ModelAndView
	 * modelAndView) { ResponseEntity<String> entity = null;
	 * 
	 * log.info("modalReply..."); try { // commonService.setModalReply(boardCommentVO); entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	 * } catch (Exception e) { e.printStackTrace(); entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	 * 
	 * return entity; }
	 */

	// ?????? ??????????????? ????????? ??????
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/prdct/{prdct_id}")
	public ResponseEntity<String> prdctLike(@RequestBody PrdctLikeVO prdctLikeVO, PrdctVO prdctVO) {
		ResponseEntity<String> entity = null;

		log.info("prdctLike...");

		try {
			commonService.setPrdctLike(prdctLikeVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// ?????? ??????????????? ????????? ??????
	@Transactional(rollbackFor = Exception.class)
	@DeleteMapping("/prdct/{prdct_id}")
	public ResponseEntity<String> prdctLikeCancel(PrdctLikeVO prdctLikeVO, PrdctVO prdctVO) {
		ResponseEntity<String> entity = null;

		log.info("prdctLikeCancel...");

		try {
			commonService.prdctLikeCancel(prdctLikeVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// ??????????????? ???????????????
	// @RequestMapping(value = "/category/{category_id}", method = { RequestMethod.POST, RequestMethod.GET })
	@RequestMapping(value = "/category/{category_id}", method = { RequestMethod.GET })
	public ModelAndView categoryPrdctList(@PathVariable("category_id") int c_id, PrdctListCriteria cri, ModelAndView mav) {
		mav.setViewName("common/category_prdct_list");
		mav.addObject("prdct", commonService.getCategoryPrdctListWithCri(cri, c_id));
		mav.addObject("category", commonService.getCategory(c_id));
		int total = commonService.getCategoryTotalCount(cri, c_id);
		mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// ??????????????????
	@GetMapping("/brand")
	public ModelAndView brand_list(BrandCriteria cri, ModelAndView mav) {
		log.info("brand list page");
		mav.setViewName("common/brandList");
		mav.addObject("brand", commonService.getBrandList(cri));
		int total = commonService.getBrandTotalCount(cri);
		mav.addObject("pageMaker", new BrandPageVO(cri, total));

		return mav;
	}

	// ???????????? ???????????????
	@GetMapping("/brand/{brand_id}")
	public ModelAndView brandPrdctList(@PathVariable("brand_id") String b_id, PrdctListCriteria cri, ModelAndView mav) {
		mav.setViewName("common/brand_prdct_list");
		mav.addObject("mbr", commonService.getMemberInfo(b_id));
		mav.addObject("prdct", commonService.getBrandPrdctListWithCri(cri, b_id));
		int total = commonService.getBrandPrdctTotalCount(cri, b_id);
		mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		log.info("total : " + total);

		return mav;
	}
}