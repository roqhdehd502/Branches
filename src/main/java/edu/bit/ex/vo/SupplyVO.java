package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
PRDCT_ID	VARCHAR2(20 BYTE)
SUPPLY_DATE	DATE
SUPPLY_AMOUNT	NUMBER
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class SupplyVO { // 상품공급
	private String prdct_id; // 상품id fk
	private Date supply_date; // 상품공급일자
	private int supply_amount; // 상품공급량
}