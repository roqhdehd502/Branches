package edu.bit.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*IMAGE_NUMBER	NUMBER
IMAGE_NAME	VARCHAR2(1000 BYTE)
IMAGE_PATH	VARCHAR2(2000 BYTE)
BOARD_ID	NUMBER*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctImageVO { // 상품이미지
	private int image_number; // 상품이미지번호 pk
	private String image_name; // 상품이미지명
	private String image_path; // 상품이미지경로
	private int board_id; // 게시글번호 fk
}
