package edu.bit.ex.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.KSPService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/rest_ksp/*")
public class KSPRestController {

	private KSPService kspService;

	// 전체 상품리스트
	@RequestMapping(value = "/prdct_list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView prdct_list(ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/prdct_list");
		mav.addObject("prdct", kspService.getPrdctListWithCri(cri));
		int total = kspService.getTotalCount(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 카테고리 상품리스트
	@RequestMapping(value = "/category/{category_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView category_prdct_list(@PathVariable("category_id") int c_id, ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/category_prdct_list");
		mav.addObject("prdct", kspService.getCategoryPrdctListWithCri(cri, c_id));
		mav.addObject("category", kspService.getCategory(c_id));
		int total = kspService.getCategoryTotalCount(cri, c_id);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 브랜드 상품리스트
	@RequestMapping(value = "/brand/{brand_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView brand_prdct_list(@PathVariable("brand_id") String b_id, ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/brand_prdct_list");
		mav.addObject("mbr", kspService.getMemberInfo(b_id));
		mav.addObject("prdct", kspService.getBrandPrdctListWithCri(cri, b_id));
		int total = kspService.getBrandTotalCount(cri, b_id);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

}
