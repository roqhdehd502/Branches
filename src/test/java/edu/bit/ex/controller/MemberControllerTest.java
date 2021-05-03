package edu.bit.ex.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.bit.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class MemberControllerTest {

	@Autowired
	MemberController memberController;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithUserDetails("defg1234")
	public void member_mypageTest() throws Exception {
		log.info("======member_mypageTest======");

		mockMvc.perform(MockMvcRequestBuilders.get("/member/mypage")) // 회원 마이페이지 테스트
				.andExpect(MockMvcResultMatchers.status().isOk()) //
				.andDo(MockMvcResultHandlers.print()); //
	}

	@Before // @Test 이전에 실행
	public void setupFormyqnaModifyTest() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
		mapper = new ObjectMapper();
	}

	@Test
	@WithUserDetails("defg1234")
	public void myqnaModifyTest() throws Exception {
		log.info("======myqnaModifyTest======");

		BoardVO board = new BoardVO();
		board.setBoard_id(1209);
		String content = mapper.writeValueAsString(board);

		mockMvc.perform(post("/member/mypage/myqna/modify/1209") // PostMapping Test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(MockMvcResultHandlers.print()).andReturn();
	}

	@Test
	@WithUserDetails("defg1234")
	public void prdctQnaWritingTest() throws Exception {
		log.info("======prdctQnaWritingTest======");

		BoardVO board = new BoardVO();
		board.setBoard_id(1350);
		board.setBoard_name("JUnit Test Board Name");
		board.setBoard_content("JUnit Test Board Content");
		board.setMbr_id("defg1234");
		board.setBoard_type_number(4);
		board.setInquiry_number(7);
		board.setPrdct_id("p08");
		String content = mapper.writeValueAsString(board);

		mockMvc.perform(post("/member/prdct/p08/qna/writing") // PostMapping Test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(MockMvcResultHandlers.print()).andReturn();
	}

	@Test
	@WithUserDetails("defg1234")
	public void myqnaDeleteTest() throws Exception {
		log.info("======myqnaDeleteTest======");

		mockMvc.perform(delete("/member/mypage/myqna/modify/1229") // DeleteMapping Test
				.with(csrf())).andExpect(status().isOk()) //
				.andDo(MockMvcResultHandlers.print()).andReturn();
	}

}