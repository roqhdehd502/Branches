package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*MBR_ID	VARCHAR2(15 BYTE)
SHIPPING_ADDRESS	VARCHAR2(200 BYTE)*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ShippingVO { // 배송
	private String mbr_id; // 회원id fk
	private String shipping_address; // 배송지
}
