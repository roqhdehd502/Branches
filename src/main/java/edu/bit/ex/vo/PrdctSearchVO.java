package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
SEARCH_NUMBER	NUMBER
SEARCH_NAME	VARCHAR2(64 BYTE)
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctSearchVO { // 통합 상품 검색(헤더)
	private int search_number; // 상품 검색 기록 시퀀스 번호 (PK)
	private String search_name; // 상품 검색 기록 이름
	private String mbr_id; // 회원 ID (FK)
	private String prdct_id; // 상품 ID (FK)
}