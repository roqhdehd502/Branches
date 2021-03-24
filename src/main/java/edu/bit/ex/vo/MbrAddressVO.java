package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MbrAddressVO {
	private String mbr_id; // 회원id pk,fk
	private String mbr_pw; // 회원pw
	private String mbr_name; // 회원이름
	private int authority_number; // 권한번호 fk
	private String mbr_gender; // 회원성별
	private Date mbr_birth; // 회원생년월일
	private String mbr_email; // 회원이메일
	private int login_number; // 회원타입번호 fk
	private String contact_number; // 회원연락처
	private String mbr_nickname; // 회원닉네임
	private int mbr_point; // 회원포인트
	private Date jdate; // 회원가입일
	private int grade_number; // 회원등급번호 fk
	private String shipping_address; // 배송지
}
