package edu.bit.ex.config.oauth;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo {

	private Map<String, Object> attributes;

	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	// 카카오에선 회원 id가 Int값으로 들어오기 때문에 이에 대한 형변환이 필요하다
	// (출처: 3조. 스프링 시큐리티)
	@Override
	public String getProviderId() {
		return Integer.toString((int) attributes.get("id"));
	}

	@Override
	public String getProvider() {
		return "2";
	}

	@Override
	public String getEmail() {
		return (String) ((Map) attributes.get("kakao_account")).get("email");
	}

	@Override
	public String getName() {
		return (String) ((Map) ((Map) attributes.get("kakao_account")).get("profile")).get("nickname");
	}

}