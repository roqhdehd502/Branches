package edu.bit.ex.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_NAME	VARCHAR2(64 BYTE)
PRDCT_PRICE	NUMBER
CATEGORY_NUMBER	NUMBER
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_COLOR	VARCHAR2(150 BYTE)
PRDCT_SIZE	VARCHAR2(150 BYTE)
PRDCT_STOCK	NUMBER
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctVO { // 상품
	private String prdct_id; // 상품id pk
	private String prdct_name; // 상품명
	private int prdct_price; // 상품가격
	private int category_number; // 상품카테고리번호 fk
	private String category_name; // 상품카테고리명
	private String mbr_id; // 회원id 브랜드id fk
	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량
	private String prdct_thumbnail; // 게시글썸네일
	private int prv; // 비공개여부 =private default 0
	private MultipartFile[] uploadfiles; // 파일 업로드

}
