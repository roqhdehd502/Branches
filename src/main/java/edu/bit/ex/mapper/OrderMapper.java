package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface OrderMapper {

	// 장바구니 리스트
	// public List<PrdctVO> getCartList();

	// 장바구니 페이지
	public PrdctVO getProduct(String prdct_id);

}
