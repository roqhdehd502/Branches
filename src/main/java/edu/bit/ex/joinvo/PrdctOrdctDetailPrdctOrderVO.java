package edu.bit.ex.joinvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
======= prdct =======
PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_NAME	VARCHAR2(64 BYTE)
PRDCT_PRICE	NUMBER
CATEGORY_NUMBER	NUMBER
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_COLOR	VARCHAR2(150 BYTE)
PRDCT_SIZE	VARCHAR2(150 BYTE)
PRDCT_STOCK	NUMBER
PRDCT_THUMBNAIL	VARCHAR2(1000 BYTE)
PRV	NUMBER

======= order_detail =======
ORDER_NUMBER	VARCHAR2(50 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
ORDER_COLOR	VARCHAR2(20 BYTE)
ORDER_SIZE	VARCHAR2(10 BYTE)
ORDER_AMOUNT	NUMBER
PRDCT_PRICE	NUMBER
PRDCT_NAME	VARCHAR2(300 BYTE)

======= prdct_order =======
ORDER_NUMBER	VARCHAR2(50 BYTE)
ORDER_PRICE	NUMBER
ORDER_DATE	DATE
MBR_ID	VARCHAR2(50 BYTE)
ORDER_STATE_NUMBER	NUMBER
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctOrdctDetailPrdctOrderVO { // 주문내역 조회 VO
	private String prdct_id; // 상품id
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private String order_number; // 주문번호 fk

	private String brand_id; // 브랜드id(mbr_id)
	private String mbr_id; // 회원id fk

	private int category_number; // 상품카테고리번호
	private String category_name; // 상품카테고리명

	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량
	private String prdct_thumbnail; // 게시글썸네일
	private int prv; // 비공개여부 =private default 0

	private String order_color; // 주문상품색상
	private String order_size; // 주문상품사이즈
	private int order_amount; // 주문상품량
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String shipping_name; // 받는사람
	private int shipping_tel; // 받는사람 연락처
	private String order_mail; // 주문자 이메일
	private String shipping_address; // 배송지
	private int usepoint; // 사용 포인트
	private int earningpoint; // 적립 포인트
	private String receipt_id; // 영수증id
	private String t_key; // 택배키
	private String t_invoice; // 택배 운송장번호
	private int order_state_number; // 주문상태 번호
}