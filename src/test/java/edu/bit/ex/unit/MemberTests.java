package edu.bit.ex.unit;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import edu.bit.ex.mapper.TestMemberMapper;
import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class) // Spring 5 버전 이후 테스트 구현
@SpringBootTest
public class MemberTests { // 회원 테스트
	@Autowired
	private TestMemberMapper mapper;

	@Autowired
	private DataSource ds;

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

	// 회원 리스트
	@Test
	public void testGetMemberList() {
		System.out.println("Member Mapper: " + mapper);
		System.out.println("Member List: " + mapper.getMemberList().size());

		// 반복문으로 회원 리스트 불러오기
		for (MbrVO vo : mapper.getMemberList()) {
			System.out.println("Member: " + vo);
		}
	}
}