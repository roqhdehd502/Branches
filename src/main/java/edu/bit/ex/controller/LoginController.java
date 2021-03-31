package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class LoginController {

	@Autowired
	private SecurityService securityService;

	// @Autowired
	// private MemberDetailsService memberdetailsservice;

	// 로그인페이지

	@GetMapping("/login")
	public ModelAndView login(ModelAndView mav) {
		log.info("login...");
		mav.setViewName("/login");
		return mav;
	}

	// 고객 등록 페이지

	@GetMapping("/join")
	public ModelAndView memberRegister(ModelAndView mav) {
		log.info("memberRegister...");
		mav.setViewName("join");
		return mav;
	}

	@PostMapping("/join")
	public ResponseEntity<String> memberRegister(@RequestBody MbrVO mbrvo) {
		log.info("Sign Up Member >>> " + mbrvo.getMbr_id());

		mbrvo.setMbr_name("관리자");
		mbrvo.setAuthority_number(1);
		mbrvo.setMbr_gender("F");
		// mbrvo.setMbr_birth("1997-02-18");
		mbrvo.setMbr_email("pyo@pyo.com");
		mbrvo.setLogin_number(1);
		mbrvo.setContact_number("01011111111");
		mbrvo.setMbr_nickname("ㄱㄹㅈ");
		mbrvo.setMbr_point(0);
		// mbrvo.setJdate();
		mbrvo.setGrade_number(1);

		ResponseEntity<String> entity = null;

		try {
			securityService.addMbr(mbrvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("/denied")
	public ModelAndView denied(ModelAndView mav) {
		log.info("denied......");
		mav.setViewName("denied");
		return mav;
	}

}