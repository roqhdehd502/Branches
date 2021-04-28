package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
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
import edu.bit.ex.vo.PrdctViewVO;

public interface CommonService {
	// 상품 리스트
	public List<PrdctRegisterImageVO> getProduct();

	// 회원 리스트
	public List<MbrVO> getMember();

	// 상품 상세페이지
	public PrdctVO getProductDetail(String prdct_id);

	// 상품 상세페이지 옵션
	public List<PrdctVO> getProductInfo(String p_id);

	// 리뷰 리스트
	public List<BoardVO> getReviewList(PrdReviewCriteria rcri, String p_id);

	// 리뷰 별점 평균
	public BoardVO getStarAvg(String p_id);

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
	public int getBrandPrdctTotalCount(PrdctListCriteria cri, String b_id);

	public PrdctRegisterImageVO getPrdctBoard(String p_id);

	public String getCategoryName(int category_number);

	public int getPrdctReviewTotal(PrdReviewCriteria rcri, String p_id);

	// 상품 상세 페이지 찜하기
	public void setPrdctLike(PrdctLikeVO prdctLikeVO);

	// 해당 상품 찜 여부 확인용 데이터 가져오기
	public PrdctLikeVO getPrdLikeVal(String prdct_id);

	// 상품 상세페이지 찜취소 기능
	public int prdctLikeCancel(PrdctLikeVO prdctLikeVO);

	public List<MbrVO> getBrandList(BrandCriteria cri);

	public int getBrandTotalCount(BrandCriteria cri);

	// 상품 조회 내역 중복 여부
	public List<PrdctViewVO> getPrdView(String mbr_id, String prdct_id);

	// 상품 상세페이지 조회 기능
	public void addPrdView(String mbr_id, String prdct_id);

	// 판매자 댓글
	public void setCommentWrite(BoardCommentVO boardCommentVO);

	public List<BoardBoardCommentVO> getComment(String mbr_id, int board_id);

	public int CommentRemove(int comment_id);

}