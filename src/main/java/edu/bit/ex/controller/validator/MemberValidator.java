package edu.bit.ex.controller.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberValidator implements Validator {

	private static final String idPattern = "^[a-z0-9]{5,20}$"; // 영문, 숫자
	private static final String passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{8,16}$";
	private static final String emailPattern = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
	private static final String phonePattern = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$";

	@Override
	public boolean supports(Class<?> clazz) {

		return MbrVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("Validating Member =============");
		MbrVO member = (MbrVO) target;
		String id = member.getMbr_id();
		String name = member.getMbr_name();
		String email = member.getMbr_email();
		String phone_num = member.getContact_number();

		if (!Pattern.matches(idPattern, id)) {
			log.info("ID is not match with pattern");
			log.info("ID : " + id);
			log.info("Pattern : " + idPattern);
			errors.rejectValue("member_id", "member_id", "아이디는 영문, 숫자로 이루어진 5~20자로 입력해주세요.");
		}

		if (!Pattern.matches(emailPattern, email)) {
			log.info("email is not match with pattern");
			errors.rejectValue("email", "email", "이메일을 정확히 입력해주세요.");
		}

		if (!Pattern.matches(phonePattern, phone_num)) {
			log.info("Phone_Num is not match with pattern");
			log.info("phone_num : " + phone_num);
			log.info("patter : " + phonePattern);
			errors.rejectValue("phone_num", "phone_num", "연락처를 정확히 입력해주세요.");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "required");
	}

}
