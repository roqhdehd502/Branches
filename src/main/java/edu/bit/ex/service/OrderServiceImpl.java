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
		orderMapper.insertOrder(po);

	}

	@Override
	public PrdctOrderVO getOrderInfo(String mbr_id) {

		return orderMapper.getOrderInfo(mbr_id);
	}

	@Override
	public void insertOrderDetail(OrderDetailVO odVO) {
		orderMapper.insertOrderDetail(odVO);
	}

	@Override
	public int getPrdctPrice(String prdct_id) {
		// TODO Auto-generated method stub
		return orderMapper.getPrdctPrice(prdct_id);
	}

}
