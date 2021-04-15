package edu.bit.ex.config.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component // 꼭 달아주기
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {

		String msg = "Invaild Username or Password";

		if (exception instanceof BadCredentialsException) {

		} else if (exception instanceof InsufficientAuthenticationException) {
			msg = "Invalid Secret Key";
		}

		setDefaultFailureUrl("/login?error=true&exception=" + msg);

		super.onAuthenticationFailure(request, response, exception);
	}

}
