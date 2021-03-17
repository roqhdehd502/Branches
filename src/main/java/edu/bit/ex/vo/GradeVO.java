package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*GRADE_NUMBER	NUMBER
GRADE_NAME	VARCHAR2(20 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class GradeVO { // 회원등급
	private int grade_number; // 회원등급번호 pk
	private String grade_name; // 회원등급명
}
