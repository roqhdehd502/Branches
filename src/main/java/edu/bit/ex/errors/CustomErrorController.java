package edu.bit.ex.errors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class CustomErrorController implements ErrorController {

	@GetMapping("/error")
	public ModelAndView handleError(HttpServletRequest request, ModelAndView mav) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());

			// 404 에러
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				log.info("404 ERROR!");
				mav.setViewName("errors/404");
			}
			// 500 에러(프로젝트 완료시 주석 해제)
			// if (statusCode == HttpStatus.FORBIDDEN.value()) {
			// log.info("500 ERROR!");
			// mav.setViewName("errors/500");
			// }

		}
		return mav;
	}

	@Override
	public String getErrorPath() {
		return null;
	}
}