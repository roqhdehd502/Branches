package edu.bit.ex.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class BoardControllerTests { // 게시판 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Test
	public void getMappingTest() throws Exception {
		// 공지사항 게시판 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/board/notice")).andExpect(MockMvcResultMatchers.status().isOk());
		// 매거진 게시판 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/board/magazine")).andExpect(MockMvcResultMatchers.status().isOk());
	}
}