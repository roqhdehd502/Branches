package edu.bit.ex.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

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

import edu.bit.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class BoardControllerTests { // 게시판 컨트롤러 테스트
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private BoardController boardController;

	@Before
	public void getControllerTest() { // 게시판 컨트롤러
		this.mockMvc = MockMvcBuilders.standaloneSetup(boardController).build();
		mapper = new ObjectMapper();
	}

	@Test
	public void getMappingTest() throws Exception { // GET 매핑 테스트
		// 공지사항 게시판 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/board/notice")).andExpect(MockMvcResultMatchers.status().isOk());
		// 공지사항 게시글
		mockMvc.perform(MockMvcRequestBuilders.get("/board/notice/950")).andExpect(MockMvcResultMatchers.status().isOk());
		// 매거진 게시판 리스트
		mockMvc.perform(MockMvcRequestBuilders.get("/board/magazine")).andExpect(MockMvcResultMatchers.status().isOk());
		// 매거진 게시글
		mockMvc.perform(MockMvcRequestBuilders.get("/board/magazine/930")).andExpect(MockMvcResultMatchers.status().isOk());
	}

	@Test
	@WithUserDetails("defg1234")
	public void postMappingTest() throws Exception { // POST 매핑 테스트
		BoardVO board = new BoardVO();
		board.setBoard_id(1000);
		board.setMbr_id("abcd1234");
		board.setBoard_name("board_name");
		board.setBoard_content("board_content");
		String content = mapper.writeValueAsString(board);

		// 공지사항 작성
		mockMvc.perform(post("/admin/board/notice/write").content(content).contentType(MediaType.APPLICATION_JSON)).andDo(print()).andReturn();
		// 매거진 작성
		mockMvc.perform(post("/admin/board/magazine/write").content(content).contentType(MediaType.APPLICATION_JSON)).andDo(print()).andReturn();
	}

	@Test
	public void putMappingTest() throws Exception { // PUT 매핑 테스트
		BoardVO board = new BoardVO();
		board.setBoard_id(1000);
		board.setBoard_like(0);
		String content = mapper.writeValueAsString(board);

		// 매거진 게시글 추천
		mockMvc.perform(put("/board/magazine/930").content(content).contentType(MediaType.APPLICATION_JSON)).andDo(print()).andReturn();
	}

	@Test
	@WithUserDetails("defg1234")
	public void deleteMappingTest() throws Exception { // DELETE 매핑 테스트
		String noticeContent = mapper.writeValueAsString(noticeContent());
		String magazineContent = mapper.writeValueAsString(magazineContent());

		// 공지사항 게시글 삭제
		mockMvc.perform(put("/admin/board/notice/modify/950").content(noticeContent).contentType(MediaType.APPLICATION_JSON)).andDo(print())
				.andReturn();
		// 매거잔 게시글 삭제
		mockMvc.perform(put("/admin/board/magazine/modify/930").content(magazineContent).contentType(MediaType.APPLICATION_JSON)).andDo(print())
				.andReturn();
	}

	private BoardVO noticeContent() {
		BoardVO board = new BoardVO();
		board.setBoard_id(950);

		return board;
	}

	private BoardVO magazineContent() {
		BoardVO board = new BoardVO();
		board.setBoard_id(930);

		return board;
	}
}