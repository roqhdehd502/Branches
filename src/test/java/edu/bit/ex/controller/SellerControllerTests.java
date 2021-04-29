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
public class SellerControllerTests { // 판매자 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Test
	// @AuthenticationPrincipal으로 인증된 페이지의 계정정보를 불러온다(MemberDetails 객체)
	@WithUserDetails("prism")
	public void getMappingTest() throws Exception {
		// 판매자 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdct")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 조회 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdct")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 주문 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/order")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 발송 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/release")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 취소 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/cancel")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 환불 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/refund")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 교환 확인 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/exchange")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 Q&A 조회 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdctqna")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 리뷰 조회 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/review")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 매출 조회 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/sales")).andExpect(MockMvcResultMatchers.status().isOk());
	}
}