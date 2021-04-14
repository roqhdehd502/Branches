package edu.bit.ex.joinvo;

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
public class PrdctOrderDetailVO { // 상품주문
	private int order_number; // 상품주문번호 pk
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String mbr_id; // 회원id fk
	private String prdct_id; // 상품id fk
	private String order_color; // 주문상품색상
	private String order_size; // 주문상품사이즈
	private int order_amount; // 주문상품량
	private int prdct_price; // 상품금액
	private String prdct_name; // 상품이름 추가

}
