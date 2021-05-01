package edu.bit.ex.service;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberServiceTest {

	@Autowired
	private MemberService memberService;

	@Autowired
	private DataSource ds;

	@Test
	public void testExist() {
		assertNotNull(memberService);
	}

	@Test
	public void getPrdctqMyListTest() {
		PrdQnACriteria cri = new PrdQnACriteria();
		memberService.getPrdctqMyList(cri, "testId");
	}

	@Test
	public void setPrdctQnaWriteTest() {
		BoardVO board = new BoardVO();
		board.setBoard_id(1350);
		board.setBoard_name("JUnit Test Board Name");
		board.setBoard_content("JUnit Test Board Content");
		board.setMbr_id("defg1234");
		board.setBoard_type_number(4);
		board.setInquiry_number(7);
		board.setPrdct_id("p08");

		memberService.setPrdctQnaWrite(board);
	}

	@Test
	public void setmyqnaModifyTest() {
		BoardVO board = new BoardVO();
		board.setBoard_id(1209);
		board.setBoard_name("JUnit Test Board Name");
		board.setBoard_content("JUnit Test Board Content");
		board.setInquiry_number(8);

		memberService.setmyqnaModify(board);
	}

	@Test
	public void myqnaRemoveTest() {
		memberService.myqnaRemove(1209);
	}

}
