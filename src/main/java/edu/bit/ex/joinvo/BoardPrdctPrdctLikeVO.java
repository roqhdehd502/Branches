package edu.bit.ex.joinvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
======= board =======
BOARD_ID	NUMBER
BOARD_NAME	VARCHAR2(100 BYTE)
BOARD_CONTENT	VARCHAR2(3000 BYTE)
MBR_ID	VARCHAR2(50 BYTE)
BOARD_TYPE_NUMBER	NUMBER
INQUIRY_NUMBER	NUMBER
BOARD_DATE	DATE
PRDCT_ID	VARCHAR2(20 BYTE)
ORDER_NUMBER	NUMBER
BOARD_LIKE	NUMBER
BOARD_HIT	NUMBER
BOARD_STARRATE	NUMBER
BOARD_THUMBNAIL	VARCHAR2(1000 BYTE)

======= prdct =======
PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_NAME	VARCHAR2(64 BYTE)
PRDCT_PRICE	NUMBER
CATEGORY_NUMBER	NUMBER
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_COLOR	VARCHAR2(150 BYTE)
PRDCT_SIZE	VARCHAR2(150 BYTE)
PRDCT_STOCK	NUMBER

======= prdct_like =======
PRDCT_LIKE_NUMBER	NUMBER
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
BOARD_ID	NUMBER
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardPrdctPrdctLikeVO { // 게시글과 상품 찜하기가 조인된 VO
	private String board_name; // 게시글제목
	private String board_content; // 게시글내용
	private int board_type_number; // 게시판유형번호
	private int inquiry_number; // 문의유형번호
	private Date board_date; // 게시글작성일자
	private int order_number; // 주문번호
	private int board_like; // 게시글추천수
	private int board_hit; // 게시글조회수
	private int board_starrate; // 게시글별점수
	private String board_thumbnail; // 게시글썸네일

	private String mbr_id; // 회원 id
	private String prdct_id; // 상품 id
	private int board_id; // 게시판 id

	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호 fk
	private String category_name; // 상품카테고리명
	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량
	private String prdct_thumbnail; // 사진썸네일

	private int prdct_like_number; // 찜하기 일련번호
}