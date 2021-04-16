package edu.bit.ex.unit;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
public class PasswordTests { // 패스워드 테스트
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Test
	public void testEncode() {
		// 임의의 더미 패스워드 선언 및 값 초기화
		String password = "1111";
		// 1111 이라는 패스워드 값 Bycrypt 인코딩 적용
		String enPw = passwordEncoder.encode(password);
		// 인코딩 되었는지 확인
		System.out.println("enPw: " + enPw);

		// 입력한 패스워드랑 인코딩된 패스워드가 서로 매치가 되는지 확인
		boolean matchResult = passwordEncoder.matches(password, enPw);
		System.out.println("matchResult: " + matchResult);
	}
}
