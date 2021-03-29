package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

public interface HSService {

	// 메인, 판매자마이페이지, 판매자 주문확인, 판매자 발송확인, 판매자 취소확인, 판매자 환불확인, 판매자 교환확인, 판매자 상품 Q&A조회,판매자 상품 리뷰조회, 판매자 매출조회, 관리자 유저 Q&A 조회, 관리자 매출조회, 관리자 매출 조회 검색
	public List<PrdctVO> getProduct();

	// 메인, 회원마이페이지
	public List<MbrVO> getMember();

	// 판매자 상품 Q&A조회, 판매자 상품 리뷰조회, 관리자 유저 Q&A 조회
	public List<BoardVO> getBoard();

	// 판매자 마이페이지, 판매자 주문확인, 판매자 발송확인, 판매자 취소확인, 판매자 환불확인, 판매자 교환확인
	public List<OrderDetailVO> getOrder();

	// 판매자 마이페이지, 판매자 주문확인, 판매자 발송확인, 판매자 환불확인, 판매자 교환확인, 판매자 매출조회, 관리자 매출조회, 관리자 매출 조회 검색
	public List<PrdctOrderVO> getPrdOrder();

	// 회원브랜드 조회, 관리자 회원정보 조회
	public List<MbrVO> getMemberList(SearchCriteria cri);

	// 관리자 회원정보 조회
	public int getTotal(SearchCriteria cri);

}
