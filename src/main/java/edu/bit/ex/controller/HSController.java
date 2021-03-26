package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.page.SearchPageVO;
import edu.bit.ex.service.HSService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class HSController {

	private HSService hsService;

	@GetMapping("/login2")
	public String login(Model model) throws Exception {
		log.debug("login2");
		log.info("login2");
		return "login2";
	}

	@GetMapping("/main")
	public ModelAndView main(ModelAndView mav, PrdctVO pVO) throws Exception {
		log.info("main.......");
		mav.setViewName("main");
		// mav.addObject("prdct", hsService.getProduct("테스트")); 하나씩 불러올때 ("해당 컬럼속성의 db값을 적기")
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("member", hsService.getMember());
		return mav;
	}

	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("mypage.......");
		mav.setViewName("mypage");
		mav.addObject("member", hsService.getMember());

		return mav;
	}

	@GetMapping("/myOrderList")
	public String myOrderList(Model model) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		return "myOrderList";
	}

	@GetMapping("/brandList")
	public String brandList(Model model, SearchCriteria cri) throws Exception {
		log.debug("brandList");
		log.info("brandList");
		model.addAttribute("mem", hsService.getMemberList(cri));

		int total = hsService.getTotal(cri);
		log.info("total..........");
		model.addAttribute("pageMaker", new SearchPageVO(cri, total));

		return "brandList";
	}

	@GetMapping("/sellerpage")
	public ModelAndView sellerpage(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		mav.setViewName("sellerpage");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	@GetMapping("/sellerorderCheck")
	public ModelAndView sellerorderCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");

		mav.setViewName("sellerorderCheck");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	@GetMapping("/sellerdeleCheck")
	public ModelAndView sellerdeleCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		mav.setViewName("sellerdeleCheck");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	@GetMapping("/sellercancelCheck")
	public ModelAndView sellercancelCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		mav.setViewName("sellercancelCheck");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	@GetMapping("/sellercancelList")
	public ModelAndView sellercancelList(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellercancelList");
		log.info("sellercancelList");
		mav.setViewName("sellercancelList");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	@GetMapping("/sellerchangeCheck")
	public ModelAndView sellerchangeCheck(ModelAndView mav, OrderDetailVO orVO) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		mav.setViewName("sellerchangeCheck");
		mav.addObject("order", hsService.getOrder());
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());
		return mav;
	}

	@GetMapping("/sellerQnA")
	public ModelAndView sellerQnA(ModelAndView mav) throws Exception {
		log.info("sellerQnA");

		mav.setViewName("sellerQnA");
		mav.addObject("board", hsService.getBoard());
		mav.addObject("prdct", hsService.getProduct());
		return mav;
	}

	@GetMapping("/sellerReview")
	public ModelAndView sellerReview(ModelAndView mav) throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");

		mav.setViewName("sellerReview");
		mav.addObject("board", hsService.getBoard());
		mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	@GetMapping("/sellertotal")
	public ModelAndView sellertotal(ModelAndView mav) throws Exception {
		log.debug("sellertotal");
		log.info("sellertotal");

		mav.setViewName("sellertotal");
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	@GetMapping("/adminpage")
	public String adminpage(Model model) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		return "adminpage";
	}

	@GetMapping("/adminQnA")
	public ModelAndView adminQnA(ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("adminQnA");
		log.info("adminQnA");
		mav.setViewName("adminQnA");
		mav.addObject("board", hsService.getBoard());
		mav.addObject("prdct", hsService.getProduct());

		return mav;
	}

	@GetMapping("/admintotal")
	public ModelAndView admintotal(ModelAndView mav) throws Exception {
		log.debug("admintotal");
		log.info("admintotal");

		mav.setViewName("admintotal");
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

	@GetMapping("/adminSearchMember")
	public String adminSearchMember(Model model, SearchCriteria cri) throws Exception {
		log.info("adminSearchMember.........");
		model.addAttribute("mem", hsService.getMemberList(cri));

		int total = hsService.getTotal(cri);
		log.info("total..........");
		model.addAttribute("pageMaker", new SearchPageVO(cri, total));

		return "/adminSearchMember";
	}

	@GetMapping("/adminSearchtotal")
	public ModelAndView adminSearchtotal(ModelAndView mav) throws Exception {
		log.debug("adminSearchtotal");
		log.info("adminSearchtotal");
		mav.setViewName("adminSearchtotal");
		mav.addObject("prdct", hsService.getProduct());
		mav.addObject("prdOrder", hsService.getPrdOrder());

		return mav;
	}

}
