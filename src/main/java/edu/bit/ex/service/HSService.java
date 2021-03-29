package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

public interface HSService {

	// 메인(common), 판매자마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 취소확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller), 판매자 상품 Q&A조회(seller),
	// 판매자 상품 리뷰조회(seller), 판매자 매출조회(seller), 관리자 유저 Q&A 조회(admin), 관리자 매출조회(admin), 관리자 매출 조회 검색(admin)
	public List<PrdctVO> getProduct();

	// 메인(common), 회원마이페이지(member)
	public List<MbrVO> getMember();

	/// 판매자 상품 Q&A조회(seller), 판매자 상품 리뷰조회(seller), 관리자 유저 Q&A 조회(admin)
	public List<BoardVO> getBoard();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 취소확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller)
	public List<OrderDetailVO> getOrder();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller), 판매자 매출조회(seller), 관리자 매출조회(admin), 관리자 매출
	// 조회검색(admin)
	public List<PrdctOrderVO> getPrdOrder();

	// 회원브랜드 조회(member), 관리자 회원정보 조회(admin)
	public List<MbrVO> getMemberList(SearchCriteria cri);

	// 관리자 회원정보 조회(admin)
	public int getTotal(SearchCriteria cri);

}
