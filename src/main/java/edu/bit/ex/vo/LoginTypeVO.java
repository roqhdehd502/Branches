package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*LOGIN_NUMBER	NUMBER
LOGIN_KIND	VARCHAR2(20 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class LoginTypeVO { // 로그인유형
	private int login_number; // 로그인유형번호 pk
	private String login_kind; // 로그인유형명
}
