package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CATEGORY_NUMBER	NUMBER
CATEGORY_NAME	VARCHAR2(50 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class CategoryVO { // 상품카테고리
	private int category_number; // 상품카테고리번호 pk
	private String category_name; // 상품카테고리명
}
