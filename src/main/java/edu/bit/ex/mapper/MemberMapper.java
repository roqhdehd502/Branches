package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctPrdctLikeVO;
import edu.bit.ex.joinvo.InquiryBoardVO;
import edu.bit.ex.page.MyqnaCriteria;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;

@Mapper
public interface MemberMapper {
	// 상품 Q&A 등록 페이지
	public MbrVO getPrdctQnaInfo(String mbr_id);

	// 상품 QnA 등록 작성
	public void prdctQnaWrite(BoardVO boardVO);

	// 상품 QnA 마이페이지 리스트
	/* public List<BoardVO> prdctqMyList(String mbr_id); */
	public List<BoardVO> getPrdctqMyListWithPaging(PrdQnACriteria cri, String mbr_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	public int getPrdctqTotalCount(PrdQnACriteria cri);

	// 작성한 상품 Q&A 응답여부 받아오기
	public BoardBoardCommentVO getPrdctqCmntStat(int board_id);

	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	// member info update
	public void memberInfoUpdate(MbrVO mbrvo); // admin customer

	// 리뷰 등록 페이지
	public MbrVO getCustomerInfo(String mbr_id);

	// 리뷰 등록 작성
	public void rivewWrite(BoardVO boardVO);

	// 리뷰 마이페이지 리스트
	public List<PrdctOrderVO> reviewMyList(String member_id);

	// 작성한 고객 Q&A 리스트 받아오기
	// public List<BoardVO> getMyqList(String mbr_id);
	public List<BoardVO> getMyqListWithPaging(MyqnaCriteria cri, String mbr_id);

	// 페이징 단위에 적용되는 최대 고객 Q&A 게시글 단위
	public int getMyqnaTotalCount(MyqnaCriteria cri);

	// 작성한 고객 Q&A 응답여부 받아오기
	public BoardBoardCommentVO getMyqCmntStat(int board_id);

	// 고객 Q&A 작성페이지 문의 유형 받아오기
	public List<InquiryVO> getMyqInquiry();

	// 고객 QnA 작성
	public void setmyqnaWriting(BoardVO boardVO);

	// 고객 QnA 상세페이지
	public InquiryBoardVO getMyqContent(int board_id);

	// 고객 QnA 상세페이지 관리자가 작성한 댓글 리스트 받아오기
	public List<BoardCommentVO> getMyqComment(int board_id);

	// 고객 QnA 수정
	public void setmyqnaModify(BoardVO boardVO);

	// 고객 QnA 삭제
	public int myqnaRemove(int board_id);

	// 찜했던 상품 리스트 받아오기
	public List<BoardPrdctPrdctLikeVO> getLikePrdctList(String mbr_id);
}