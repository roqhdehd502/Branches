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

	@GetMapping("/member/myinfo") // 회원 정보수정페이지
	public String member_mypage_modify(Model model) {
		return "ksp/member_mypage_modify";
	}

	@GetMapping("/member/{m_id}/myinfo") // 회원 정보수정페이지
	public String member_mypage_modify(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_mypage_modify";
	}

	@GetMapping("/member/question") // 회원 고객Q&A입력페이지
	public String member_q_a(Model model) {
		model.addAttribute("inq", kspService.getInquiry());

		return "ksp/member_question";
	}

	@GetMapping("/member/{m_id}/myinfo/myreview") // 회원 상품리뷰목록
	public String member_myreview_list(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myreview_list";
	}

	@GetMapping("/member/{m_id}/myinfo/myprdctq") // 회원 상품Q&A목록
	public String member_myprdctq_list(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myprdctq_list";
	}

	@GetMapping("/member/{m_id}/myinfo/myq") // 회원 고객Q&A목록
	public String member_myq_list(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myq_list";
	}

	@GetMapping("/member/myinfo/myq") // 회원 고객Q&A목록
	public String member_myq_list(Model model) {
		// model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_myq_list";
	}

	@GetMapping("/member/order/complete") // 주문완료페이지
	public String member_order_complete(Model model) {
		// model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/member_order_complete";
	}

	@GetMapping("/seller/{m_id}/myinfo") // 판매자 정보수정페이지
	public String seller_mypage_modify(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mem", kspService.getMemberInfo(m_id));
		return "ksp/seller_mypage_modify";
	}

	/*
	 * @GetMapping("/brand_prdct_list/{b_id}") // 브랜드 상품리스트페이지 public String brand_prdct_list(@PathVariable("b_id") String b_id, Model model) {
	 * model.addAttribute("prdct", kspService.getPrdctList(b_id)); model.addAttribute("mbr", kspService.getMemberInfo(b_id)); return
	 * "ksp/brand_prdct_list"; }
	 */

	/*
	 * @GetMapping("/prdct_list/{search}") // 검색 상품리스트페이지 public String search_prdct_list(@PathVariable("search") String search, Model model) {
	 * model.addAttribute("result", kspService.getSearchResult(search)); model.addAttribute("mbr", kspService.getMemberInfoByName(search)); return
	 * "ksp/search_prdct_list"; }
	 */

	@GetMapping("/member/myreview") // 회원 내가쓴 리뷰상세페이지
	public String member_myreview(Model model) {
		return "ksp/member_myreview";
	}

	@GetMapping("/member/{m_id}/myreview/{b_id}") // 회원 내가쓴 리뷰상세페이지
	public String member_myreview(@PathVariable("m_id") String m_id, @PathVariable("b_id") int b_id, Model model) {
		// model.addAllAttributes("mem", kspS)
		return "ksp/member_myreview";
	}

	@GetMapping("/member/myprdctq") // 회원 내가쓴 상품Q&A상세페이지
	public String member_myprdctq(Model model) {
		return "ksp/member_myprdctq";
	}

	@GetMapping("/member/{m_id}/myprdctq/{b_id}") // 회원 내가쓴 상품Q&A상세페이지
	public String member_myprdctq(@PathVariable("m_id") String m_id, @PathVariable("b_id") int b_id, Model model) {
		// model.addAllAttributes("mem", kspS)
		return "ksp/member_myprdctq";
	}

	@GetMapping("/member/myq") // 회원 내가쓴 상품Q&A상세페이지
	public String member_myq(Model model) {
		return "ksp/member_myq";
	}

	@GetMapping("/member/{m_id}/myq/{b_id}") // 회원 내가쓴 상품Q&A상세페이지
	public String member_myq(@PathVariable("m_id") String m_id, @PathVariable("b_id") int b_id, Model model) {
		// model.addAllAttributes("mem", kspS)
		return "ksp/member_myq";
	}

	/*
	 * @GetMapping("admin/seller") // 관리자 업체목록페이지 public String admin_seller_list(Model model) { model.addAttribute("mbr",
	 * kspService.getMemberList(2)); return "ksp/admin_seller_list"; }
	 */

	/*
	 * @GetMapping("admin/member") // 관리자 회원목록페이지 public String admin_member_list(Model model) { model.addAttribute("mbr",
	 * kspService.getMemberList(3)); return "ksp/admin_member_list"; }
	 */

	@GetMapping("admin/seller/{m_id}") // 관리자 업체상세페이지
	public String admin_seller(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mbr", kspService.getMemberInfo(m_id));
		return "ksp/admin_seller";
	}

	@GetMapping("admin/member/{m_id}") // 관리자 회원상세페이지
	public String admin_member(@PathVariable("m_id") String m_id, Model model) {
		model.addAttribute("mbr", kspService.getMemberInfo(m_id));
		return "ksp/admin_member";
	}

}
