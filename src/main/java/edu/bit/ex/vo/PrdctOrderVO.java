package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*ORDER_NUMBER	NUMBER
ORDER_PRICE	NUMBER
ORDER_DATE	DATE
MBR_ID	VARCHAR2(15 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctOrderVO { // 상품주문
	private int order_number; // 상품주문번호 pk
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String mbr_id; // 회원id fk

	private OrderDetailVO orderDetailVO;
	private BoardVO boardVO;
}
