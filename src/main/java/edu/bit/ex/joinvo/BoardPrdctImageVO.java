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
BOARD_CONTENT	VARCHAR2(2000 BYTE)
MBR_ID	VARCHAR2(15 BYTE)
BOARD_TYPE_NUMBER	NUMBER
INQUIRY_NUMBER	NUMBER
BOARD_DATE	DATE
PRDCT_ID	VARCHAR2(20 BYTE)
ORDER_NUMBER	NUMBER
BOARD_LIKE	NUMBER
BOARD_HIT	NUMBER

======= prdct_image =======
IMAGE_NUMBER	NUMBER
IMAGE_NAME	VARCHAR2(1000 BYTE)
IMAGE_PATH	VARCHAR2(2000 BYTE)
BOARD_ID	NUMBER
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardPrdctImageVO {
	private String board_name; // 게시글제목
	private String board_content; // 게시글내용
	private String mbr_id; // 회원id
	private int board_type_number; // 게시판유형번호
	private int inquiry_number; // 문의유형번호
	private Date board_date; // 게시글작성일자
	private String prdct_id; // 상품id
	private int order_number; // 주문번호
	private int board_like; // 게시글추천수
	private int board_hit; // 게시글조회수

	private int board_id; // 게시글번호 부모pk, 자식fk

	private int image_number; // 상품이미지번호 자식pk
	private String image_name; // 상품이미지명
	private String image_path; // 상품이미지경로
}