package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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
import edu.bit.ex.vo.OrderDetailVO;
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
	@GetMapping("/prdct_register")
	public String prdct_register(Model model) {
		log.info("prdct_register...");
		return "nmw/prdct_register";
	}

	// 판매자 등록상품 확인 seller
	@GetMapping("/spc")
	public String SellerProductCheck(Model model) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");

		return "ej/sellerProductCheck";
	}

	// 판매자 등록상품 수정 seller
	@GetMapping("/spm")
	public String SellerProductModify(Model model) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");

		return "ej/sellerProductModify";
	}

	// 판매자 마이페이지...(seller)
	@GetMapping("/sellerpage")
	public ModelAndView sellerpage(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		mav.setViewName("sellerpage");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	// 판매자 주문확인 페이지...(seller)
	@GetMapping("/sellerorderCheck")
	public ModelAndView sellerorderCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");

		mav.setViewName("sellerorderCheck");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	// 판매자 발송확인 페이지...(seller)
	@GetMapping("/sellerdeleCheck")
	public ModelAndView sellerdeleCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		mav.setViewName("sellerdeleCheck");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	// 판매자 취소 확인 페이지...(seller)
	@GetMapping("/sellercancelCheck")
	public ModelAndView sellercancelCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		mav.setViewName("sellercancelCheck");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	// 판매자 환불 확인 페이지...(seller)
	@GetMapping("/sellercancelList")
	public ModelAndView sellercancelList(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellercancelList");
		log.info("sellercancelList");
		mav.setViewName("sellercancelList");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	// 판매자 교환확인 페이지...(seller)
	@GetMapping("/sellerchangeCheck")
	public ModelAndView sellerchangeCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		mav.setViewName("sellerchangeCheck");
		// mav.addObject("order", hsService.getOrder());
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	// 판매자 상품Q&A조회 페이지...(seller)
	@GetMapping("/sellerQnA")
	public ModelAndView sellerQnA(ModelAndView mav) throws Exception {
		log.info("sellerQnA");

		mav.setViewName("sellerQnA");
		// mav.addObject("board", hsService.getBoard());
		// mav.addObject("prdct", hsService.getProduct());
		return mav;
	}

	// 판매자 상품리뷰조회 페이지...(seller)
	@GetMapping("/sellerReview")
	public ModelAndView sellerReview(ModelAndView mav) throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");

		mav.setViewName("sellerReview");
		// mav.addObject("board", hsService.getBoard());
		// mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	// 판매자 매출조회 페이지...(seller)
	@GetMapping("/sellertotal")
	public ModelAndView sellertotal(ModelAndView mav) throws Exception {
		log.debug("sellertotal");
		log.info("sellertotal");

		mav.setViewName("sellertotal");
		// mav.addObject("prdct", hsService.getProduct());
		// mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	// 판매자 정보수정폼 seller
	@RequestMapping(value = "/seller/{seller_id}/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView seller_info(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("rest_ksp/seller_mypage_modify");
		// mav.addObject("mbr", kspService.getMemberInfo(m_id));
		// mav.addObject("adr", kspService.getSellerAddress(m_id));
		return mav;
	}

	// 판매자 정보수정 ajax
	@PutMapping(value = "/seller/{seller_id}/mypage/myinfo")
	public ResponseEntity<String> seller_info_modify(@RequestBody MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			// kspService.sellerInfoUpdate(mavo);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}