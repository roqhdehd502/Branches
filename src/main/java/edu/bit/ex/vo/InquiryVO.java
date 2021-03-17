package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*INQUIRY_NUMBER	NUMBER
INQUIRY_NAME	VARCHAR2(20 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class InquiryVO { // Q&A문의유형
	private int inquiry_number; // 문의유형번호 pk
	private String inquiry_name; // 문의유형명
}
