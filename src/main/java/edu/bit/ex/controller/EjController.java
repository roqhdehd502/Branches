package edu.bit.ex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdQnAPageVO;
import edu.bit.ex.service.EjService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/ej/*")
public class EjController {
	/* @Autowired */

	private EjService ejService;

	// 상품 상세페이지 common
	@GetMapping("/prd/{prdct_id}")
	public ModelAndView ProductDetail(@PathVariable("prdct_id") String p_id, PrdQnACriteria cri, ModelAndView mav) throws Exception {

		log.info("product..");
		mav.setViewName("ej/productDetail");
		mav.addObject("productDetail", (ejService.getProductDetail(p_id)));
		mav.addObject("productInfo", (ejService.getProductInfo(p_id)));

		log.info("prdQnAList...");
		log.info(cri.toString());

		mav.addObject("prdQnAList", ejService.getPrdQnAList(cri, p_id));

		int total = ejService.getPrdQnATotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PrdQnAPageVO(cri, total));

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
		mav.addObject("cart_list", ejService.getCartList());
		return mav;
	}

	// 비회원 주문정보 입력 common
	@GetMapping("/order")
	public String OderInput(Model model) throws Exception {
		log.debug("order");
		log.info("order..");

		return "ej/orderInput";
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

	/*
	 * //비회원 주문확인 common
	 * 
	 * @GetMapping("/nmcheck") public String NonMemberOrderCheck(Model model) throws Exception { log.debug("nmcheck"); log.info("nmcheck..");
	 * 
	 * return "ej/nonMemberOrderCheck"; }
	 */

	// 회원 주문확인 customer
	@GetMapping("/mcheck")
	public String MemberOrderCheck(Model model) throws Exception {
		log.debug("mcheck");
		log.info("mcheck..");

		return "ej/memberOrderCheck";
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

}