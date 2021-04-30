package edu.bit.ex.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.Date;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class LoginControllerTest {

	@Autowired
	LoginController loginController;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private MockMvc mockMvc;

	@Test
	public void loginTest() throws Exception { // getmapping test
		mockMvc.perform(MockMvcRequestBuilders.get("/login")).andExpect(MockMvcResultMatchers.status().isOk()).andDo(print());
	}

	@Test
	public void memberRegisterTest() throws Exception { // getmapping test
		mockMvc.perform(MockMvcRequestBuilders.get("/join")).andExpect(MockMvcResultMatchers.status().isOk()).andDo(print());
	}

	@Before // @Test 이전에 실행
	public void setupFormemberRegistingTest() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(loginController).build();
		mapper = new ObjectMapper();
	}

	@Test
	public void memberRegistingTest() throws Exception {

		Date date = new Date(2021, 04, 30);

		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("testId");
		mbr.setMbr_pw("test");
		mbr.setMbr_nickname("test nickname");
		mbr.setMbr_email("JunitTest@test.com");
		mbr.setMbr_name("Junit Test");
		mbr.setContact_number("01088888888");
		mbr.setMbr_birth(date);
		mbr.setMbr_gender("T");

		String content = mapper.writeValueAsString(mbr);

		mockMvc.perform(MockMvcRequestBuilders.post("/join") // postmapping test
				.content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}
}