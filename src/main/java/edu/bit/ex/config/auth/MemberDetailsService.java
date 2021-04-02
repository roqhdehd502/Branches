package edu.bit.ex.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.MbrVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

//로그인 요청 시 UserDetailsService 타입으로 IoC되어 있는 loadUserByUsername 함수 실행
//Security Session(내부 Authentication(내부(UserDetails))
@Slf4j
@Service
public class MemberDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private SecurityService securityService; // 자동 로그인할때 기존 mbr데이터 다 지우고 새로 회원가입 시켜서 해야함
												// SecurityService로 처리하면 순환주기를 형성해서 mapper로 써야한다

	@Override
	public UserDetails loadUserByUsername(String mbr_id) throws UsernameNotFoundException {

		MbrVO mbr = securityService.getMbr(mbr_id);
		log.info(mbr_id);
		log.info(mbr.getMbr_pw());
		if (mbr.getMbr_id() != null) {
			return new MemberDetails(mbr);
		}
		return mbr == null ? null : new MemberDetails(mbr);
	}

}
