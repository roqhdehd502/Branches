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
	/* @Autowired */
//	private BoardService boardService;

	// 게시글 리스트
	@GetMapping("/login")
	public String login(Model model) {
		log.debug("list");
		log.info("list..");
		return "member/login";
	}
}