package edu.bit.ex.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.service.SecurityService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class SellerControllerTests { // 판매자 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private SecurityService securityService;

	private void authMember(@AuthenticationPrincipal MemberDetails memberDetails) {
		log.info("authMember...");

		securityService.getMbr(memberDetails.getUserID());
	}

	@Test
	// 계정 정보를 입력 후 테스트를 진행함
	/* MemberDetails 널 포인터 참조 현상 해결할 것 */
	@WithMockUser(username = "prism", password = "1234", authorities = "SELLER")
	public void getMappingTest() throws Exception {
		authMember(null);

		// 판매자 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdct")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 조회 리스트
		/*
		 * mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdct")).andExpect(MockMvcResultMatchers.status().isOk()); // 판매자 주문 확인 리스트
		 * mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/order")).andExpect(MockMvcResultMatchers.status().isOk()); // 판매자 발송 확인 리스트
		 * mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/release")).andExpect(MockMvcResultMatchers.status().isOk()); // 판매자 취소 확인 리스트
		 * mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/cancel")).andExpect(MockMvcResultMatchers.status().isOk()); // 판매자 환불 확인 리스트
		 * mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/refund")).andExpect(MockMvcResultMatchers.status().isOk());
		 */
	}
}