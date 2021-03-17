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
public class MemberController {

	@GetMapping("/main")
	public String main(Model model) throws Exception {
		log.debug("main");
		log.info("main");
		return "main";
	}

}