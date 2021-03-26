package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
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

	// 페이징을 적용한 매거진 게시판 리스트
	@Override
	public List<BoardPrdctImageVO> getMagazineList(MagazineCriteria cri) {
		log.info("getMagazineList WITH criteria: " + cri);
		return boardMapper.getMagazineListWithPaging(cri);
	}

	// 페이징 단위에 적용되는 최대 매거진 게시글 단위
	@Override
	public int getMagazineTotal(MagazineCriteria cri) {
		log.info("getMagazineTotal WITH criteria: " + cri);
		return boardMapper.getMagazineTotalCount(cri);
	}

	// 매거진 작성 id 가져오기
	@Override
	public MbrVO getMagazineMember(String mbr_id) {
		log.info("getMagazineMember");
		return boardMapper.getMagazineMember(mbr_id);
	}

	// 매거진 작성
	@Override
	public void setMagazineWrite(BoardVO boardVO) {
		log.info("setMagazineWrite");
		boardMapper.setMagazineWrite(boardVO);
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
	public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id) {
		log.info("getMagazineComment");
		return boardMapper.getMagazineComment(mbr_id, board_id);
	}

	// 매거진 게시글 댓글 작성
	@Override
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO) {
		log.info("setMagazineCommentWrite");
		boardMapper.setMagazineCommentWrite(boardBoardCommentVO);
	}

	// 매거진 수정
	@Override
	public void setMagazineModify(BoardVO boardVO) {
		log.info("setMagazineModify");
		boardMapper.setMagazineModify(boardVO);
	}

}