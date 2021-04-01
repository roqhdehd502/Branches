package edu.bit.ex.joinvo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
=========PrdctVO ============
PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_NAME	VARCHAR2(64 BYTE)
PRDCT_PRICE	NUMBER
CATEGORY_NUMBER	NUMBER
MBR_ID	VARCHAR2(15 BYTE)*/

/*
==========PrdctDetail========
PRDCT_COLOR	VARCHAR2(20 BYTE)
PRDCT_SIZE	VARCHAR2(10 BYTE)
PRDCT_STOCK	NUMBER*/

/*
======= board =======
BOARD_ID	NUMBER
BOARD_NAME	VARCHAR2(100 BYTE)
BOARD_CONTENT	VARCHAR2(2000 BYTE)
BOARD_TYPE_NUMBER	NUMBER
BOARD_DATE	DATE
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
public class PrdctRegisterImageVO { // 게시판 이미지 VO
	private String prdct_id; // 상품id pk
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호 fk
	private String mbr_id; // 회원id fk
	private String category_name; // 상품카테고리명

	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량

	private int board_id; // 게시글번호 부모pk, 자식fk
	private String board_name; // 게시글제목
	private String board_content; // 게시글내용
	private int board_type_number; // 게시판유형번호 fk
	private Date board_date; // 게시글작성일자
	private int board_like; // 게시글추천수
	private int board_hit; // 게시글조회수

	private int image_number; // 상품이미지번호
	private String image_name; // 상품이미지명
	private String image_path; // 상품이미지경로

	private MultipartFile[] uploadfiles; // 게시판이미지업로드
}