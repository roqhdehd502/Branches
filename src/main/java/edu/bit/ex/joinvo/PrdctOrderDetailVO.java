package edu.bit.ex.joinvo;

import java.sql.Date;

import edu.bit.ex.vo.OrderDetailVO;
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
public class PrdctOrderDetailVO { // 결제 후 정보 저장
	private String order_number; // 상품주문번호
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String mbr_id; // 회원id fk
	private String prdct_id; // 상품id fk
	private String order_color; // 주문상품색상
	private String order_size; // 주문상품사이즈
	private int order_amount; // 주문상품량
	private int prdct_price; // 상품금액
	private String prdct_name; // 상품이름 추가
	private String shipping_name; // 받는사람
	private int shipping_tel; // 받는사람 연락처
	private String order_mail; // 주문자 이메일
	private String shipping_address; // 배송지
	private int usepoint; // 사용 포인트
	private int earningpoint; // 적립 포인트
	private String receipt_id; // 영수증id
	private String t_key; // 택배키
	private String t_invoice; // 택배 운송장번호
	private int order_state_number; // 상태 확인번호 fk

	private OrderDetailVO[] orderDetailVO;

}
