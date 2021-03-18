package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*BOARD_TYPE_NUMBER	NUMBER
BOARD_TYPE_NAME	VARCHAR2(50 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardTypeVO { // 게시판유형
	private int board_type_number; // 게시판유형번호 pk
	private String board_type_name; // 게시판유형명
}
