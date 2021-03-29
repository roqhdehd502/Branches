package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardVO;

@Mapper
public interface CustomerMapper {
	// 매거진 게시글 댓글 작성
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO);

	// 매거진 게시글 댓글 삭제
	public int magazineCommentRemove(int comment_id);

	// 페이징을 적용한 상품 Q&A 게시판 리스트 customer
	public List<BoardVO> getPrdQnAListWithPaging(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위 customer
	public int getPrdQnATotalCount(PrdQnACriteria cri);
}