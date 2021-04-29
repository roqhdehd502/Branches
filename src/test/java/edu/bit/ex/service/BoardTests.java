package edu.bit.ex.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import edu.bit.ex.mapper.TestBoardMapper;
import edu.bit.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class) // Spring 5 버전 이후 테스트 구현
@SpringBootTest
public class BoardTests { // 게시판 테스트
	@Autowired
	private TestBoardMapper mapper;

	@Autowired
	private DataSource ds;

	@Test
	public void testDataSource() {
		System.out.println("DataSource: " + ds);

		try (Connection conn = ds.getConnection()) {
			System.out.println("Connection: " + conn);
			assertThat(conn).isInstanceOf(Connection.class);
			// assertEquals(100, getLong(conn, "select 100 from dual"));
			// assertTrue(0 < getLong(conn, "select count(*) from User"));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/*
	 * private long getLong(Connection conn, String sql) { long result = 0; try (Statement stmt = conn.createStatement()) { ResultSet rs =
	 * stmt.executeQuery(sql); if (rs.next()) { result = rs.getLong(1); } rs.close(); } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */

	// 게시판 리스트
	@Test
	public void testGetBoardList() {
		System.out.println("Board Mapper: " + mapper);
		System.out.println("Board Notice List: " + mapper.getNoticeList().size());
		System.out.println("Board Magazine List: " + mapper.getMagazineList().size());

		// 반복문으로 공지사항 게시판 제목 불러오기
		for (BoardVO vo : mapper.getNoticeList()) {
			System.out.println("Board Notice Name: " + vo.getBoard_name());
		}

		// 반복문으로 매거진 게시판 제목 불러오기
		for (BoardVO vo : mapper.getMagazineList()) {
			System.out.println("Board Magazine Name: " + vo.getBoard_name());
		}
	}
}