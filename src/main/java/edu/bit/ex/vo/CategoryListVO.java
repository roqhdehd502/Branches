package edu.bit.ex.vo;

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
public class CategoryListVO {
	private String prdct_id; // 상품id pk
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호 fk
	private String mbr_id; // 회원id fk
}
