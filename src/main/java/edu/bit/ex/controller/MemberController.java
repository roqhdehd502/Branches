package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ex.service.LoginService;
import edu.bit.ex.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class MemberController {
	/* @Autowired */
	private LoginService loginService;

	// 게시글 리스트
	@GetMapping("/login")
	public String login(MemberVO memberVO, Model model) throws Exception {
		log.debug("login");
		log.info("login..");
		model.addAttribute("loginDummy", loginService.getLogin(memberVO.getBoard_id()));

		return "member/login";
	}

	@GetMapping("/test")
	public String test(Model model) throws Exception {
		log.debug("test");
		log.info("test");
		model.addAttribute("test", loginService.getId());
		return "test";
	}

	@GetMapping("/list")
	public String list(Model model) throws Exception {
		log.debug("list");
		log.info("list");
		model.addAttribute("list", loginService.getList());
		return "list";
	}
}