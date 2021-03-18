package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*ORDER_NUMBER	NUMBER
PRDCT_ID	VARCHAR2(20 BYTE)
ORDER_COLOR	VARCHAR2(20 BYTE)
ORDER_SIZE	VARCHAR2(10 BYTE)
ORDER_AMOUNT	NUMBER
PRDCT_PRICE	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class OrderDetailVO { // 주문상세정보
	private int order_number; // 주문번호 fk
	private String prdct_id; // 상품id fk
	private String order_color; // 주문상품색상
	private String order_size; // 주문상품사이즈
	private int order_amount; // 주문상품량
	private int prdct_price; // 상품금액
}
