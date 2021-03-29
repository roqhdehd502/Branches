package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;

public interface CustomerService {
	// 매거진 게시글 댓글 작성
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO);

	// 매거진 게시글 댓글 삭제
	public int magazineCommentRemove(int comment_id);

	// 페이징을 적용한 상품 Q&A 게시판 리스트 customer
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위 customer
	public int getPrdQnATotal(PrdQnACriteria cri);

	// 회원브랜드 조회(member), 관리자 회원정보 조회(admin)
	public List<MbrVO> getMemberList(SearchCriteria cri);
}