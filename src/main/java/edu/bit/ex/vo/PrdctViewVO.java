package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
MBR_ID	VARCHAR2(50 BYTE)
PRDCT_ID	VARCHAR2(20 BYTE)
VIEW_DATE	DATE
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctViewVO { // 상품조회
	private String mbr_id; // 회원 ID(FK)
	private String prdct_id; // 상품 ID(FK)
	private Date view_date; // 상품 조회 날짜
}