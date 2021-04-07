package edu.bit.ex.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.header.writers.StaticHeadersWriter;
import org.springframework.web.filter.CharacterEncodingFilter;

import edu.bit.ex.config.auth.MemberDetailsService;
import edu.bit.ex.config.oauth.PrincipalOauth2UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private final AuthenticationSuccessHandler customSuccessHandler;

	@Autowired
	private final AuthenticationFailureHandler customFailureHandler;

	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;

	@Autowired
	private final MemberDetailsService memberDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("authorizeRequests >>> ");

		CharacterEncodingFilter filter = new CharacterEncodingFilter();

		filter.setEncoding("UTF-8");

		filter.setForceEncoding(true);

		http.addFilterBefore(filter, CsrfFilter.class);
		// rest of your code
		// CSRF 설정을 해제합니다
		// 초기 개발시에만 설정합니다
		http.csrf().disable();

		http.authorizeRequests() //
				.antMatchers("/admin").hasAuthority("ADMIN") // admin/** 경로는 권한 1(=ADMIN) 회원만 접속 가능
				.antMatchers("/admin/**").hasAuthority("ADMIN") //
				.antMatchers("/seller").hasAnyAuthority("ADMIN", "SELLER") // seller/** 경로는 권한 2(=seller) 회원만 접속 가능
				.antMatchers("/seller/**").hasAnyAuthority("ADMIN", "SELLER") //
				.antMatchers("/member").hasAnyAuthority("ADMIN", "MEMBER") // member/** 경로는 권한 3(=member) 회원만 접속 가능
				.antMatchers("/member/**").hasAnyAuthority("ADMIN", "MEMBER") //
				.antMatchers("/").permitAll()//
				.antMatchers("/**").permitAll() //
				.and().formLogin() //
				.loginPage("/login").permitAll() //
				.usernameParameter("mbr_id") // 로그인시 username을 mbr_id로 받아옴
				.passwordParameter("mbr_pw") // 로그인시 password를 mbr_pw 받아옴
				// .authenticationDetailsSource(authenticationDetailsSource) // 추가 파라메터 설정작업시, 설정해주기
				.defaultSuccessUrl("/").successHandler(customSuccessHandler) // 성공시 수행할 핸들러 로그인 전 페이지 반환
				.failureHandler(customFailureHandler) // 실패 핸들러 login page에 오류 메세지 반환
				.and()// oauth2userservice 타입으로 받아ㄴ오기
				.logout().logoutUrl("/logoutsuccess") // 로그아웃 처리
				.logoutSuccessUrl("/main") // 로그아웃 성공 시 이동 페이지
				.invalidateHttpSession(true) // 로그아웃 시 세션 제거
				.deleteCookies("remember-me") // 자동 로그인 쿠키, Tomcat이 발급한 세션 유지 쿠키 삭제
				.and().exceptionHandling() // 권한 없을 경우 접근거부
				.accessDeniedPage("/denied") //
				.and().oauth2Login().loginPage("/login") // 소셜로그인 처리
				.userInfoEndpoint() //
				.userService(principalOauth2UserService);

		http.rememberMe() // 자동로그인
				.userDetailsService(memberDetailsService).tokenValiditySeconds(2592000) // 3일
		;
		// .key("Branches") // 쿠키에 사용되는 값을 암호화하기 위한 키(key)값
		// .rememberMeParameter("remember-Me") //
		// .rememberMeCookieName("Branches_cookie") //
		// .userDetailsService(memberDetailsService) //
		// .tokenValiditySeconds(2592000); // 3일

		// CK에디터 이미지 업로드 X-Frame-Option iframe랜더링 설정
		// https://goateedev.tistory.com/87 자세한건 이곳 참고하세요!
		http.headers().frameOptions().disable()
				.addHeaderWriter(new StaticHeadersWriter("X-FRAME-OPTIONS", "ALLOW-FROM " + "http://localhost:9595/seller/mypage/prdct")).and();

	}

	@Override // ignore except jsp
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/api/**", "/resources/**");
	}

	// 패스워드 인코더
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
