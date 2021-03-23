package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctVO;

public interface EjService {

	// 장바구니
	public List<CartVO> getCartList();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctDetailVO> getProductInfo(String p_id);

}
