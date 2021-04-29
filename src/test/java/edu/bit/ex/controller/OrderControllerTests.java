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
public class OrderControllerTests { // 주문 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithUserDetails("defg1234")
	public void getMappingTest() throws Exception {
		// 장바구니 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/order/cart")).andExpect(MockMvcResultMatchers.status().isOk());
		// 주문 리스트 정보입력 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/order/cart/orderInput")).andExpect(MockMvcResultMatchers.status().isOk());
	}
}