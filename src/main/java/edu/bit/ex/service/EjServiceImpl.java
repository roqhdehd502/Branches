package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.EjMapper;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardVO;
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

	// 상품 장바구니 담기
	/*
	 * @Override public void PrdDetailCartIn(PrdctVO prdctVO) { log.info("PrdDetailCartIn"); ejMapper.PrdDetailCartIn(prdctVO);
	 * 
	 * }
	 */

	// 페이징을 적용한 상품 Q&A 게시판 리스트
	@Override
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id) {
		log.info("getPrdQnAList WITH criteria: " + cri);
		return ejMapper.getPrdQnAListWithPaging(cri, p_id);
	}

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	@Override
	public int getPrdQnATotal(PrdQnACriteria cri) {
		log.info("getPrdQnATotal WITH criteria: " + cri);
		return ejMapper.getPrdQnATotalCount(cri);
	}

}