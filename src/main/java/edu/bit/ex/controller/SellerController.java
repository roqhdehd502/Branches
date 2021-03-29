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

import edu.bit.ex.service.SellerService;
import edu.bit.ex.vo.MbrAddressVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/seller/*")
public class SellerController {
	@Autowired
	private SellerService sellerService;

	// 상품 등록 seller
	@GetMapping("/mypage/prdct_register")
	public ModelAndView prdct_register(ModelAndView mav) {
		log.info("prdct_register...");
		mav.setViewName("seller/prdct_register");
		return mav;
	}

	// 판매자 등록상품 확인 seller
	// 수정 버튼 옮길것! => SellerProductModify
	@GetMapping("/mypage/prdct")
	public ModelAndView sellerProductCheck(ModelAndView mav) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");
		mav.setViewName("seller/sellerProductCheck");
		mav.addObject("prdct", sellerService.getProduct());

		return mav;
	}

	// 판매자 등록상품 수정페이지 seller
	// 이 페이지는 상세페이지가 곧 수정페이지입니다
	@GetMapping("/mypage/prdct/{prdct_id}")
	public ModelAndView sellerProductModify(ModelAndView mav) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");
		mav.setViewName("seller/sellerProductModify");

		return mav;
	}

	// 판매자 마이페이지...(seller)
	@GetMapping("/mypage")
	public ModelAndView sellerpage(ModelAndView mav) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		mav.setViewName("seller/sellerpage");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());
		return mav;
	}

	// 판매자 주문확인 페이지...(seller)
	@GetMapping("/mypage/order")
	public ModelAndView sellerorderCheck(ModelAndView mav) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");

		mav.setViewName("seller/sellerorderCheck");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());
		return mav;
	}

	// 판매자 발송확인 페이지...(seller)
	@GetMapping("/mypage/release")
	public ModelAndView sellerdeleCheck(ModelAndView mav) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		mav.setViewName("seller/sellerdeleCheck");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());

		return mav;
	}

	// 판매자 취소 확인 페이지...(seller)
	@GetMapping("/mypage/cancel")
	public ModelAndView sellercancelCheck(ModelAndView mav) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		mav.setViewName("seller/sellercancelCheck");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());

		return mav;
	}

	// 판매자 환불 확인 페이지...(seller)
	@GetMapping("/mypage/refund")
	public ModelAndView sellerRefund(ModelAndView mav) throws Exception {
		log.debug("sellerRefund");
		log.info("sellerRefund");
		mav.setViewName("seller/sellerRefund");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());
		return mav;
	}

	// 판매자 교환확인 페이지...(seller)
	@GetMapping("/mypage/exchange")
	public ModelAndView sellerchangeCheck(ModelAndView mav) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		mav.setViewName("seller/sellerchangeCheck");
		mav.addObject("order", sellerService.getOrderDetail());
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());
		return mav;
	}

	// 판매자 상품Q&A조회 페이지...(seller)
	@GetMapping("/mypage/prdctqna")
	public ModelAndView sellerQnA(ModelAndView mav) throws Exception {
		log.info("sellerQnA");

		mav.setViewName("seller/sellerQnA");
		mav.addObject("board", sellerService.getBoard());
		mav.addObject("prdct", sellerService.getProduct());
		return mav;
	}

	// 판매자 상품리뷰조회 페이지...(seller)
	@GetMapping("/mypage/review")
	public ModelAndView sellerReview(ModelAndView mav) throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");

		mav.setViewName("seller/sellerReview");
		mav.addObject("board", sellerService.getBoard());
		mav.addObject("prdct", sellerService.getProduct());

		return mav;
	}

	// 판매자 매출조회 페이지...(seller)
	@GetMapping("/mypage/sales")
	public ModelAndView sellerSales(ModelAndView mav) throws Exception {
		log.debug("sellerSales");
		log.info("sellerSales");

		mav.setViewName("seller/sellerSales");
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());

		return mav;
	}

	// 판매자 정보수정폼 seller
	// 로그인이 되면 member_id 받아오기
	@RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView seller_info(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("seller/seller_mypage_modify");
		mav.addObject("mbr", sellerService.getMemberInfo(m_id));
		mav.addObject("adr", sellerService.getSellerAddress(m_id));
		return mav;
	}

	// 판매자 정보수정 ajax
	@PutMapping(value = "/mypage/myinfo")
	public ResponseEntity<String> seller_info_modify(@RequestBody MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			sellerService.sellerInfoUpdate(mavo);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}