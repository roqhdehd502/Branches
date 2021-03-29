package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctImageVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface EjMapper {

	// 장바구니 common
	public List<CartVO> getCartList();

	// 상품 상세페이지 common
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션 common
	public List<PrdctDetailVO> getProductInfo(String p_id);

	// 상품 상세이미지 common
	public PrdctImageVO getprdDetailImage(int board_id);

	// 상품 장바구니 담기 common
	/*
	 * public void PrdDetailCartIn(PrdctVO prdctVO);
	 */
	// 페이징을 적용한 상품 Q&A 게시판 리스트 customer
	public List<BoardVO> getPrdQnAListWithPaging(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위 customer
	public int getPrdQnATotalCount(PrdQnACriteria cri);

}
