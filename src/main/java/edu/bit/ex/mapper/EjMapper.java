package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.CartVO;

@Mapper
public interface EjMapper {

	// 장바구니
	public List<CartVO> getCartList();

}
