package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctImageVO;
import edu.bit.ex.vo.PrdctVO;

public interface EjService {

	// 장바구니
	public List<CartVO> getCartList();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctDetailVO> getProductInfo(String p_id);

	// 상품 상세 사진
	public PrdctImageVO getprdDetailImage(int board_id);

	// 상품 장바구니 담기
	/* public void PrdDetailCartIn(PrdctVO prdctVO); */

	// 페이징을 적용한 상품 Q&A 게시판 리스트
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	public int getPrdQnATotal(PrdQnACriteria cri);

}
