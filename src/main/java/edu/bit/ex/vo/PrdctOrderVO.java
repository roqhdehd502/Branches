package edu.bit.ex.vo;

import java.sql.Date;
import java.util.List;

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
public class PrdctOrderVO { // 상품주문
	private int order_number; // 상품주문번호 pk
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String mbr_id; // 회원id fk
	private String shipping_name; // 받는사람
	private int shipping_tel; // 받는사람 연락처
	private String order_mail; // 주문자 이메일
	private String shipping_address; // 배송지
	private int usepoint; // 사용 포인트
	private int earningpoint; // 적립 포인트
	private String receipt_id; // 영수증id
	private String t_key; // 택배키
	private String t_invoice; // 택배 운송장번호

	public OrderDetailVO orderDetailVO;
	public List<OrderDetailVO> listOrderDetailVO;
	private BoardVO boardVO;
}
