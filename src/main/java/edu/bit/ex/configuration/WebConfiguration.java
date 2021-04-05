package edu.bit.ex.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // Configuration 어노테이션 추가
public class WebConfiguration implements WebMvcConfigurer { // WebMvcConfigurer 인터페이스 구현(implements)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("resources/**") // 핸들러 추가
				.addResourceLocations("classpath:/static/") // 클래스패스 설정시 끝에 꼭 / 넣어주자.
				.setCachePeriod(20); // 초단위
	}

}