package edu.bit.ex.joinvo;

import java.sql.Date;

import edu.bit.ex.vo.MbrVO;
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
BOARD_LIKE	NUMBER
BOARD_HIT	NUMBER
BOARD_STARRATE	NUMBER
BOARD_THUMBNAIL	VARCHAR2(1000 BYTE)

======= prdct_order =======
ORDER_NUMBER	VARCHAR2(50 BYTE)
ORDER_PRICE	NUMBER
ORDER_DATE	DATE

======= order_detail =======
ORDER_COLOR	VARCHAR2(20 BYTE)
ORDER_SIZE	VARCHAR2(10 BYTE)
ORDER_AMOUNT	NUMBER
PRDCT_NAME	VARCHAR2(300 BYTE)
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctOrderDetailBoardVO {
	private String board_name; // 게시글제목
	private String board_content; // 게시글내용
	private int board_type_number; // 게시판유형번호
	private int inquiry_number; // 문의유형번호
	private Date board_date; // 게시글작성일자
	private String prdct_id; // 상품id
	private int board_like; // 게시글추천수
	private int board_hit; // 게시글조회수
	private int board_starrate; // 게시글별점수
	private String board_thumbnail; // 게시글썸네일

	private int board_id; // 게시글번호 부모pk, 자식fk
	private String mbr_id; // 회원id 공동 fk

	private String order_number; // 주문번호 fk
	private String order_color; // 주문상품색상
	private String order_size; // 주문상품사이즈
	private int order_amount; // 주문상품량
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자
	private String prdct_name; // 상품명

	private MbrVO mbrVO; // 회원 VO
	private String mbr_nickname; // 회원닉네임
}