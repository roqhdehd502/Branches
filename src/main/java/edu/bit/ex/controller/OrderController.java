package edu.bit.ex.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.service.OrderService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
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
	@RequestMapping(value = "/cart", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memberCart(HttpServletRequest request, HttpSession session, ModelAndView mav) throws Exception {
		log.debug("cart");
		log.info("cart ");
		mav.setViewName("order/memberCart");
		// mav.set

		return mav;
	}

	// 장바구니
	@RequestMapping(value = "/cartList", method = { RequestMethod.POST, RequestMethod.GET })
	public List<PrdctOrderDetailVO> cartList(@RequestBody List<Map<String, Object>> param) throws Exception {

		List<PrdctOrderDetailVO> cartList = new ArrayList<PrdctOrderDetailVO>();
		log.info("cartList ");
		for (Map<String, Object> cart : param) {
			cartList.add(orderService.getPrdctCart((String) cart.get("prdct_id")));
		}
		return cartList;

	}

	// 주문 리스트 정보입력
	@RequestMapping(value = "/cart/orderInput", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(ModelAndView mav, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("order");
		String id = memberDetails.getUserID();
		mav.addObject("member", securityService.getMbr(id));
		mav.setViewName("order/orderInput");
		return mav;
	}

	// 주문 리스트 정보입력
	@RequestMapping(value = "/cart/orderInput/insert", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderInput(ModelAndView mav, PrdctOrderVO po, HttpServletRequest request,
			@AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("order insert");
		String[] order_amounts = request.getParameterValues("order_amount");
		String[] prdct_ids = request.getParameterValues("prdct_id");
		String[] order_sizes = request.getParameterValues("order_size");
		String[] order_colors = request.getParameterValues("order_color");
		orderService.insertOrder(po);

		// 해당아이디의 최신 결제내역을 가져옴
		PrdctOrderVO poVO = orderService.getPayInfo(po.getMbr_id());

		OrderDetailVO odVO = new OrderDetailVO();

		for (int i = 1; i < order_amounts.length; i++) {
			odVO.setOrder_amount(Integer.parseInt(order_amounts[i]));
			odVO.setOrder_color(order_colors[i]);
			odVO.setOrder_size(order_sizes[i]);
			odVO.setPrdct_id(prdct_ids[i]);
			odVO.setOrder_number(poVO.getOrder_number());
			orderService.insertOrderDetail(odVO);

		}

		mav.setViewName("order/member_order_complete");
		mav.addObject("povo", poVO);
		return mav;
	}
}
