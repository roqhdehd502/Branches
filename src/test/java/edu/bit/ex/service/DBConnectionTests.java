package edu.bit.ex.service;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class) // Spring 5 버전 이후 테스트 구현
@SpringBootTest
public class DBConnectionTests { // DB 연결 테스트
	@Autowired
	private DataSource ds;

	// DataSource Connection 확인
	@Test
	public void testConnection() {
		try (Connection conn = ds.getConnection()) {
			System.out.println("DB Connection Success" + conn);
		} catch (Exception e) {
			System.out.println("DB Connection fail");
			e.printStackTrace();
		}
	}
}