package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.InquiryBoardVO;
import edu.bit.ex.page.MyqnaCriteria;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;

public interface MemberService {

	// 상품 Q&A 등록 페이지
	public MbrVO getPrdctQnaInfo(String mbr_id);

	// 상품 Q&A 등록 작성
	public void setPrdctQnaWrite(BoardVO boardVO);

	// 페이징을 적용한 상품 Q&A 마이페이지 리스트
	public List<BoardVO> getPrdctqMyList(PrdQnACriteria cri, String mbr_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	public int getPrdctqTotal(PrdQnACriteria cri);

	// 작성한 상품 Q&A 응답여부 받아오기
	public BoardBoardCommentVO getPrdctqCmntStat(int board_id);

	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	// member info update
	public void memberInfoUpdate(MbrVO mbrvo);

	// 리뷰 등록 페이지
	public MbrVO getCustomerInfo(String mbr_id);

	// 리뷰 등록 작성
	public void setReviewWrite(BoardVO boardVO);

	// 리뷰 마이페이지 리스트
	public List<PrdctOrderVO> getReviewMyList(String member_id);

	// 페이징을 적용한 작성한 고객 Q&A 리스트 받아오기
	public List<BoardVO> getMyqList(MyqnaCriteria cri, String mbr_id);

	// 페이징 단위에 적용되는 최대 고객 Q&A 게시글 단위
	public int getMyqnaTotal(MyqnaCriteria cri);

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
}