package edu.bit.ex.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import edu.bit.ex.vo.MbrVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SecurityServiceTest {

	@Autowired
	private SecurityService securityService;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Test
	public void testExist() {
		assertNotNull(securityService);
	}

	@Test
	public void addMbrTest() {
		Date date = new Date(2021, 04, 30);

		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("testId");
		mbr.setMbr_pw(passEncoder.encode("testPW"));
		mbr.setMbr_email("JunitTest@test.com");
		mbr.setMbr_nickname("test nickname");
		mbr.setMbr_name("Junit Test");
		mbr.setContact_number("01088888888");
		mbr.setMbr_birth(date);
		mbr.setMbr_gender("T");
		mbr.setLogin_number(1);

		securityService.addMbr(mbr);
	}

	@Test
	public void getMbrTest() {
		securityService.getMbr("testId");
	}

	@Test
	public void idChkTest() {
		securityService.idChk("testId");
	}

	@Test
	public void findIDTest() {
		securityService.findID("testId", "01088888888");
	}

	@Test
	public void findPWTest() {

		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("testId");
		mbr.setMbr_name("Junit Test");
		mbr.setMbr_email("JunitTest@test.com");
		mbr.setMbr_pw("00000000");

		securityService.findPW(mbr);
	}

}
