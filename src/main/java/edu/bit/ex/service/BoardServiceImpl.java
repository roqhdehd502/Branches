package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctImageVO;
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

	// 페이징을 적용한 공지사항 게시판 리스트
	@Override
	public List<BoardVO> getNoticeList(NoticeCriteria cri) {
		log.info("getNoticeList WITH criteria: " + cri);
		return boardMapper.getNoticeListWithPaging(cri);
	}

	// 페이징 단위에 적용되는 최대 공지 게시글 단위
	@Override
	public int getNoticeTotal(NoticeCriteria cri) {
		log.info("getNoticeTotal WITH criteria: " + cri);
		return boardMapper.getNoticeTotalCount(cri);
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

	// 페이징을 적용한 매거진 게시판 리스트
	@Override
	public List<BoardVO> getMagazineList(MagazineCriteria cri) {
		log.info("getMagazineList WITH criteria: " + cri);
		return boardMapper.getMagazineListWithPaging(cri);
	}

	// 페이징 단위에 적용되는 최대 매거진 게시글 단위
	@Override
	public int getMagazineTotal(MagazineCriteria cri) {
		log.info("getMagazineTotal WITH criteria: " + cri);
		return boardMapper.getMagazineTotalCount(cri);
	}

	// 매거진 게시판 썸네일
	@Override
	public PrdctImageVO getMagazineThumbnail(int board_id) {
		log.info("getMagazineThumbnail");
		return boardMapper.getMagazineThumbnail(board_id);
	}

	// 매거진 게시글
	@Override
	public BoardVO getMagazineContent(int board_id) {
		log.info("getMagazineContent");
		boardMapper.upMagazineHit(board_id); // 매거진 게시글 조회
		return boardMapper.getMagazineContent(board_id);
	}

	// 매거진 게시글 이미지 리스트
	@Override
	public List<PrdctImageVO> getMagazineImage(int board_id) {
		log.info("getMagazineImage");
		return boardMapper.getMagazineImage(board_id);
	}

	// 매거진 게시글 추천
	@Override
	public int magazineUpLike(int board_id) {
		log.info("magazineUpHit");
		return boardMapper.magazineUpLike(board_id);
	}

	// 매거진 게시글 댓글 리스트
	@Override
	public List<BoardCommentVO> getMagazineComment(String mbr_id, int board_id) {
		log.info("getMagazineComment");
		return boardMapper.getMagazineComment(mbr_id, board_id);
	}

	// 매거진 게시글 댓글 작성
	@Override
	public void setMagazineCommentWrite(BoardCommentVO boardCommentVO) {
		log.info("setMagazineCommentWrite");
		boardMapper.setMagazineCommentWrite(boardCommentVO);
	}
}