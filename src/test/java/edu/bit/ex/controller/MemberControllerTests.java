package edu.bit.ex.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.bit.ex.vo.PrdctVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class MemberControllerTests {

	@Autowired
	MemberController memberController;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithUserDetails("defg1234")
	public void member_mypageTest() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage")).andExpect(MockMvcResultMatchers.status().isOk());
	}

	@Before // @Test 이전에 실행
	public void setupForproductQnARegisterTest() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
		mapper = new ObjectMapper();
	}

	@Test
	@WithUserDetails("defg1234")
	public void adminQnA_commentTest() throws Exception {
		PrdctVO prdct = new PrdctVO();
		prdct.setPrdct_id("p08");

		String content = mapper.writeValueAsString(prdct);

		mockMvc.perform(post("/prdct/p08/qna/write") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andReturn();
	}

}