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

	@GetMapping("/seller/mypage")
	public String seller_mypage(Model model) {
		return "ksp/seller_mypage";
	}

	@GetMapping("/seller/{m_id}/myinfo")
	public String seller_mypage_modify(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/seller_mypage_modify";
	}
}
