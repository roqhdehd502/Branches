package edu.bit.ex.service;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;

public interface OrderService {

	// 장바구니 리스트
	// public List<PrdctVO> getCartList();

	// 장바구니 페이지
	// public PrdctVO getProduct(String prdct_id);

	public PrdctOrderDetailVO getPrdctCart(String prdct_id);

	public void insertOrder(PrdctOrderDetailVO prdVO);

}
