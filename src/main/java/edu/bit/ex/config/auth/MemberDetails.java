package edu.bit.ex.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDetails implements UserDetails {

	private MbrVO mbrvo;
	private Map<Integer, Object> attributes;

	public MemberDetails(MbrVO mbrvo) {
		this.mbrvo = mbrvo;
	}

	public MemberDetails(MbrVO mbrvo, Map<Integer, Object> attributes) {
		this.mbrvo = mbrvo;
		this.attributes = attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();

		collect.add(new GrantedAuthority() {

			@Override
			public String getAuthority() {
				// TODO Auto-generated method stub
				log.warn("+++++++++++++++" + mbrvo.getAuthorityVO().getAuthority_name());
				return mbrvo.getAuthorityVO().getAuthority_name();
			}
		});

		return collect;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return mbrvo.getMbr_pw();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return mbrvo.getMbr_name();
	}

	@Override
	public boolean isAccountNonExpired() { //
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 계정 유효기간 초과
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() { // 계정 활성화여부
		// TODO Auto-generated method stub
		return true;
	}

}
