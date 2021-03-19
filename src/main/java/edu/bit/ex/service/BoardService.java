package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.BoardVO;

public interface BoardService {
	// 공지사항 게시판 리스트
	public List<BoardVO> getNoticeList();

	// 공지사항 작성
	public void setNoticeWrite(BoardVO boardVO);

	// 공지사항 게시글
	public BoardVO getNoticeContent(int board_id);

	// 공지사항 수정
	public void setNoticeModify(BoardVO boardVO);

	// 매거진 게시판 리스트
	public List<BoardVO> getMagazineList();

}