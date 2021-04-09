package edu.bit.ex.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.service.OrderService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService orderService;

	private SecurityService securityService;

	// 장바구니 페이지
	@GetMapping("/cart")
	public ModelAndView memberCart(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("cart");
		log.info("cart ");

		Map<String, Integer> cart = memberDetails.getCart();
		Set<String> idSet = cart.keySet();
		Map<PrdctVO, Integer> productCart = new HashMap<>();
		for (String id : idSet) {
			productCart.put(orderService.getProduct(id), cart.get(id));
		}

		mav.addObject("cart", productCart);
		mav.setViewName("order/memberCart");

		return mav;
	}

	// 장바구니
	@PostMapping("/insert_cart")
	public ResponseEntity<String> insertCart(@RequestBody OrderDetailVO orderDetailVO, @AuthenticationPrincipal MemberDetails memberDetails)
			throws Exception {

		ResponseEntity<String> entity = null;
		try {
			log.info("cart into");
			memberDetails.insertCart(orderDetailVO.getPrdct_id(), orderDetailVO.getOrder_amount());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 장바구니 삭제
	@DeleteMapping("/cart")
	public ResponseEntity<String> deleteCart(@RequestBody PrdctVO prdctVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		try {
			memberDetails.deleteCart(prdctVO.getPrdct_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 주문 리스트 정보입력
	@GetMapping("/cart/orderInput")
	public ModelAndView order(ModelAndView mav, HttpServletRequest request, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("order");
		String prdct_id = request.getParameter("prdct_id");
		String order_amount = request.getParameter("order_amount");
		String prdct_price = request.getParameter("prdct_price");
		String prdct_name = request.getParameter("prdct_name");

		System.out.println(prdct_name);

		String[] arrPrdct_id = prdct_id.split(",");
		String[] arrOrder_amount = order_amount.split(",");
		String[] arrPrdct_price = prdct_price.split(",");
		String[] arrPrdct_name = prdct_name.split(",");

		List<OrderDetailVO> orderList = new ArrayList<>();

		for (int i = 0; i < arrPrdct_id.length; i++) {
			OrderDetailVO order = new OrderDetailVO();
			order.setPrdct_id(arrPrdct_id[i]);
			order.setOrder_amount(Integer.parseInt(arrOrder_amount[i]));
			order.setPrdct_price(Integer.parseInt(arrPrdct_price[i]));
			order.setPrdct_name(arrPrdct_name[i]);
			orderList.add(order);
		}

		mav.addObject("orderDetailList", orderList);
		// mav.addObject("shippingList", memberService.getShippingLoc(memberDetails.getUsername()));
		// mav.addObject("member", memberService.getMember(memberDetails.getUsername()));

		mav.setViewName("order/memberOrderCheck");

		return mav;
	}
}

/*
 * // 비회원 주문정보 입력 common
 * 
 * @GetMapping("/order") public ModelAndView OrderInput(ModelAndView mav) throws Exception { log.debug("order"); log.info("order..");
 * mav.setViewName("common/orderInput");
 * 
 * return mav; }
 */

// 비회원 주문

/*
 * //비회원 주문확인 common
 * 
 * @GetMapping("/nmcheck") public String NonMemberOrderCheck(Model model) throws Exception { log.debug("nmcheck"); log.info("nmcheck..");
 * 
 * return "ej/nonMemberOrderCheck"; }
 */
