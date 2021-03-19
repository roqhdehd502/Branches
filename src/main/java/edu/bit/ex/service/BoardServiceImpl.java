package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.vo.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;

	// 공지사항 게시판 리스트
	@Override
	public List<BoardVO> getNoticeList() {
		log.info("getNoticeList");
		return boardMapper.getNoticeList();
	}

	// 공지사항 작성
	@Override
	public void setNoticeWrite(BoardVO boardVO) {
		log.info("setNoticeWrite");
		boardMapper.setNoticeWrite(boardVO);
	}

	// 공지사항 게시글
	@Transactional
	@Override
	public BoardVO getNoticeContent(int board_id) {
		// boardMapper.upNoticeHit(board_id);
		log.info("getNoticeContent");
		return boardMapper.getNoticeContent(board_id);
	}

	// 공지사항 수정
	@Override
	public void setNoticeModify(BoardVO boardVO) {
		log.info("setNoticeModify");
		boardMapper.setNoticeModify(boardVO);
	}

	// 매거진 게시판 리스트
	@Override
	public List<BoardVO> getMagazineList() {
		log.info("getMagazineList");
		return boardMapper.getMagazineList();
	}

}