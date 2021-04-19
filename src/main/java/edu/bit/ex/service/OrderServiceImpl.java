package edu.bit.ex.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.mapper.OrderMapper;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@AllArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;

	@Override
	public PrdctOrderDetailVO getPrdctCart(String prdct_id) {
		log.info("getPrdctCart()");
		return orderMapper.getProduct(prdct_id);
	}

	@Override
	public void insertOrder(PrdctOrderVO po) {
		// TODO Auto-generated method stub

	}

	@Override
	public PrdctOrderVO getPayInfo(String mbr_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOrderDetail(OrderDetailVO odVO) {
		// TODO Auto-generated method stub

	}

}
