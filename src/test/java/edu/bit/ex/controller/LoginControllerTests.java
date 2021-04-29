package edu.bit.ex.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class LoginControllerTests { // 로그인 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	// 비로그인 권한 테스트
	@Test
	@WithAnonymousUser
	public void index_anonymous() throws Exception {
		mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk());
	}

	// 회원 로그인 권한 테스트
	@Test
	@WithMockUser(username = "defg1234", password = "1234", authorities = "MEMBER")
	public void index_user() throws Exception {
		mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk());
	}

	// 판매자 로그인 권한 테스트
	@Test
	@WithMockUser(username = "prism", password = "1234", authorities = "SELLER")
	public void admin_user() throws Exception {
		mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk());
	}

	// 관리자 로그인 권한 테스트
	@Test
	@WithMockUser(username = "abcd1234", password = "1234", authorities = "ADMIN")
	public void admin_admin() throws Exception {
		mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk());
	}

	// 로그인 통과 테스트
	@Test
	@Transactional
	public void login_success() throws Exception {
		String username = "abcd1234";
		String password = "1234";

		mockMvc.perform(get("/login").with(user(username).roles("ADMIN"))).andDo(print()).andExpect(status().isOk());
	}

	// 로그인 거부 테스트
	@Test
	@Transactional
	public void login_fail() throws Exception {
		String username = "abcd1234";
		String password = "123";

		mockMvc.perform(formLogin().user(username).password(password)).andExpect(unauthenticated());
	}
}