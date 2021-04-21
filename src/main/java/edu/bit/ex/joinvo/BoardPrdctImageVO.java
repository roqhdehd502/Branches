package edu.bit.ex.joinvo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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

======= prdct_image =======
IMAGE_NUMBER	NUMBER
IMAGE_NAME	VARCHAR2(1000 BYTE)
IMAGE_PATH	VARCHAR2(2000 BYTE)
BOARD_ID	NUMBER
PRDCT_ID	VARCHAR2(20 BYTE)
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardPrdctImageVO { // 게시판 이미지 VO
	private String board_name; // 게시글제목
	private String board_content; // 게시글내용
	private String mbr_id; // 회원id
	private int board_type_number; // 게시판유형번호
	private int inquiry_number; // 문의유형번호
	private Date board_date; // 게시글작성일자
	private String order_number; // 주문번호
	private int board_like; // 게시글추천수
	private int board_hit; // 게시글조회수
	private int board_starrate; // 게시글별점수
	private String prdct_thumbnail; // 게시글썸네일

	private int board_id; // 게시글번호 부모pk, 자식fk
	private String prdct_id; // 상품id fk

	private int image_number; // 상품이미지번호
	private String image_name; // 상품이미지명
	private String image_path; // 상품이미지경로

	private MultipartFile[] uploadfiles; // 게시판이미지업로드
	private String onedeletefiles; // 게시판수정페이지 한 이미지만 삭제
	private String[] deletefiles; // 게시판이미지삭제
}