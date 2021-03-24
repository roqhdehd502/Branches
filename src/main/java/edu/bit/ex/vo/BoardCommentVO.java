package edu.bit.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*COMMENT_ID	NUMBER
BOARD_ID	NUMBER
MBR_ID	VARCHAR2(15 BYTE)
COMMENT_CONTENT	VARCHAR2(600 BYTE)
COMMENT_DATE	DATE*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardCommentVO { // 게시판댓글
	private int comment_id; // 댓글번호 pk
	private int board_id; // 게시글번호 fk
	private String mbr_id; // 회원id fk
	private String comment_content; // 댓글내용
	private Date comment_date; // 댓글작성일자
}