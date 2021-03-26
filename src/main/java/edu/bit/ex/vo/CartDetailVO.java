package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CART_ID	VARCHAR2(20 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
CART_COLOR	VARCHAR2(20 BYTE)
CART_SIZE	VARCHAR2(10 BYTE)
CART_AMOUNT	NUMBER
PRDCT_PRICE	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class CartDetailVO { // 장바구니상세정보
	private String cart_id; // 장바구니id
	private String prdct_id; // 상품번호 fk
	private String cart_color; // 장바구니상품색상
	private String cart_size; // 장바구니상품사이즈
	private int cart_amount; // 장바구니상품수
	private int prdct_price; // 상품금액
}
