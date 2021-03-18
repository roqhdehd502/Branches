package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*PRDCT_ID	VARCHAR2(20 BYTE)
PRDCT_COLOR	VARCHAR2(20 BYTE)
PRDCT_SIZE	VARCHAR2(10 BYTE)
PRDCT_STOCK	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctDetailVO { // 상품상세정보
	private String prdct_id; // 상품id
	private String prdct_color; // 상품색상
	private String prdct_size; // 상품사이즈
	private int prdct_stock; // 상품재고량
}
