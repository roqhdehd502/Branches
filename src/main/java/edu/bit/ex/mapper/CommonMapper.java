package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface CommonMapper {
	// 상품 리스트
	// @Select("select * from prdct")
	public List<PrdctVO> getProduct();

	// 회원 리스트
	// @Select("select * from mbr")
	public List<MbrVO> getMember();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctDetailVO> getProductInfo(String p_id);

	// 리뷰 리스트
	public List<BoardVO> getReviewList(String p_id);

	// 페이징을 적용한 상품 Q&A 게시판 리스트
	public List<BoardVO> getPrdQnAListWithPaging(PrdQnACriteria cri, String p_id);

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	public int getPrdQnATotalCount(PrdQnACriteria cri);

	// 카테고리별 상품 리스트
	public List<PrdctVO> getCategoryPrdctList(PrdctListCriteria cri, int c_id);

	// 카테고리별 상품 상세
	public CategoryVO getCategory(int c_id);

	// 페이징을 적용한 상품 리스트
	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id);

	// 판매자 마이페이지
	// @Select("select * from mbr where mbr_id=#{m_id}")
	public MbrVO getMemberInfo(String s_id);

	// 페이징 단위에 적용되는 최대 브랜드 상품 리스트 단위
	public List<PrdctVO> getBrandPrdctList(PrdctListCriteria cri, String b_id);

	// 페이징에 적용되는 브랜드 상품 수
	public int getBrandTotalCount(PrdctListCriteria cri, String b_id);

}