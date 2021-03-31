package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface SellerMapper {

	public List<OrderDetailVO> getOrderDetail();

	public List<PrdctVO> getProduct();

	public List<PrdctOrderVO> getPrdOrder();

	public List<BoardVO> getBoard();

	public List<PrdctDetailVO> getPrdctDetail();

	public MbrVO getMemberInfo(String s_id);

	public ShippingVO getSellerAddress(String m_id);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void sellerAddressUpdate(MbrAddressVO mavo);

	public void prdctUpdate(PrdctVO pvo);

	public void prdInsert(@Param("prdct_name") String prdct_name, @Param("prdct_price") int prdct_price, @Param("prdct_color") String prdct_color,
			@Param("prdct_size") String prdct_size, @Param("prdct_stock") String prdct_stock);

	public MbrVO getSellerInfo(String mbr_id);

	public void prdctDelete(String prdct_id);

	public PrdctVO getOption(String getPrdct_id);

	public PrdctDetailVO getPrd(String getPrdct_id);

}