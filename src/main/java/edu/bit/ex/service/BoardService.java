package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctImageVO;

public interface BoardService {
	// 페이징을 적용한 공지사항 게시판 리스트
	public List<BoardVO> getNoticeList(NoticeCriteria cri);

	// 페이징 단위에 적용되는 최대 공지 게시글 단위
	public int getNoticeTotal(NoticeCriteria cri);

	// 공지사항 작성 id 가져오기
	public MbrVO getNoticeMember(String mbr_id);

	// 공지사항 작성
	public void setNoticeWrite(BoardVO boardVO);

	// 공지사항 게시글
	public BoardVO getNoticeContent(int board_id);

	// 공지사항 삭제
	public int noticeRemove(int board_id);

	// 공지사항 수정
	public void setNoticeModify(BoardVO boardVO);

	// 페이징을 적용한 매거진 게시판 리스트
	public List<BoardPrdctImageVO> getMagazineList(MagazineCriteria cri);

	// 페이징 단위에 적용되는 최대 매거진 게시글 단위
	public int getMagazineTotal(MagazineCriteria cri);

	// 매거진 작성 id 가져오기
	public MbrVO getMagazineMember(String mbr_id);

	// 매거진 작성
	public void setMagazineWrite(BoardVO boardVO);

	// 매거진 게시글
	public BoardVO getMagazineContent(int board_id);

	// 매거진 게시글 이미지 리스트
	public List<PrdctImageVO> getMagazineImage(int board_id);

	// 매거진 게시글 추천
	public int magazineUpLike(int board_id);

	// 매거진 게시글 댓글 리스트
	public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id);

	// 매거진 게시글 댓글 작성
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO);

	// 매거진 수정
	public void setMagazineModify(BoardVO boardVO);

}