package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
ORDER_NUMBER	NUMBER
ORDER_PRICE	NUMBER
ORDER_DATE	DATE
MBR_ID	VARCHAR2(50 BYTE)
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class OrderStateVO { // 주문 상태
	private int order_state_number; // 주문 상태 번호
	private String order_state_name; // 주문 상태
}
