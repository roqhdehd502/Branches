package edu.bit.ex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/order/*")
public class OrderController {
	/*
	 * 제꺼 서버 오류 나서 주석으로 묶었어요...사용하실때 풀어주시면 됩니다! -형석-
	 * 
	 * @Autowired private OrderService orderService;
	 */

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
		mav.setViewName("common/memberCart");
		// mav.addObject("cart_list", orderService.getCartList());
		return mav;
	}

	// 비회원 주문정보 입력 common
	@GetMapping("/order")
	public ModelAndView OrderInput(ModelAndView mav) throws Exception {
		log.debug("order");
		log.info("order..");
		mav.setViewName("common/orderInput");

		return mav;
	}

	// 비회원 주문

	/*
	 * //비회원 주문확인 common
	 * 
	 * @GetMapping("/nmcheck") public String NonMemberOrderCheck(Model model) throws Exception { log.debug("nmcheck"); log.info("nmcheck..");
	 * 
	 * return "ej/nonMemberOrderCheck"; }
	 */

	// 회원 주문확인 customer
	// 회원 배송지 입력폼 만들기 ordercontroller로 옮겨
	@GetMapping("/orderForm")
	public ModelAndView memberOrderCheck(ModelAndView mav) throws Exception {
		log.debug("mcheck");
		log.info("mcheck..");

		mav.setViewName("order/memberOrderCheck");

		return mav;
	}
}
