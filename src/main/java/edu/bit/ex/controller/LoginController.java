package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.LoginService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class LoginController {
	@Autowired
	private LoginService loginService;

	// 로그인페이지
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mav) {
		log.info("login...");
		mav.setViewName("login/login");
		return mav;
	}

	// 고객 등록 페이지
	@GetMapping("/register")
	public ModelAndView memberRegister(ModelAndView mav) {
		log.info("memberRegister...");
		mav.setViewName("login/member_register");
		return mav;
	}
}