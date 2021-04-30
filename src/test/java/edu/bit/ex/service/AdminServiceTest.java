package edu.bit.ex.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.MbrVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminServiceTest {

	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Test
	public void testExist() {
		assertNotNull(adminService);
	}

	@Test
	public void getSellerListWithCriTest() {
		MemberCriteria cri = new MemberCriteria();
		adminService.getSellerListWithCri(cri);
	}

	@Test
	public void getSellerTotalCountTest() {
		MemberCriteria cri = new MemberCriteria();
		adminService.getSellerTotalCount(cri);
	}

	@Test
	public void getMemberInfoTest() {
		adminService.getMemberInfo("testId");
	}

	@Test
	public void getSellerAddress() {
		adminService.getMemberInfo("testId");
	}

	@Test
	public void userQnACommentTest() {
		BoardCommentVO comment = new BoardCommentVO();
		comment.setBoard_id(435);
		comment.setComment_content("JUnit testing");
		comment.setMbr_id("admin");

		adminService.userQnAComment(comment);
	}

	@Test
	public void memberInfoUpdateTest() {
		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("testId");
		mbr.setMbr_name("testupdate");
		mbr.setMbr_pw(passEncoder.encode("testupdate"));
		mbr.setMbr_email("testupdate@tttt.com");
		mbr.setContact_number("01077777777");
		mbr.setMbr_gender("TT");

		adminService.memberInfoUpdate(mbr);
	}

	@Test
	public void addSellerTest() {
		MbrShippingVO mbr = new MbrShippingVO();
		mbr.setMbr_id("testIdseller");
		mbr.setMbr_name("testName");
		mbr.setMbr_nickname("testNickname");
		mbr.setMbr_pw(passEncoder.encode("testpw"));
		mbr.setMbr_email("testupdate@tttt.com");
		mbr.setContact_number("01077777777");
		mbr.setShipping_address("Test testing address");

		adminService.addSeller(mbr);
	}
}
