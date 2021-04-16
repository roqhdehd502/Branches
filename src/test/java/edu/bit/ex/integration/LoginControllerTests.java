package edu.bit.ex.integration;

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
		mockMvc.perform(get("/")).andDo(print()).andExpect(status().isOk());
	}

	// 회원 권한 테스트
	@Test
	@WithMockUser(username = "defg1234", authorities = "member")
	public void index_user() throws Exception {
		mockMvc.perform(get("/")).andDo(print()).andExpect(status().isOk());
	}

	// 관리자 권한 범위 테스트
	@Test
	@WithMockUser(username = "abcd1234", authorities = "member")
	public void admin_user() throws Exception {
		mockMvc.perform(get("/admin")).andDo(print()).andExpect(status().isForbidden());
	}

	// 관리자 권한 테스트
	@Test
	@WithMockUser(username = "abcd1234", authorities = "admin")
	public void admin_admin() throws Exception {
		mockMvc.perform(get("/admin")).andDo(print()).andExpect(status().isOk());
	}

	/*
	 * @Test
	 * 
	 * @Transactional public void login_success() throws Exception { String username = "abcd1234"; String password = "1234";
	 * 
	 * mockMvc.perform(formLogin().user(user.getUsername()).password(password)).andExpect(authenticated()); }
	 * 
	 * @Test
	 * 
	 * @Transactional public void login_fail() throws Exception { String username = "abcd1234"; String password = "123";
	 * 
	 * mockMvc.perform(formLogin().user(user.getUsername()).password("1234")).andExpect(unauthenticated()); }
	 */
}