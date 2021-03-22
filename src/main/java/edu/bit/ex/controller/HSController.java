package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class HSController {

	@GetMapping("/main")
	public String main(Model model) throws Exception {
		log.debug("main");
		log.info("main");
		return "chs/main";
	}

	@GetMapping("/chart")
	public String chart(Model model) throws Exception {
		log.debug("chart");
		log.info("chart");
		return "chart";
	}

	@GetMapping("/mypage")
	public String mypage(Model model) throws Exception {
		log.debug("mypage");
		log.info("mypage");
		return "chs/mypage";
	}

	@GetMapping("/myOrderList")
	public String myOrderList(Model model) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		return "myOrderList";
	}

	@GetMapping("/brandList")
	public String brandList(Model model) throws Exception {
		log.debug("brandList");
		log.info("brandList");
		return "brandList";
	}

	@GetMapping("/sellerpage")
	public String sellerpage(Model model) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		return "chs/sellerpage";
	}

	@GetMapping("/sellerReview")
	public String sellerReview(Model model) throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");
		return "sellerReview";

	@GetMapping("/adminpage")
	public String adminpage(Model model) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		return "chs/adminpage";

	}

	@GetMapping("/sellerorderCheck")
	public String sellerorderCheck(Model model) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");
		return "sellerorderCheck";
	}

	@GetMapping("/sellerdeleCheck")
	public String sellerdeleCheck(Model model) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		return "sellerdeleCheck";
	}

	@GetMapping("/sellercancelCheck")
	public String sellercancelCheck(Model model) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		return "sellercancelCheck";
	}

	@GetMapping("/sellercancelList")
	public String sellercancelList(Model model) throws Exception {
		log.debug("sellercancelList");
		log.info("sellercancelList");
		return "sellercancelList";
	}

	@GetMapping("/sellerchangeCheck")
	public String sellerchangeCheck(Model model) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		return "sellerchangeCheck";
	}

	@GetMapping("/sellerQnA")
	public String sellerQnA(Model model) throws Exception {
		log.debug("sellerQnA");
		log.info("sellerQnA");
		return "sellerQnA";
	}

	@GetMapping("/sellertotal")
	public String sellertotal(Model model) throws Exception {
		log.debug("sellertotal");
		log.info("sellertotal");
		return "sellertotal";
	}

	@GetMapping("/adminpage")
	public String adminpage(Model model) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		return "adminpage";
	}

	@GetMapping("/adminQnA")
	public String adminQnA(Model model) throws Exception {
		log.debug("adminQnA");
		log.info("adminQnA");
		return "adminQnA";
	}

	@GetMapping("/admintotal")
	public String admintotal(Model model) throws Exception {
		log.debug("admintotal");
		log.info("admintotal");
		return "admintotal";
	}

	@GetMapping("/adminSearchMember")
	public String adminSearchMember(Model model) throws Exception {
		log.debug("adminSearchMember");
		log.info("adminSearchMember");
		return "adminSearchMember";
	}

	@GetMapping("/adminSearchtotal")
	public String adminSearchtotal(Model model) throws Exception {
		log.debug("adminSearchtotal");
		log.info("adminSearchtotal");
		return "adminSearchtotal";
	}

}
