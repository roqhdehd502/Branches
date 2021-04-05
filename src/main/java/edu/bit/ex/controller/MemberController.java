package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.controller.validator.MemberValidator;
import edu.bit.ex.service.MemberService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	// private CustomerService customerService;

	private SecurityService securityService;

	private MemberValidator memberValidator;

	private MemberService memberService;

	@GetMapping("/member")
	public ModelAndView signUpForm(ModelAndView mv) {
		mv.setViewName("login/login");

		return mv;
	}

	// 상품 Q&A 등록 페이지
	@GetMapping("/prdct/{prdct_id}/qna/write")
	public ModelAndView productQnARegister(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.info("productQnARegister..");
		mav.setViewName("member/productQnARegister");
		// 상품 Q&A 등록 페이지 회원id정보
		mav.addObject("prdctQnaInfo", securityService.getMbr(memberDetails.getUserID()));

		return mav;
	}

	// 상품 Q&A 작성
	@PostMapping("/prdct/{prdct_id}/qna/writing")
	public RedirectView prdctQnaWriting(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("prdctQnaWriting");
		log.info("prdctQnaWriting..");

		// 리뷰 등록
		memberService.setPrdctQnaWrite(boardVO);

		return new RedirectView("/member/mypage/prdctq/list");
	}

	// 상품 Q&A 마이페이지 리스트 - 누르면 member_myprdctq 연결
	@GetMapping("/mypage/prdctq/list")
	public ModelAndView prdctQnAList(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("prdctQnAList");
		log.info("prdctQnAList..");
		String member_id = memberDetails.getUserID();
		mav.setViewName("member/member_myprdctq_list");
		mav.addObject("mem", securityService.getMbr(member_id));
		mav.addObject("prdctqMyList", memberService.getPrdctqMyList(member_id));
		return mav;
	}

	// 회원 마이페이지...(custom)
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("mypage.......");
		mav.setViewName("member/mypage");
		// mav.addObject("member", hsService.getMember());
		return mav;
	}

	// 고객 QnA 마이페이지 리스트 - 누르면 member_myq 로 연결
	@GetMapping("/mypage/myqna/list")
	public ModelAndView myqnaList(ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("myqnaList");
		// mav.setViewName("member/member_question"); 얘가 등록/어디연결?
		mav.setViewName("member/member_myq_list");
		// mav.addObject("member", hsService.getMember());
		return mav;
	}

	// 찜하기 목록 페이지
	@GetMapping("/mypage/like")
	public ModelAndView likeProduct(ModelAndView mav) throws Exception {
		log.debug("like");
		log.info("like..");
		mav.setViewName("customer/likeProduct");
		return mav;
	}

	// 최근본상품
	@GetMapping("/mypage/recently")
	public ModelAndView recentlyProduct(ModelAndView mav) throws Exception {
		log.debug("recently");
		log.info("recently..");
		mav.setViewName("member/recentlyProduct");
		return mav;
	}

	// 상품 리뷰 등록 페이지
	@GetMapping("/mypage/review/write")
	public ModelAndView reviewRegister(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		mav.setViewName("member/reviewRegister");
		// 리뷰 등록페이지 회원id정보
		mav.addObject("customerInfo", securityService.getMbr(memberDetails.getUserID()));

		return mav;
	}

	// 상품 리뷰 작성
	@PostMapping("/mypage/review/writing")
	public RedirectView reviewWriting(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		// 리뷰 등록
		memberService.setReviewWrite(boardVO);

		return new RedirectView("/member/mypage/review/list");
	}

	// 상품 리뷰 마이페이지 리스트 -누르면 member_myreview 연결
	@GetMapping("/mypage/review/list")
	public ModelAndView reviewList(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("reviewList");
		log.info("reviewList..");
		String member_id = memberDetails.getUserID();
		mav.setViewName("member/member_myreview_list");
		mav.addObject("mem", securityService.getMbr(member_id));
		mav.addObject("reviewMyList", memberService.getReviewMyList(member_id));
		return mav;
	}

	// 회원 주문내역 조회페이지...(custom)
	@GetMapping("/mypage/order")
	public ModelAndView myOrderList(ModelAndView mav) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		mav.setViewName("member/myOrderList");
		return mav;
	}
	// 회원 브랜드 조회페이지...(custom)
	/*
	 * @GetMapping("/brandList") public String brandList(Model model, SearchCriteria cri) throws Exception { log.debug("brandList");
	 * log.info("brandList"); model.addAttribute("mem", customerService.getMemberList(cri));
	 * 
	 * int total = customerService.getTotal(cri); log.info("total.........."); model.addAttribute("pageMaker", new SearchPageVO(cri, total));
	 * 
	 * return "brandList"; }
	 */

	// 회원 정보수정폼 customer
	// 스프링 시큐리티때 member_id 가져오기
	// @RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	// public ModelAndView member_info(@PathVariable("member_id") String m_id, ModelAndView mav) {
	// mav.setViewName("customer/member_mypage_modify");
	// // mav.addObject("mbr", customerService.getMemberInfo(m_id));
	// return mav;
	// }

	// 회원정보수정 ajax customer
	@PutMapping(value = "/mypage/myinfo")
	public ResponseEntity<String> member_info_modify(@RequestBody MbrVO mbrvo) {
		ResponseEntity<String> entity = null;
		log.info("rest_update..");
		try {
			// customerService.memberInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 회원 정보수정폼 customer
	// 스프링 시큐리티 적용 중
	@RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login_member_info(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) {
		mav.setViewName("member/member_mypage_modify");
		mav.addObject("mbr", securityService.getMbr(memberDetails.getUserID()));
		return mav;
	}
}
