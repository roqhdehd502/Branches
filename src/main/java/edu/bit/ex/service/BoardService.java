package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.BoardVO;

public interface BoardService {
	// 공지사항 게시판 리스트
	public List<BoardVO> getNoticeList();
}
