package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.OrderMapper;
import edu.bit.ex.vo.CartVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@AllArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;

	// 상품 장바구니 담기 common
	/*
	 * @Override public void PrdDetailCartIn(PrdctVO prdctVO) { log.info("PrdDetailCartIn"); ejMapper.PrdDetailCartIn(prdctVO);
	 * 
	 * }
	 */

	// 장바구니 common
	@Override
	public List<CartVO> getCartList() {
		log.info("getCartList");
		return orderMapper.getCartList();
	}

}
