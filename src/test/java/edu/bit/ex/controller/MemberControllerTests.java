package edu.bit.ex.controller;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class MemberControllerTests { // 회원 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithUserDetails("defg1234")
	public void getMappingTest() throws Exception {
		// 회원 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage")).andExpect(MockMvcResultMatchers.status().isOk());
		// 회원 정보 조회 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/myinfo")).andExpect(MockMvcResultMatchers.status().isOk());
		// 상품 Q&A 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/prdctq/list")).andExpect(MockMvcResultMatchers.status().isOk());
		// 유저 Q&A 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/myqna/list")).andExpect(MockMvcResultMatchers.status().isOk());
		// 찜하기 목록 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/like")).andExpect(MockMvcResultMatchers.status().isOk());
		// 최근 본 상품 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/recently")).andExpect(MockMvcResultMatchers.status().isOk());
		// 작성한 상품 리뷰 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/review/list")).andExpect(MockMvcResultMatchers.status().isOk());
		// 주문내역 조회 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage/order")).andExpect(MockMvcResultMatchers.status().isOk());
	}
}