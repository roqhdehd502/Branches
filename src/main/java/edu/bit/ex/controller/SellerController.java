package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.bit.ex.service.SellerService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/seller/*")
public class SellerController {
	@Autowired
	private SellerService sellerService;

	// 상품 등록 seller
	@GetMapping("/prdct_register")
	public String prdct_register(Model model) {
		log.info("prdct_register...");
		return "nmw/prdct_register";
	}

	// 판매자 등록상품 확인 seller
	@GetMapping("/spc")
	public String SellerProductCheck(Model model) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");

		return "ej/sellerProductCheck";
	}

	// 판매자 등록상품 수정 seller
	@GetMapping("/spm")
	public String SellerProductModify(Model model) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");

		return "ej/sellerProductModify";
	}
}