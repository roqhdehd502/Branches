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

======= prdct_view =======
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
VIEW_DATE	DATE
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctPrdctViewVO {
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호
	private String category_name; // 상품카테고리명
	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량
	private String prdct_thumbnail; // 게시글썸네일
	private int prv; // 비공개여부 =private default 0

	private String prdct_id; // 상품 ID
	private String brand_id; // 회원 ID (브랜드ID)
	private String mbr_id; // 회원 ID

	private Date view_date; // 상품 조회 날짜
}