package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CART_ID	VARCHAR2(20 BYTE)
CART_PRICE	NUMBER
CART_DATE	DATE
MBR_ID	VARCHAR2(15 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class CartVO { // 장바구니
	private String cart_id; // 장바구니id pk
	private int cart_price; // 장바구니상품금액
	private Date cart_date; // 장바구니일자
	private String mbr_id; // 회원id fk
}
