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
@RequestMapping("/ej/*")
public class EjController {
	/* @Autowired */

	// 게시글 리스트
	@GetMapping("/login2")
	public String login(Model model) throws Exception {
		log.debug("login");
		log.info("login..");

		return "ej/login2";
	}

	@GetMapping("/prd")
	public String ProductDetail(Model model) throws Exception {
		log.debug("product");
		log.info("product..");

		return "ej/productDetail";
	}

}