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
@RequestMapping("/nmw/*")
public class NMWController {

	// 상품 등록
	@GetMapping("/prdct_register")
	public String prdct_register(Model model) {
		log.info("prdct_register...");
		return "nmw/prdct_register";
	}

	// 업체 등록
	@GetMapping("/seller_register")
	public String seller_register(Model model) {
		log.info("seller_register...");
		return "nmw/seller_register";
	}

	// 고객 등록
	@GetMapping("/member_register")
	public String member_register(Model model) {
		log.info("member_register...");
		return "nmw/member_register";
	}

	// 카카오 소셜 고객 등록
	@GetMapping("/kakao_register")
	public String kakao_register(Model model) {
		log.info("kakao_register...");
		return "nmw/kakao_register";
	}

	// 네이버 소셜 고객 등록
	@GetMapping("/naver_register")
	public String naver_register(Model model) {
		log.info("naver_register...");
		return "nmw/naver_register";
	}

	// 구글 소셜 고객 등록
	@GetMapping("/google_register")
	public String google_register(Model model) {
		log.info("google_register...");
		return "nmw/google_register";
	}

	// 페이스북 소셜 고객 등록
	@GetMapping("/facebook_register")
	public String facebook_register(Model model) {
		log.info("facebook_register...");
		return "nmw/facebook_register";
	}

	@GetMapping("/upload_view")
	public String upload_view(Model model) {
		log.info("upload_view...");
		return "nmw/upload_view";
	}
}