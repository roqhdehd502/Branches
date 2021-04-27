package edu.bit.ex.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.mapper.OrderMapper;
import edu.bit.ex.vo.MbrVO;
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

	// 장바구니
	@Override
	public PrdctOrderDetailVO getPrdctCart(String prdct_id) {
		log.info("getPrdctCart()");
		return orderMapper.getProduct(prdct_id);
	}

	// 한가지 결제내역 저장
	@Override
	public void insertOrder(PrdctOrderVO po) {
		orderMapper.insertOrder(po);

	}

	// 아이디로 결제 정보 조회
	@Override
	public PrdctOrderVO getOrderInfo(String mbr_id) {

		return orderMapper.getOrderInfo(mbr_id);
	}

	// 주문한 상품 상세정보 넣기
	@Override
	public void insertOrderDetail(OrderDetailVO odVO) {
		orderMapper.insertOrderDetail(odVO);
	}

	@Override
	public int getPrdctPrice(String prdct_id) {

		return orderMapper.getPrdctPrice(prdct_id);
	}

	// 포인트 가져오기
	@Override
	public MbrVO getPoint(String mbr_id) {

		return orderMapper.getPoint(mbr_id);
	}

}
