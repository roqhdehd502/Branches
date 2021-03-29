package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.CartVO;

@Mapper
public interface OrderMapper {

	// 장바구니 common
	public List<CartVO> getCartList();

	// 상품 장바구니 담기 common
	/*
	 * public void PrdDetailCartIn(PrdctVO prdctVO);
	 */

}
