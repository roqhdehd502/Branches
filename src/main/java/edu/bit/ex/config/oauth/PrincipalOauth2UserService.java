package edu.bit.ex.config.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.mapper.LoginMapper;
import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

	@Autowired
	private LoginMapper mapper;

	// 사이트별 userRequest 데이터 후처리
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info("======Login for OAuth2Service======");
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration());
		System.out.println("getAccessToken :" + userRequest.getAccessToken().getTokenValue());
		System.out.println("getAttributes : " + super.loadUser(userRequest).getAttributes());
		System.out.println("userRequest : " + userRequest);

		OAuth2User oauth2User = super.loadUser(userRequest);
		OAuth2UserInfo userInfo = null;

		// 소셜 종류 확인
		if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			userInfo = new GoogleUserInfo(oauth2User.getAttributes());
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			userInfo = new NaverUserInfo((Map) oauth2User.getAttributes().get("response"));
		}

		MbrVO mbr = mapper.getMbr(userInfo.getProviderId());
		if (mbr == null) { // 회원가입 여부 확인
			mbr = new MbrVO();
			mbr.setMbr_id(userInfo.getProviderId());
			mbr.setMbr_pw("PW_" + userRequest.getClientRegistration().getRegistrationId());
			mbr.setMbr_name(userInfo.getName());
			mbr.setAuthority_number(3);
			mbr.setMbr_email(userInfo.getName());
			mbr.setLogin_number(Integer.parseInt(userInfo.getProvider()));
			mbr.setMbr_nickname(userInfo.getName());
			mbr.setMbr_point(0);
			mbr.setGrade_number(3);

			mapper.addMbr(mbr);

			mbr = mapper.getMbr(userInfo.getProviderId());
		}
		return new MemberDetails(mbr, oauth2User.getAttributes());
	}
}
