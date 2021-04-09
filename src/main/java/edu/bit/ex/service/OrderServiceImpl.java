package edu.bit.ex.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.OrderMapper;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@AllArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;

	// 장바구니 리스트
	/*
	 * @Override public List<PrdctVO> getCartList() { log.info("getCartList()"); return orderMapper.getCartList(); }
	 */
	@Override
	public PrdctVO getProduct(String prdct_id) {
		return orderMapper.getProduct(prdct_id);
	}

}
