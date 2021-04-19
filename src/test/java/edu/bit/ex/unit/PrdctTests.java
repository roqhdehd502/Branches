package edu.bit.ex.unit;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import edu.bit.ex.mapper.TestPrdctMapper;
import edu.bit.ex.vo.PrdctVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class) // Spring 5 버전 이후 테스트 구현
@SpringBootTest
public class PrdctTests { // 상품 테스트
	@Autowired
	private TestPrdctMapper mapper;

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

	// 상품 리스트
	@Test
	public void testGetPrdctList() {
		System.out.println("Prdct Mapper: " + mapper);
		System.out.println("Prdct List: " + mapper.getPrdctList().size());

		// 반복문으로 상품 리스트 불러오기
		for (PrdctVO vo : mapper.getPrdctList()) {
			System.out.println("Prdct: " + vo);
		}
	}
}