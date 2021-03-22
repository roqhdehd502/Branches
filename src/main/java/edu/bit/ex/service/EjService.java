package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.CartVO;

public interface EjService {

	// 장바구니
	public List<CartVO> getCartList();

}
