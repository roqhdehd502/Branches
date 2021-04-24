package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.mapper.CommonMapper;
import edu.bit.ex.page.BrandCriteria;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdReviewCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctLikeVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class CommonServiceImpl implements CommonService {
	private CommonMapper commonMapper;

	// 상품 리스트
	@Override
	public List<PrdctRegisterImageVO> getProduct() {
		log.info("getProduct......");
		return commonMapper.getProduct();
	}

	// 회원 리스트
	@Override
	public List<MbrVO> getMember() {
		log.info("getMember......");
		return commonMapper.getMember();
	}

	// 상품 상세페이지
	@Override
	public PrdctVO getProductDetail(String prdct_id) {
		log.info("getProductDetail");
		return commonMapper.getProductDetail(prdct_id);
	}

	// 상품 상세페이지 옵션
	@Override
	public List<PrdctVO> getProductInfo(String p_id) {
		log.info("getProductInfo");
		return commonMapper.getProductInfo(p_id);
	}

	// 리뷰 리스트
	@Override
	public List<BoardVO> getReviewList(PrdReviewCriteria rcri, String p_id) {
		log.info("getreviewList");
		return commonMapper.getReviewList(rcri, p_id);
	}

	@Override
	public int getPrdctReviewTotal(PrdReviewCriteria rcri, String p_id) {
		// TODO Auto-generated method stub
		return commonMapper.getPrdctReviewTotal(rcri, p_id);
	}

	// 페이징을 적용한 상품 Q&A 게시판 리스트
	@Override
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id) {
		log.info("getPrdQnAList WITH criteria: " + cri);
		return commonMapper.getPrdQnAListWithPaging(cri, p_id);
	}

	// 페이징 단위에 적용되는 최대 상품 Q&A 게시글 단위
	@Override
	public int getPrdQnATotal(PrdQnACriteria cri) {
		log.info("getPrdQnATotal WITH criteria: " + cri);
		return commonMapper.getPrdQnATotalCount(cri);
	}

	// 리뷰 모달 댓글
	@Override
	public void setModalReply(BoardCommentVO boardCommentVO) {
		// TODO Auto-generated method stub

	}

	// 카테고리별 상품 리스트
	@Override
	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id) {
		log.info("getCategoryPrdctListWithCri");
		return commonMapper.getCategoryPrdctList(cri, c_id);
	}

	// 카테고리별 상품 상세
	@Override
	public CategoryVO getCategory(int c_id) {
		log.info("getCategory");
		return commonMapper.getCategory(c_id);
	}

	// 페이징을 적용한 상품 리스트
	@Override
	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id) {
		log.info("getCategoryTotalCount");
		return commonMapper.getCategoryTotalCount(cri, c_id);
	}

	// 판매자 마이페이지
	@Override
	public MbrVO getMemberInfo(String s_id) {
		log.info("getMemberInfo");
		return commonMapper.getMemberInfo(s_id);
	}

	// 페이징 단위에 적용되는 최대 브랜드 상품 리스트 단위
	@Override
	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id) {
		log.info("getBrandPrdctListWithCri");
		return commonMapper.getBrandPrdctList(cri, b_id);
	}

	// 페이징에 적용되는 브랜드 상품 수
	@Override
	public int getBrandPrdctTotalCount(PrdctListCriteria cri, String b_id) {
		log.info(b_id);
		return commonMapper.getBrandPrdctTotalCount(cri, b_id);
	}

	@Override
	public PrdctRegisterImageVO getPrdctBoard(String p_id) {
		// TODO Auto-generated method stub
		return commonMapper.getPrdctBoard(p_id);
	}

	@Override
	public String getCategoryName(int category_number) {
		// TODO Auto-generated method stub
		return commonMapper.getCategoryName(category_number);
	}

	// 상품 상세 페이지 찜하기
	@Override
	public void setPrdctLike(PrdctLikeVO prdctLikeVO) {
		log.info("setPrdctLike...");
		commonMapper.setPrdctLike(prdctLikeVO);
	}

	// 해당 상품 찜 여부 확인용 데이터 가져오기
	@Override
	public PrdctLikeVO getPrdLikeVal(String prdct_id) {
		log.info("getPrdLikeVal...");
		return commonMapper.getPrdLikeVal(prdct_id);
	}

	// 상품 상세페이지 찜취소 기능
	@Override
	public int prdctLikeCancel(PrdctLikeVO prdctLikeVO) {
		log.info("prdctLikeCancel...");
		return commonMapper.prdctLikeCancel(prdctLikeVO);
	}

	@Override
	public List<MbrVO> getBrandList(BrandCriteria cri) {
		// TODO Auto-generated method stub
		return commonMapper.getBrandList(cri);
	}

	@Override
	public int getBrandTotalCount(BrandCriteria cri) {
		// TODO Auto-generated method stub
		return commonMapper.getBrandTotalCount(cri);
	}
}