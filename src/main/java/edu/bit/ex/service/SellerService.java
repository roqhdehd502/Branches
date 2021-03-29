package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;

public interface SellerService {
	/// 판매자 상품 Q&A조회(seller), 판매자 상품 리뷰조회(seller), 관리자 유저 Q&A 조회(admin)
	public List<BoardVO> getBoard();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 취소확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller)
	public List<OrderDetailVO> getOrder();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller), 판매자 매출조회(seller), 관리자 매출조회(admin), 관리자 매출
	// 조회검색(admin)
	public List<PrdctOrderVO> getPrdOrder();
}