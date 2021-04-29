package edu.bit.ex.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import edu.bit.ex.mapper.TestLoginMapper;
import edu.bit.ex.vo.MbrVO;

@SpringBootTest
public class LoginTests { // 로그인 테스트
	@Autowired
	private TestLoginMapper mapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 로그인 타입 테스트
	@Test
	public void testLoginType() {
		System.out.println("Login Mapper: " + mapper);
		System.out.println("General List: " + mapper.getGeneralList().size());
		System.out.println("Kakao List: " + mapper.getKakaoList().size());
		System.out.println("Naver List: " + mapper.getNaverList().size());
		System.out.println("Google List: " + mapper.getGoogleList().size());

		// 반복문으로 로그인 타입 리스트 불러오기
		for (MbrVO vo : mapper.getGeneralList()) {
			System.out.println("General: " + vo);
		}
		for (MbrVO vo : mapper.getKakaoList()) {
			System.out.println("Kakao: " + vo);
		}
		for (MbrVO vo : mapper.getNaverList()) {
			System.out.println("Naver: " + vo);
		}
		for (MbrVO vo : mapper.getGoogleList()) {
			System.out.println("Google: " + vo);
		}
	}

	// 패스워드 인코딩 테스트
	@Test
	public void testPasswordEncode() {
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