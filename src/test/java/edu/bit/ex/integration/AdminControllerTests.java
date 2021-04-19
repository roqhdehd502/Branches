package edu.bit.ex.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class AdminControllerTests { // 관리자 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Test
	// 인증이 된 상태로 테스트를 진행함
	@WithMockUser(username = "abcd1234", password = "1234", authorities = "ADMIN")
	public void getMappingTest() throws Exception {
		// 관리자 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/admin/mypage")).andExpect(MockMvcResultMatchers.status().isOk());
		// 관리자 판매자 관리 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/admin/mypage/seller")).andExpect(MockMvcResultMatchers.status().isOk());
		// 관리자 회원 관리 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/admin/mypage/member")).andExpect(MockMvcResultMatchers.status().isOk());
	}
}