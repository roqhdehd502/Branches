package edu.bit.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
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
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception, ModelAndView mav) {
		log.info("login...");
		mav.setViewName("login/login");
		mav.addObject("error", error);
		mav.addObject("exception", exception);
		return mav;
	}

	@GetMapping("/test/login")
	public @ResponseBody String testLogin(Authentication authentication) {
		MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
		System.out.println("authentication : " + memberDetails.getMbrvo());

		return "세션 정보 확인";
	}

	@GetMapping("/test/oauth/login")
	public @ResponseBody String test_Oauth_Login(Authentication authentication) {
		OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
		System.out.println("authentication : " + oAuth2User.getAttributes());

		return "Oauth 세션 정보 확인";
	}

	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView logout(ModelAndView mav) {
		log.info("logout...");
		mav.setViewName("login/logout");
		return mav;
	}

	// 로그아웃 처리
	@GetMapping("/logoutsuccess")
	public void logoutsuccess(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		// return "redirect:/";
	}

	// 회원가입
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