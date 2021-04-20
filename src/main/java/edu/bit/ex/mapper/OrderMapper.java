package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;

@Mapper
public interface OrderMapper {

	// 장바구니 페이지
	public PrdctOrderDetailVO getProduct(String prdct_id);

	public void insertOrder(PrdctOrderVO po);

	public PrdctOrderVO getOrderInfo(String mbr_id);

	public void insertOrderDetail(OrderDetailVO odVO);

}
