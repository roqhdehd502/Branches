package edu.bit.ex.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import edu.bit.ex.vo.MbrVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class MemberDetails implements UserDetails, OAuth2User {

	@Autowired
	private MbrVO mbrvo;

	private Map<String, Integer> cart = new HashMap<>();

	private Map<String, Object> attributes;

	public MemberDetails(MbrVO mbrvo) {
		this.mbrvo = mbrvo;
	}

	public MemberDetails(MbrVO mbrvo, Map<String, Object> attributes) {
		this.mbrvo = mbrvo;
		this.attributes = attributes;
	}

	public String getUserID() {
		// TODO Auto-generated method stub
		return mbrvo.getMbr_id();
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

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	public Map<String, Integer> getCart() {

		return cart;
	}

	public void insertCart(String prdct_id, int order_amount) {
		if (cart.get(prdct_id) == null) {
			cart.put(prdct_id, order_amount);
		} else {
			cart.put(prdct_id, cart.get(prdct_id) + order_amount);
		}
	}

	public void deleteCart(String prdct_id) {
		cart.remove(prdct_id);
	}

}