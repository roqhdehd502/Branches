package edu.bit.ex.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

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

import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class AdminControllerTest {

	@Autowired
	AdminController adminController;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithUserDetails("admin")
	public void admin_seller_listTest() throws Exception {
		log.info("======admin_seller_listTest======");
		mockMvc.perform(MockMvcRequestBuilders.get("/admin/mypage/seller")) // 판매자
				.andExpect(MockMvcResultMatchers.status().isOk()) //
				.andDo(MockMvcResultHandlers.print()); //
	}

	@Before // @Test 이전에 실행
	public void setupForadminQnA_commentTest() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(adminController) //
				.build(); //
		mapper = new ObjectMapper();
	}

	@Test
	@WithUserDetails("admin")
	public void adminQnA_commentTest() throws Exception {
		log.info("======adminQnA_commentTest======");
		BoardCommentVO comment = new BoardCommentVO();
		comment.setBoard_id(435);
		comment.setComment_content("JUnit testing......");
		String content = mapper.writeValueAsString(comment);

		mockMvc.perform(post("/admin/mypage/member/userQnA/435/comment") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(MockMvcResultHandlers.print()).andReturn();
	}

	@Test
	@WithUserDetails("admin")
	public void admin_member_updateTest() throws Exception {
		log.info("======admin_member_updateTest======");
		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("defg1234");
		mbr.setMbr_name("JUnit Test Name");
		mbr.setMbr_pw("JUnit Test PW");
		mbr.setMbr_email("JunitTest@test.com");
		mbr.setContact_number("01099999999");
		mbr.setMbr_gender("T");

		String content = mapper.writeValueAsString(mbr);

		mockMvc.perform(put("/admin/mypage/member/defg1234") // putmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(MockMvcResultHandlers.print()).andReturn();
	}
}