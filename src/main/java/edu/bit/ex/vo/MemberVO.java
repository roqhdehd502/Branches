package edu.bit.ex.vo;

import lombok.ToString;

@ToString
public class MemberVO {
	private String board_id;

	public MemberVO() {
		super();
	}

	public MemberVO(String board_id) {
		super();
		this.board_id = board_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
}