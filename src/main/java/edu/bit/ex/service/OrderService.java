package edu.bit.ex.service;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;

public interface OrderService {

	// 장바구니
	public PrdctOrderDetailVO getPrdctCart(String prdct_id);

	// 한 결제 내역 저장
	public void insertOrder(PrdctOrderVO po);

	// 아이디로 결제정보 조회
	public PrdctOrderVO getPayInfo(String mbr_id);

	public void insertOrderDetail(OrderDetailVO odVO);

}
