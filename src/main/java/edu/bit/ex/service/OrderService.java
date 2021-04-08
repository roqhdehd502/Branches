package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.PrdctVO;

public interface OrderService {

	// 장바구니 리스트
	public List<PrdctVO> getCartList();

	// 장바구니 페이지
	public PrdctVO getProduct(String prdct_id);

}
