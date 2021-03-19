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

	@GetMapping("/mypage")
	public String mypage(Model model) throws Exception {
		log.debug("mypage");
		log.info("mypage");
		return "chs/mypage";
	}

	@GetMapping("/sellerpage")
	public String sellerpage(Model model) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		return "chs/sellerpage";
	}

	@GetMapping("/adminpage")
	public String adminpage(Model model) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		return "chs/adminpage";
	}

}
