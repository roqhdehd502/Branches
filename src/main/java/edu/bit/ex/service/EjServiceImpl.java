package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.EjMapper;
import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctImageVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@AllArgsConstructor
@Service
public class EjServiceImpl implements EjService {
	private EjMapper ejMapper;

	// 장바구니
	@Override
	public List<CartVO> getCartList() {
		log.info("getCartList");
		return ejMapper.getCartList();
	}

	// 상품 상세페이지
	@Override
	public PrdctVO getProductDetail(String prdct_id) {
		log.info("getProductDetail");
		return ejMapper.getProductDetail(prdct_id);
	}

	// 상품 상세페이지 옵션
	@Override
	public List<PrdctDetailVO> getProductInfo(String p_id) {
		log.info("getProductInfo");
		return ejMapper.getProductInfo(p_id);
	}

	// 상품 상세이미지
	@Override
	public PrdctImageVO getprdDetailImage(int board_id) {
		log.info("getprdDetailImage");
		return ejMapper.getprdDetailImage(board_id);
	}

}