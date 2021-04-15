package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
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
public class PrdctLikeVO { // 상품 찜하기
	private int prdct_like_number; // 찜하기 일련번호
	private String mbr_id; // 회원 id(FK)
	private String prdct_id; // 상품 id(FK)
	private int board_id; // 게시판 id(FK)

	private PrdctVO prdctVO; // 상품VO (Only VO)
	private BoardVO boardVO; // 게시판VO (Only VO)
}