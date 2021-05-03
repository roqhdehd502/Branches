package edu.bit.ex.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class SellerControllerTests { // 판매자 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	SellerController sellerController;

	@Autowired
	ObjectMapper mapper;

	@Test
	// @AuthenticationPrincipal으로 인증된 페이지의 계정정보를 불러온다(MemberDetails 객체)
	@WithUserDetails("prism")
	public void getMappingTest() throws Exception {
		// 판매자 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 상품 조회 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/prdct")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 주문 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/order")).andExpect(MockMvcResultMatchers.status().isOk());
		// 판매자 주문 확인 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/order/p01/20210428-111")).andExpect(MockMvcResultMatchers.status().isOk());
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
		// 판매자 정보 수정 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/seller/mypage/myinfo/prism")).andExpect(MockMvcResultMatchers.status().isOk());
	}

	@Before // @Test 이전에 실행
	public void setupForSellerQnA_commentTest() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(sellerController).build();
		mapper = new ObjectMapper();
	}

	// 상품 qna 댓글 등록 테스트
	@Test
	@WithUserDetails("prism")
	public void sellerQnA_commentTest() throws Exception {
		BoardBoardCommentVO comment = new BoardBoardCommentVO();
		comment.setBoard_id(1431);
		comment.setMbr_id("prism");
		comment.setComment_content("JUnit testing......");
		String content = mapper.writeValueAsString(comment);

		mockMvc.perform(post("/seller/mypage/prdctqna/1431/register") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

	// 상품 qna 댓글삭제 테스트
	@Test
	@WithUserDetails("prism")
	public void commentDeleteTest() throws Exception {

		mockMvc.perform(delete("/seller/mypage/prdctqna/1430").with(csrf())).andExpect(status().isOk()).andDo(print());

	}

	// 상품 등록 테스트
	@Test
	@WithUserDetails("prism")
	public void seller_prdct_InsertTest() throws Exception {
		PrdctRegisterImageVO pvo = new PrdctRegisterImageVO();
		pvo.setMbr_id("prism");
		pvo.setPrdct_id("Junit Test PrdctID");
		pvo.setCategory_number(3);
		pvo.setPrdct_color("BLUE");
		pvo.setPrdct_price(10);
		pvo.setPrdct_size("S,M,L");
		pvo.setPrdct_stock(10);

		String content = mapper.writeValueAsString(pvo);

		mockMvc.perform(post("/seller/mypage/prdct") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

	// 상품 수정 테스트
	@Test
	@WithUserDetails("prism")
	public void seller_prdct_updateTest() throws Exception {
		PrdctRegisterImageVO pvo = new PrdctRegisterImageVO();
		pvo.setMbr_id("prism");
		pvo.setPrdct_id("p13");
		pvo.setCategory_number(3);
		pvo.setPrdct_color("BLUE");
		pvo.setPrdct_price(10);
		pvo.setPrdct_size("S,M,L");
		pvo.setPrdct_stock(10);

		String content = mapper.writeValueAsString(pvo);

		mockMvc.perform(post("/seller/mypage/prdct/modify/p13") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

	// 상품삭제 테스트
	@Test
	@WithUserDetails("prism")
	public void prdctDeleteTest() throws Exception {

		mockMvc.perform(delete("/seller/mypage/prdct/p01/delete").with(csrf())).andExpect(status().isOk()).andDo(print());

	}

	// 주문 수정 테스트
	@Test
	@WithUserDetails("prism")
	public void seller_order_updateTest() throws Exception {
		PrdctOrderDetailVO pvo = new PrdctOrderDetailVO();
		pvo.setMbr_id("defg1234");
		pvo.setOrder_number("20210428-111");
		pvo.setOrder_state_number(3);

		String content = mapper.writeValueAsString(pvo);

		mockMvc.perform(post("/seller/mypage/order/p01/20210428-111/modify") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

	// 판매자 정보 수정 테스트
	@Test
	@WithUserDetails("prism")
	public void seller_updateTest() throws Exception {
		MbrShippingVO msVO = new MbrShippingVO();
		msVO.setMbr_id("prism");
		msVO.setMbr_pw("JUnit Test PW");
		msVO.setMbr_name("CHOI");
		msVO.setMbr_email("prism@naver.com");
		msVO.setContact_number("01011111111");
		msVO.setShipping_address("서울시 종로구");

		String content = mapper.writeValueAsString(msVO);

		mockMvc.perform(put("/seller/mypage/myinfo") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

}