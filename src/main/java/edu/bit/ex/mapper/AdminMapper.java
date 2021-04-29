package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrdctDetailPrdctOrderVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.page.UserQnACriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface AdminMapper {

	// 판매자 페이징 리스트
	public List<MbrVO> getSellerListWithCri(MemberCriteria cri);

	public int getSellerTotalCount(MemberCriteria cri);

	// 회원 상세 정보
	public MbrVO getMemberInfo(String m_id);

	// 판매자 배송지
	public ShippingVO getSellerAddress(String m_id);

	// 판매자 별 등록상품 페이징 리스트
	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public List<BoardVO> getPrdctImg(String mbr_id);

	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrShippingVO mavo);

	public void sellerAddressUpdate(MbrShippingVO mavo);

	// 판매자 삭제(탈퇴)======보류

	// 회원 페이징 리스트
	public List<MbrVO> getMemberListWithCri(MemberCriteria cri);

	public int getMemberTotalCount(MemberCriteria cri);

	public void memberInfoUpdate(MbrVO mbrvo);

	// 판매자 등록
	public void addSellerInfo(MbrShippingVO mbrShippingVO);

	public void addSellerAddress(MbrShippingVO mbrShippingVO);

	public PrdctVO getPrdctInfo(String p_id);

	public BoardVO getPrdctContent(String p_id);

	// 회원 삭제(탈퇴)======보류

	// 썸네일 제외 상품수정
	public void updatePrdctInfo(PrdctRegisterImageVO prvo);

	// 썸네일 포함 상품수정
	public void updatePrdctThumb(PrdctRegisterImageVO prvo);

	// 상품 보드 수정
	public void updatePrdctBoardInfo(PrdctRegisterImageVO prvo);

	// 판매자 상품 리스트
	public List<PrdctOrderVO> getMemberOrderList(String m_id, MemberCriteria cri);

	// 회원
	public List<PrdctOrderVO> getMemberOrderList(String m_id);

	public int getOrderTotalCount(String m_id);

	public List<PrdctOrdctDetailPrdctOrderVO> getOrderDetail(String order_number);

	public List<BoardVO> getUserQnAListWithCri(UserQnACriteria cri);

	public int getUserQnATotalCount(UserQnACriteria cri);

	public BoardVO getUserQnA(int b_id);

	public List<BoardCommentVO> getQnAComment(int b_id);

	public void userQnAComment(BoardCommentVO commentVO);

	public Integer getDailySales(String year, String month, String day);

	public Integer getMonthlySales(String year, String month);

	public Integer getYearlySales(String year);

}