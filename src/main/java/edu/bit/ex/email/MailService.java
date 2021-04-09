package edu.bit.ex.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	private JavaMailSender javaMailSender;

	public MailService(JavaMailSender javaMailSender) throws MessagingException {

		this.javaMailSender = javaMailSender;

	}

	// 메일 발송 메소드
	public void send(String toEmail) throws MessagingException {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

		helper.setFrom("p_yo_218@naver.com");
		helper.setTo(toEmail);
		helper.setSubject("Branches 임시 비밀번호 발급");
		helper.setText("임시 비밀번호는 00000000입니다\n 빠른 비밀번호 변경을 권장합니다");

		javaMailSender.send(mimeMessage);
	}

}
