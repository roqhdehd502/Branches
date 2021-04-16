package edu.bit.ex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class FooterController {
	// 회사소개
	@GetMapping("/company-intro")
	public ModelAndView companyIntro(ModelAndView mav) {
		log.info("companyIntro...");
		mav.setViewName("common/footer_link/company_intro");

		return mav;
	}

	// 사이트소개
	@GetMapping("/site-intro")
	public ModelAndView siteIntro(ModelAndView mav) {
		log.info("siteIntro...");
		mav.setViewName("common/footer_link/site_intro");

		return mav;
	}

	// 제휴문의
	@GetMapping("/affiliate-inquiry")
	public ModelAndView affiliateInquiry(ModelAndView mav) {
		log.info("affiliateInquiry...");
		mav.setViewName("common/footer_link/affiliate_inquiry");

		return mav;
	}

	// 채용정보
	@GetMapping("/recruit")
	public ModelAndView recruit(ModelAndView mav) {
		log.info("recruit...");
		mav.setViewName("common/footer_link/recruit");

		return mav;
	}

	// 이용약관
	@GetMapping("/tos")
	public ModelAndView termsOfService(ModelAndView mav) {
		log.info("termsOfService...");
		mav.setViewName("common/footer_link/terms_of_service");

		return mav;
	}

	// 개인정보처리
	@GetMapping("/personal-info")
	public ModelAndView personalInfo(ModelAndView mav) {
		log.info("personalInfo...");
		mav.setViewName("common/footer_link/personal_info");

		return mav;
	}
}