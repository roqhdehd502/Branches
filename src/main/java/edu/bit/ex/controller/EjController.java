package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.EjService;
import edu.bit.ex.vo.CartVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/ej/*")
public class EjController {
	/* @Autowired */

	private EjService ejService;

	// 상품 상세페이지
	@GetMapping("/prd/{prdc_id}")
	public ModelAndView ProductDetail(@PathVariable("prdc_id") String p_id, ModelAndView mav) throws Exception {

		log.info("product..");
		mav.setViewName("ej/productDetail");
		mav.addObject("productDetail", (ejService.getProductDetail(p_id)));
		mav.addObject("productInfo", (ejService.getProductInfo(p_id)));
		/* mav.addObject("productQna", (ejService.productQna(p_id))); */

		return mav;
	}

	@GetMapping("/main")
	public String Main(Model model) throws Exception {
		log.debug("main");
		log.info("main..");

		return "ej/main";
	}

	@GetMapping("/cart")
	public ModelAndView MemberCart(CartVO cartVO, ModelAndView mav) throws Exception {
		log.debug("cart");
		log.info("cart..");
		mav.setViewName("ej/memberCart");
		mav.addObject("cart_list", ejService.getCartList());
		return mav;
	}

	@GetMapping("/order")
	public String OderInput(Model model) throws Exception {
		log.debug("order");
		log.info("order..");

		return "ej/orderInput";
	}

	@GetMapping("/like")
	public String LikeProduct(Model model) throws Exception {
		log.debug("like");
		log.info("like..");

		return "ej/likeProduct";
	}

	@GetMapping("/recently")
	public String RecentlyProduct(Model model) throws Exception {
		log.debug("recently");
		log.info("recently..");

		return "ej/recentlyProduct";
	}

	@GetMapping("/nmcheck")
	public String NonMemberOrderCheck(Model model) throws Exception {
		log.debug("nmcheck");
		log.info("nmcheck..");

		return "ej/nonMemberOrderCheck";
	}

	@GetMapping("/mcheck")
	public String MemberOrderCheck(Model model) throws Exception {
		log.debug("mcheck");
		log.info("mcheck..");

		return "ej/memberOrderCheck";
	}

	@GetMapping("/spc")
	public String SellerProductCheck(Model model) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");

		return "ej/sellerProductCheck";
	}

	@GetMapping("/spm")
	public String SellerProductModify(Model model) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");

		return "ej/sellerProductModify";
	}

	@GetMapping("/reviewup")
	public String ReviewRegister(Model model) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		return "ej/reviewRegister";
	}

	@GetMapping("/prdqna")
	public String ProductQnARegister(Model model) throws Exception {
		log.debug("productQnARegister");
		log.info("productQnARegister..");

		return "ej/productQnARegister";
	}

}