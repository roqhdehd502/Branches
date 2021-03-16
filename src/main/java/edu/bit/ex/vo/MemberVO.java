package edu.bit.ex.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberVO {
	private String board_id;

	public MemberVO() {
		super();
	}

	public MemberVO(String board_id) {
		this.board_id = board_id;
	}

}