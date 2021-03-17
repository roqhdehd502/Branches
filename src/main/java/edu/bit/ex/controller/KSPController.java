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
@RequestMapping("/ksp/*")
public class KSPController {

	@GetMapping("/prdct_list")
	public String prdct_list(Model model) {
		return "ksp/prdct_list";
	}
}
