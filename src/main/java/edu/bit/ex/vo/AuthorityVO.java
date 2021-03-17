package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*AUTHORITY_NUMBER	NUMBER
AUTHORITY_NAME	VARCHAR2(20 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class AuthorityVO { // 권한
	private int authority_number; // 권한번호 pk
	private String authority_name; // 권한명
}