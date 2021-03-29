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

	// 상품 등록 seller
	@GetMapping("/prdct_register")
	public String prdct_register(Model model) {
		log.info("prdct_register...");
		return "nmw/prdct_register";
	}

	// 업체 등록 admin
	@GetMapping("/seller_register")
	public String seller_register(Model model) {
		log.info("seller_register...");
		return "nmw/seller_register";
	}

	// 고객 등록 common
	@GetMapping("/member_register")
	public String member_register(Model model) {
		log.info("member_register...");
		return "nmw/member_register";
	}
}