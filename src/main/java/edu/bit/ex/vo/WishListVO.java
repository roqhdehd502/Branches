package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*MBR_ID	VARCHAR2(15 BYTE)
BOARD_ID	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class WishListVO { // 상품찜기능
	private String mbr_id; // 회원id fk
	private int board_id; // 게시글번호 fk
}
