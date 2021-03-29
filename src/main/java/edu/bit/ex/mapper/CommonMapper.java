package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctImageVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface CommonMapper {
	// 페이징을 적용한 공지사항 게시판 리스트
	public List<BoardVO> getNoticeListWithPaging(NoticeCriteria cri);

	// 페이징 단위에 적용되는 최대 공지 게시글 단위
	public int getNoticeTotalCount(NoticeCriteria cri);

	// 공지사항 게시글
	public BoardVO getNoticeContent(int board_id);

	// 공지사항 삭제
	public int noticeRemove(int board_id);

	// 공지사항 수정
	public void setNoticeModify(BoardVO boardVO);

	// 페이징을 적용한 매거진 게시판 리스트
	public List<BoardPrdctImageVO> getMagazineListWithPaging(MagazineCriteria cri);

	// 페이징 단위에 적용되는 최대 매거진 게시글 단위
	public int getMagazineTotalCount(MagazineCriteria cri);

	// 매거진 게시글
	public BoardVO getMagazineContent(int board_id);

	// 매거진 게시글 조회
	public void upMagazineHit(int board_id);

	// 매거진 게시글 이미지 리스트
	public List<PrdctImageVO> getMagazineImage(int board_id);

	// 매거진 게시글 추천
	public int magazineUpLike(int board_id);

	// 매거진 게시글 댓글 수
	public BoardCommentVO getMagazineCommentCnt(String mbr_id, int board_id);

	// 페이징을 적용한 매거진 게시글 댓글 리스트
	public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id);
	/* public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id, MagazineCommentCriteria cri); */

	// 페이징 단위에 적용되는 최대 매거진 게시글 댓글 단위
	public int getMagazineCommentTotalCount(MagazineCommentCriteria cri);

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

	// 메인(common), 판매자마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 취소확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller), 판매자 상품 Q&A조회(seller),
	// 판매자 상품 리뷰조회(seller), 판매자 매출조회(seller), 관리자 유저 Q&A 조회(admin), 관리자 매출조회(admin), 관리자 매출 조회 검색(admin)
	@Select("select * from prdct")
	public List<PrdctVO> getProduct();

	// 메인(common), 회원마이페이지(member)
	@Select("select * from mbr")
	public List<MbrVO> getMember();

	public List<PrdctVO> getPrdctListWithPaging(PrdctListCriteria cri); // common

	public List<PrdctVO> getCategoryPrdctList(PrdctListCriteria cri, int c_id); // common

	public List<PrdctVO> getBrandPrdctList(PrdctListCriteria cri, String b_id); // common
}