package edu.bit.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.SellerMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class SellerServiceImpl implements SellerService {
	private SellerMapper sellerMapper;

	@Override
	public List<OrderDetailVO> getOrderDetail() {
		log.info("getOrderDetail......");
		return sellerMapper.getOrderDetail();
	}

	@Override
	public List<PrdctVO> getProduct() {
		log.info("getProduct......");
		return sellerMapper.getProduct();
	}

	@Override
	public List<PrdctOrderVO> getPrdOrder() {
		log.info("getPrdOrder......");
		return sellerMapper.getPrdOrder();
	}

	@Override
	public List<BoardVO> getBoard() {
		log.info("getBoard......");
		return sellerMapper.getBoard();
	}

	@Override
	public MbrVO getMemberInfo(String s_id) {
		// TODO Auto-generated method stub
		return sellerMapper.getMemberInfo(s_id);
	}

	@Override
	public ShippingVO getSellerAddress(String m_id) {
		// TODO Auto-generated method stub
		return sellerMapper.getSellerAddress(m_id);
	}

	@Override
	public void sellerInfoUpdate(MbrAddressVO mavo) {
		// TODO Auto-generated method stub
		log.info("sellerInfoUpdate()......");
		sellerMapper.sellerInfoUpdate(mavo);
		sellerMapper.sellerAddressUpdate(mavo);

	}

	@Override
	public void prdctUpdate(PrdctVO pvo) {
		log.info("prdctUpdate()......");
		sellerMapper.prdctUpdate(pvo);

	}

	@Override
	public void prdInsert(@Param("prdct_name") String prdct_name, @Param("prdct_price") int prdct_price, @Param("prdct_color") String prdct_color,
			@Param("prdct_size") String prdct_size, @Param("prdct_stock") String prdct_stock) {
		log.info("prdInsert()......");
		sellerMapper.prdInsert(prdct_name, prdct_price, prdct_color, prdct_size, prdct_stock);
	}

	@Override
	public List<PrdctDetailVO> getPrdctDetail() {
		log.info("getPrdctDetail()......");
		return sellerMapper.getPrdctDetail();
	}

	@Override
	public MbrVO getSellerInfo(String mbr_id) {
		log.info("getSellerInfo()......");
		return sellerMapper.getSellerInfo(mbr_id);
	}

	@Override
	public void prdctDelete(String prdct_id) {
		log.info("prdctDelete()......");
		sellerMapper.prdctDelete(prdct_id);

	}

	@Override
	public PrdctVO getOption(String getPrdct_id) {
		log.info("getOption()......");
		return sellerMapper.getOption(getPrdct_id);
	}

	@Override
	public PrdctDetailVO getPrd(String getPrdct_id) {
		log.info("getPrd()......");
		return sellerMapper.getPrd(getPrdct_id);
	}

}