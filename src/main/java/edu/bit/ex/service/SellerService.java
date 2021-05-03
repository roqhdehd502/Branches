package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctPrdctLikeVO;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

public interface SellerService {

	// 상품 정보 불러오기
	public List<PrdctOrderDetailVO> getProduct();

	// 게시판 정보 불러오기
	public List<BoardPrdctPrdctLikeVO> getBoard(SearchCriteria cri);

	// 판매자 정보 불러오기
	public MbrVO getMemberInfo(String s_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrShippingVO mavo);

	// 상품삭제
	public void prdctDelete(String prdct_id);

	public PrdctVO getOption(String getPrdct_id);

	// 판매자 주소 불러오기(상품 등록시)
	public MbrShippingVO getAddress(String m_id);

	// 게시글 내용 불러오기(상품 수정시)
	public BoardVO getContent(String getPrdct_id);

	// 상품 등록글 불러오기 (상품 조회시)
	public List<PrdctRegisterImageVO> getSellerPrdct(SearchCriteria cri);

	// 상품q&a 게시글 총 수 불러오기
	public int getTotal(SearchCriteria cri);

	// 상품조회 게시글 총 수 불러오기
	public int getPrdTotal(SearchCriteria cri);

	// 상품 정보 불러오기(수정페이지)
	public PrdctVO getPrdctInfo(String prdct_id);

	// 상품정보 수정하기(수정페이지)
	public void updatePrdctInfo(PrdctRegisterImageVO prvo);

	// 상품등록 내용 수정(수정페이지)
	public void prdctContentUpdate(PrdctRegisterImageVO prvo);

	// 상품 등록
	public void prdInsert(PrdctRegisterImageVO prdctIVO);

	// 주문확인
	public List<PrdctOrderDetailVO> OrderCheck(SearchCriteria cri);

	// 페이징
	public int OrderCheckTotal(SearchCriteria cri);

	// 배송대기
	public List<PrdctOrderDetailVO> shipping(SearchCriteria cri);

	// 페이징
	public int deliveryTotal(SearchCriteria cri);

	// 상품취소
	public List<PrdctOrderDetailVO> getCancel(SearchCriteria cri);

	// 페이징
	public int cancelTotal(SearchCriteria cri);

	// 상품 환불
	public List<PrdctOrderDetailVO> getRefund(SearchCriteria cri);

	// 페이징
	public int refundTotal(SearchCriteria cri);

	// 상품 교환
	public List<PrdctOrderDetailVO> exchange(SearchCriteria cri);

	// 페이징
	public int exchangeTotal(SearchCriteria cri);

	// 리뷰 불러오기
	public List<BoardPrdctPrdctLikeVO> getReview(SearchCriteria cri);

	// 페이징
	public int reviewTotal(SearchCriteria cri);

	// 주문상세정보 불러오기
	public PrdctOrderDetailVO orderInfo(String prdct_id, String order_number);

	// 주문자 정보 불러오기
	public PrdctOrderDetailVO orderMbr(String prdct_id, String order_number);

	// 주문 옵션 수정페이지
	public void updateOrderOption(PrdctOrderDetailVO povo);

	// 주문 상태변경
	public void updateState(PrdctOrderDetailVO povo);

	// 썸네일 변경 및 새로 추가
	public void setModifyAddImg(PrdctRegisterImageVO prvo);

	// 새주문 알림
	public int orderCount(PrdctOrderDetailVO povo);

	// 취소요청 알림
	public int cancelCount(PrdctOrderDetailVO povo);

	// 교환요청 알림
	public int exchangeCount(PrdctOrderDetailVO povo);

	// 환불요청 알림
	public int refundCount(PrdctOrderDetailVO povo);

	// 일간 통계차트
	public PrdctOrderVO dailyChart();

	// 주간 통계차트
	public PrdctOrderVO weekChart();

	// 월간 통계차트
	public PrdctOrderVO monthChart();

	// 연간 통계차트
	public PrdctOrderVO yearChart();

	// 상품 Q&A 댓글등록
	public void qnaInsert(BoardBoardCommentVO bbcVO);

	// 상품 Q&A 내용 불러오기
	public BoardVO qnaBoard(int board_id);

	// 상품 Q&A 댓글불러오기
	public List<BoardCommentVO> getQnaComment(int board_id);

	// 상품 Q&A 댓글삭제
	public int CommentRemove(int comment_id);

	// 조건에 따라 댓글등록창이 보일수 있게 만든 쿼리
	public BoardBoardCommentVO getPrdctqCmntStat(int board_id);

	// junit 테스트
	public void getQnaCommentTest(BoardBoardCommentVO comment);

	public void prdctInfoUpdateTest(PrdctRegisterImageVO pvo);

	public void prdctInfoInsertTest(PrdctRegisterImageVO pvo);

	public void prdctRemove(String p01);

	public void commentRemove(int board_id);

	public void sellerInfoUpdateTest(MbrShippingVO msVO);

	public void orderInfoUpdateTest(PrdctOrderDetailVO pvo);

}