package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

public interface SellerService {

	public List<OrderDetailVO> getOrderDetail();

	public List<PrdctVO> getProduct();

	public List<PrdctOrderVO> getPrdOrder();

	public List<BoardVO> getBoard();

	public List<PrdctDetailVO> getPrdctDetail();

	public MbrVO getMemberInfo(String s_id);

	public ShippingVO getSellerAddress(String m_id);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void prdctUpdate(PrdctVO pvo);

	public MbrVO getSellerInfo(String mbr_id);

	public void prdctDelete(String prdct_id);

	public void prdInsert(String prdct_name, int prdct_price, String prdct_color, String prdct_size, String prdct_stock);

	public PrdctVO getOption(String getPrdct_id);

	public PrdctDetailVO getPrd(String getPrdct_id);

}