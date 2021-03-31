package edu.bit.ex.controller;

public class MemberController {
	@Autowired
	private MemberService memberService;

	// 고객 등록 페이지
	@GetMapping("/register")
	public ModelAndView memberRegister(ModelAndView mav) {
		log.info("memberRegister...");
		mav.setViewName("login/member_register");
		return mav;
	}
}