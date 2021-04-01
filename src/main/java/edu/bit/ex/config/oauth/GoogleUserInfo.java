package edu.bit.ex.config.oauth;

import java.util.Map;

public class GoogleUserInfo implements OAuth2UserInfo {

	private Map<String, Object> attributes;

	public GoogleUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	@Override
	public String getProvider() {
		// TODO Auto-generated method stub
		return "4";
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return (String) attributes.get("email");
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return (String) attributes.get("name");
	}

	@Override
	public String getProviderId() {
		// TODO Auto-generated method stub
		return (String) attributes.get("sub");
	}

}
