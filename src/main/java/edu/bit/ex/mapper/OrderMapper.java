package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;

@Mapper
public interface OrderMapper {

	// 장바구니 페이지
	public PrdctOrderDetailVO getProduct(String prdct_id);

	public void insertOrder(PrdctOrderDetailVO prdVO);

}
