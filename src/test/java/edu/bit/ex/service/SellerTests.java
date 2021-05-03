package edu.bit.ex.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.mapper.TestSellerMapper;
import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class) // Spring 5 버전 이후 테스트 구현
@SpringBootTest
public class SellerTests { // 판매자 테스트
	@Autowired
	private TestSellerMapper mapper;

	@Autowired
	private DataSource ds;

	@Autowired
	private SellerService sellerService;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Test
	public void testExist() {
		assertNotNull(sellerService);
	}

	@Test
	public void testDataSource() {
		System.out.println("DataSource: " + ds);

		try (Connection conn = ds.getConnection()) {
			System.out.println("Connection: " + conn);
			assertThat(conn).isInstanceOf(Connection.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 판매자 리스트
	@Test
	public void testGetSellerList() {
		System.out.println("Seller Mapper: " + mapper);
		System.out.println("Seller List: " + mapper.getSellerList().size());

		// 반복문으로 판매자 리스트 불러오기
		for (MbrVO vo : mapper.getSellerList()) {
			System.out.println("Member: " + vo);
		}
	}

	// 상품 qna 댓글등록
	@Test
	public void prdctQnACommentTest() {
		BoardBoardCommentVO comment = new BoardBoardCommentVO();
		comment.setBoard_id(1430);
		comment.setComment_content("JUnit testing seller");
		comment.setMbr_id("prism");

		mapper.getQnaCommentTest(comment);
	}

	// 댓글삭제
	@Test
	public void commentRemoveTest() {
		mapper.commentRemove(1430);
	}

	// 상품등록
	@Test
	public void prdctInfoInsertTest() {
		PrdctRegisterImageVO pvo = new PrdctRegisterImageVO();
		pvo.setMbr_id("prism");
		pvo.setPrdct_id("Junit Test PrdctID1");
		pvo.setPrdct_name("Junit Test Prdct1");
		pvo.setPrdct_thumbnail("10.jpg");
		pvo.setCategory_number(3);
		pvo.setPrdct_color("BLUE");
		pvo.setPrdct_price(10);
		pvo.setPrdct_size("S,M,L");
		pvo.setPrdct_stock(10);
		pvo.setBoard_content("Junit test");

		mapper.prdctInfoInsertTest(pvo);
	}

	// 상품 수정
	@Test
	public void prdctInfoUpdateTest() {
		PrdctRegisterImageVO pvo = new PrdctRegisterImageVO();
		pvo.setMbr_id("prism");
		pvo.setPrdct_id("p13");
		pvo.setPrdct_name("Junit Test Prdct");
		pvo.setCategory_number(3);
		pvo.setPrdct_color("BLUE");
		pvo.setPrdct_price(10);
		pvo.setPrdct_size("S,M,L");
		pvo.setPrdct_stock(10);

		mapper.prdctInfoUpdateTest(pvo);
	}

	// 상품삭제
	@Test
	public void prdctRemoveTest() {
		mapper.prdctRemove("p13");
	}

	// 주문정보 수정
	@Test
	public void orderInfoUpdateTest() {
		PrdctOrderDetailVO pvo = new PrdctOrderDetailVO();
		pvo.setMbr_id("defg1234");
		pvo.setOrder_number("20210428-111");
		pvo.setOrder_state_number(3);

		mapper.orderInfoUpdateTest(pvo);
	}

	// 판매자 회원정보 수정
	@Test
	public void seller_updateTest() {
		MbrShippingVO msVO = new MbrShippingVO();
		msVO.setMbr_id("prism");
		msVO.setMbr_pw(passEncoder.encode("testupdate"));
		msVO.setMbr_name("CHOI");
		msVO.setMbr_email("prism@naver.com");
		msVO.setContact_number("01011111111");
		msVO.setShipping_address("서울시 종로구");

		mapper.sellerInfoUpdateTest(msVO);
	}
}