package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.page.Criteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
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

	// 페이징을 적용한 게시글 리스트
	@Override
	public List<BoardVO> getNoticeList(Criteria cri) {
		log.info("getNoticeList WITH criteria: " + cri);
		return boardMapper.getNoticeListWithPaging(cri);
	}

	// 페이징 단위에 적용되는 최대 게시글 단위
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal WITH criteria: " + cri);
		return boardMapper.getTotalCount(cri);
	}

	// 공지사항 작성 id 가져오기
	@Override
	public MbrVO getNoticeMember(String mbr_id) {
		log.info("getNoticeMember");
		return boardMapper.getNoticeMember(mbr_id);
	}

	// 공지사항 작성
	@Override
	public void setNoticeWrite(BoardVO boardVO) {
		log.info("setNoticeWrite");
		boardMapper.setNoticeWrite(boardVO);
	}

	// 공지사항 게시글
	// @Transactional
	@Override
	public BoardVO getNoticeContent(int board_id) {
		// boardMapper.upNoticeHit(board_id);
		log.info("getNoticeContent");
		return boardMapper.getNoticeContent(board_id);
	}

	// 공지사항 삭제
	@Override
	public int noticeRemove(int board_id) {
		log.info("noticeRemove");
		return boardMapper.noticeRemove(board_id);
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

	// 매거진 게시글
	@Override
	public BoardVO getMagazineContent(int board_id) {
		// boardMapper.upMagazineHit(board_id);
		log.info("getMagazineContent");
		return boardMapper.getMagazineContent(board_id);
	}
}