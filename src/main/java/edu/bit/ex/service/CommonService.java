package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctVO;

public interface CommonService {
	// 상품 리스트
	public List<PrdctVO> getProduct();

	// 회원 리스트
	public List<MbrVO> getMember();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctDetailVO> getProductInfo(String p_id);

	// 리뷰 리스트
	public List<BoardVO> getreviewList(String p_id);

	// 페이징을 적용한 상품 Q&A 게시판 리스트
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	public int getPrdQnATotal(PrdQnACriteria cri);

	// 리뷰 모달 댓글
	public void setModalReply(BoardCommentVO boardCommentVO);

	// 카테고리별 상품 리스트
	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id);

	// 카테고리별 상품 상세
	public CategoryVO getCategory(int c_id);

	// 페이징을 적용한 상품 리스트
	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id);

	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	// 페이징 단위에 적용되는 최대 브랜드 상품 리스트 단위
	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id);

	// 페이징에 적용되는 브랜드 상품 수
	public int getBrandTotalCount(PrdctListCriteria cri, String b_id);

}