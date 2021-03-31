package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctImageVO;

@Mapper
public interface BoardMapper {
	// 페이징을 적용한 공지사항 게시판 리스트
	public List<BoardVO> getNoticeListWithPaging(NoticeCriteria cri);

	// 페이징 단위에 적용되는 최대 공지 게시글 단위
	public int getNoticeTotalCount(NoticeCriteria cri);

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
	public List<BoardPrdctImageVO> getMagazineList();

	public List<BoardPrdctImageVO> getMagazineListWithPaging(MagazineCriteria cri);

	// 페이징 단위에 적용되는 최대 매거진 게시글 단위
	public int getMagazineTotalCount(MagazineCriteria cri);

	// 매거진 작성 id 가져오기
	public MbrVO getMagazineMember(String mbr_id);

	// 매거진 작성
	public void setMagazineWrite(BoardPrdctImageVO bPrdctImageVO);

	// 매거진 첨부사진 작성
	public void setMagazineImage(String saveName);

	// 매거진 게시글
	public BoardVO getMagazineContent(int board_id);

	// 매거진 게시글 조회
	public void upMagazineHit(int board_id);

	// 매거진 게시글 이미지 리스트
	public List<PrdctImageVO> getMagazineImage(int board_id);

	// 매거진 게시글 추천
	public int magazineUpLike(int board_id);

	// 매거진 게시글 댓글 수
	public BoardCommentVO getMagazineCommentCnt(String mbr_id, int board_id);

	// 페이징을 적용한 매거진 게시글 댓글 리스트
	public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id);
	/* public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id, MagazineCommentCriteria cri); */

	// 페이징 단위에 적용되는 최대 매거진 게시글 댓글 단위
	public int getMagazineCommentTotalCount(MagazineCommentCriteria cri);

	// 매거진 게시글 댓글 작성
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO);

	// 매거진 게시글 댓글 삭제
	public int magazineCommentRemove(int comment_id);

	// 매거진 수정
	public void setMagazineModify(BoardVO boardVO);

}