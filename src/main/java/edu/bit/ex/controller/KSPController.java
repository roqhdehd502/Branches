package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ex.service.KSPService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/ksp/*")
public class KSPController {

	private KSPService kspService;

	@GetMapping("/prdct_list") // 상품 리스트 페이지
	public String prdct_list(Model model) {
		return "ksp/prdct_list";
	}

	@GetMapping("/member/myinfo")
	public String member_mypage_modify(Model model) {
		return "ksp/member_mypage_modify";
	}

	@GetMapping("/member/{m_id}/myinfo")
	public String member_mypage_modify(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_mypage_modify";
	}

	@GetMapping("/member/question")
	public String member_q_a(Model model) {
		model.addAttribute("inq", kspService.getInquiry());

		return "ksp/member_question";
	}

	@GetMapping("/member/{m_id}/myinfo/myreview")
	public String member_myreview(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myreview";
	}

	@GetMapping("/member/{m_id}/myinfo/myprdctq")
	public String member_myprdctq(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myprdctq";
	}

	@GetMapping("/member/{m_id}/myinfo/myq")
	public String member_myq(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myq";
	}

	@GetMapping("/member/order/complete")
	public String member_order_complete(Model model) {
		// model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_order_complete";
	}

	@GetMapping("/seller/{m_id}/myinfo")
	public String seller_mypage_modify(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/seller_mypage_modify";
	}

	@GetMapping("/brand_prdct_list/{b_id}")
	public String brand_prdct_list(@PathVariable("b_id") String b_id, Model model) {
		model.addAttribute("prdct", kspService.getPrdctList(b_id));
		model.addAttribute("mbr", kspService.getMemberInfo(b_id));
		return "ksp/brand_prdct_list";
	}

	@GetMapping("/prdct_list/{search}")
	public String seach_prdct_list(@PathVariable("search") String search, Model model) {
		model.addAttribute("result", kspService.getSearchResult(search));
		model.addAttribute("mbr", kspService.getMemberInfoByName(search));
		return "ksp/search_prdct_list";
	}
}
