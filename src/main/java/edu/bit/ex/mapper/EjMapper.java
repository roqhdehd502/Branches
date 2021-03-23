package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface EjMapper {

	// 장바구니
	public List<CartVO> getCartList();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctDetailVO> getProductInfo(String p_id);

}
