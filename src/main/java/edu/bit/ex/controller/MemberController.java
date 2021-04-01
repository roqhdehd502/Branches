package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.controller.validator.MemberValidator;
import edu.bit.ex.service.SecurityService;
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

	@GetMapping("/member")
	public ModelAndView signUpForm(ModelAndView mv) {
		mv.setViewName("login/login");

		return mv;
	}

	// 상품 Q&A 등록 customer
	// 상품 - 상품상세페이지(qna리스트) - 상품등록페이지
	@GetMapping("/prdct/{prdct_id}/qna/write")
	public ModelAndView productQnARegister(ModelAndView mav) throws Exception {
		log.info("productQnARegister..");
		mav.setViewName("customer/productQnARegister");
		// mav.addObject("ProductQnARegister", (customerService.getProductQnARegister(p_id)));
		return mav;
	}

	// 회원 마이페이지...(custom)
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("mypage.......");
		mav.setViewName("customer/mypage");
		// mav.addObject("member", hsService.getMember());
		return mav;
	}

	// 찜하기 목록 페이지 customer
	@GetMapping("/mypage/like")
	public ModelAndView likeProduct(ModelAndView mav) throws Exception {
		log.debug("like");
		log.info("like..");
		mav.setViewName("customer/likeProduct");
		return mav;
	}

	// 최근본상품 customer
	@GetMapping("/mypage/recently")
	public ModelAndView recentlyProduct(ModelAndView mav) throws Exception {
		log.debug("recently");
		log.info("recently..");
		mav.setViewName("customer/recentlyProduct");
		return mav;
	}

	// 상품 리뷰 등록 customer
	@GetMapping("/mypage/review/write")
	public ModelAndView reviewRegister(ModelAndView mav) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");
		mav.setViewName("customer/reviewRegister");
		return mav;
	}

	// 회원 주문내역 조회페이지...(custom)
	@GetMapping("/mypage/order")
	public ModelAndView myOrderList(ModelAndView mav) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		mav.setViewName("customer/myOrderList");
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
