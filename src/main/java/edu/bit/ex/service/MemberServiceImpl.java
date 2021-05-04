package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctPrdctLikeVO;
import edu.bit.ex.joinvo.InquiryBoardVO;
import edu.bit.ex.joinvo.PrdctOrdctDetailPrdctOrderVO;
import edu.bit.ex.joinvo.PrdctPrdctViewVO;
import edu.bit.ex.mapper.MemberMapper;
import edu.bit.ex.page.MemberOrderCriteria;
import edu.bit.ex.page.MemberRecentlyCriteria;
import edu.bit.ex.page.MyqnaCriteria;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;

	// 상품 Q&A 등록 페이지
	@Override
	public MbrVO getPrdctQnaInfo(String mbr_id) {
		log.info("getPrdctQnaInfo");
		return memberMapper.getPrdctQnaInfo(mbr_id);
	}

	@Override
	public PrdctVO prdctInfo(String prdct_id) {
		log.info("prdctInfo");
		return memberMapper.prdctInfo(prdct_id);
	}

	// 상품 Q&A 등록 작성
	@Override
	public void setPrdctQnaWrite(BoardVO boardVO) {
		log.info("setPrdctQnaWrite()......");
		memberMapper.prdctQnaWrite(boardVO);
	}

	// 상품 Q&A 마이페이지 리스트
	@Override
	public List<BoardBoardCommentVO> getPrdctqMyList(PrdQnACriteria cri, String mbr_id) {
		log.info("getMyqList()......");
		return memberMapper.getPrdctqMyListWithPaging(cri, mbr_id);
	}

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	@Override
	public int getPrdctqTotal(PrdQnACriteria cri) {
		log.info("getPrdctqTotal WITH criteria: " + cri);
		return memberMapper.getPrdctqTotalCount(cri);
	}

	// 작성한 상품 Q&A 응답여부 받아오기
	@Override
	public BoardBoardCommentVO getPrdctqCmntStat(int board_id) {
		log.info("getPrdctqCmntStat()......");
		return memberMapper.getPrdctqCmntStat(board_id);
	}

	// 판매자 마이페이지
	@Override
	public MbrVO getMemberInfo(String s_id) {
		log.info("getMemberInfo()......");
		return memberMapper.getMemberInfo(s_id);
	}

	// 회원 정보 수정
	@Override
	public void memberInfoUpdate(MbrVO mbrvo) { // admin seller member
		log.info("memberInfoUpdate()......");
		memberMapper.memberInfoUpdate(mbrvo);
	}

	// 리뷰 등록 페이지
	@Override
	public MbrVO getCustomerInfo(String mbr_id) {
		log.info("getCustomerInfo()......");
		return memberMapper.getCustomerInfo(mbr_id);
	}

	// 리뷰 등록 작성
	@Override
	public void setReviewWrite(BoardVO boardVO) {
		log.info("setReviewWrite()......");
		memberMapper.rivewWrite(boardVO);

	}

	// 리뷰 마이페이지 리스트
	@Override
	public List<PrdctOrderVO> getReviewMyList(String member_id) {
		log.info("getReviewMyList()......");
		return memberMapper.reviewMyList(member_id);
	}

	// 페이징을 적용한 작성한 고객 Q&A 리스트 받아오기
	@Override
	public List<BoardVO> getMyqList(MyqnaCriteria cri, String mbr_id, int board_id) {
		log.info("getMyqList()......");
		return memberMapper.getMyqListWithPaging(cri, mbr_id, board_id);
	}

	// 페이징 단위에 적용되는 최대 고객 Q&A 게시글 단위
	@Override
	public int getMyqnaTotal(MyqnaCriteria cri) {
		log.info("getMyqnaTotal WITH criteria: " + cri);
		return memberMapper.getMyqnaTotalCount(cri);
	}

	// 작성한 고객 Q&A 응답여부 받아오기
	@Override
	public List<BoardCommentVO> getMyqCmntStat(int board_id) {
		log.info("getMyqCmntStat()......");
		return memberMapper.getMyqCmntStat(board_id);
	}

	// 고객 Q&A 작성페이지 문의 유형 받아오기
	@Override
	public List<InquiryVO> getMyqInquiry() {
		log.info("getMyqInquiry()......");
		return memberMapper.getMyqInquiry();
	}

	// 고객 QnA 작성
	@Override
	public void setmyqnaWriting(BoardVO boardVO) {
		log.info("getMyqInquiry()......");
		memberMapper.setmyqnaWriting(boardVO);
	}

	// 고객 QnA 상세페이지
	@Override
	public InquiryBoardVO getMyqContent(int board_id) {
		log.info("getMyqContent()......");
		return memberMapper.getMyqContent(board_id);
	}

	// 고객 QnA 상세페이지 관리자가 작성한 댓글 리스트 받아오기
	@Override
	public List<BoardCommentVO> getMyqComment(int board_id) {
		log.info("getMyqComment()......");
		return memberMapper.getMyqComment(board_id);
	}

	// 고객 QnA 수정
	@Override
	public void setmyqnaModify(BoardVO boardVO) {
		log.info("setmyqnaModify()......");
		memberMapper.setmyqnaModify(boardVO);
	}

	// 고객 QnA 삭제
	@Override
	public int myqnaRemove(int board_id) {
		log.info("setmyqnaModify()......");
		return memberMapper.myqnaRemove(board_id);
	}

	// 찜했던 상품 리스트 받아오기
	@Override
	public List<BoardPrdctPrdctLikeVO> getLikePrdctList(String mbr_id) {
		log.info("getLikePrdctList()......");
		return memberMapper.getLikePrdctList(mbr_id);
	}

	// 주문내역 리스트 가져오기
	@Override
	public List<PrdctOrdctDetailPrdctOrderVO> getOrderMyList(String mbr_id) {
		log.info("getOrderMyList()......");
		return memberMapper.getOrderMyList(mbr_id);
	}

	@Override
	public List<PrdctOrdctDetailPrdctOrderVO> getOrderMyList(String mbr_id, MemberOrderCriteria cri) {
		log.info("getOrderMyList WITH criteria: " + cri);
		return memberMapper.getOrderMyListPaging(mbr_id, cri);
	}

	// 페이징 단위에 적용되는 최대 주문내역 단위
	@Override
	public int getOrderMyTotal(MemberOrderCriteria cri) {
		log.info("getOrderMyTotal WITH criteria: " + cri);
		return memberMapper.getOrderMyTotalCount(cri);
	}

	// 최근 본 상품 리스트 가져오기
	@Override
	public List<PrdctPrdctViewVO> getPrdctViewList(String mbr_id) {
		log.info("getPrdctViewList");
		return memberMapper.getPrdctViewList(mbr_id);
	}

	@Override
	public List<PrdctPrdctViewVO> getPrdctViewList(String mbr_id, MemberRecentlyCriteria cri) {
		log.info("getOrderMyList WITH criteria: " + cri);
		return memberMapper.getPrdctViewListPaging(mbr_id, cri);
	}

	// 페이징 단위에 적용되는 최대 최근 본 상품 단위
	@Override
	public int getPrdctViewTotal(MemberRecentlyCriteria cri) {
		log.info("getPrdctViewTotal WITH criteria: " + cri);
		return memberMapper.getPrdctViewTotalCount(cri);
	}

	// 마이 페이지 주문확인
	@Override
	public void orderStateUpdate(PrdctOrderVO prdctOrderVO) {
		log.info("orderStateUpdate");
		memberMapper.orderStateUpdate(prdctOrderVO);
	}
}