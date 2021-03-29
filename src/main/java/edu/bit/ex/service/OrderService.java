package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.CartVO;

public interface OrderService {

	// 상품 장바구니 담기 common
	/* public void PrdDetailCartIn(PrdctVO prdctVO); */

	// 장바구니
	public List<CartVO> getCartList();

}
