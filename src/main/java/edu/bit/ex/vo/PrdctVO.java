package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_NAME	VARCHAR2(64 BYTE)
PRDCT_PRICE	NUMBER
CATEGORY_NUMBER	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctVO { // 상품
	private String prdct_id; // 상품id pk
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호 fk
}
