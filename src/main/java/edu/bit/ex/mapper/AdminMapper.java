package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface AdminMapper {

	// 고객 Q&A 페이징 리스트
	/*
	 * public List<BoardVO> getUserQnAListWithCri(UserQnACriteria cri);
	 * 
	 * public int getUserQnATotalCount(UserQnACriteria cri);
	 */

	// 판매자 페이징 리스트
	public List<MbrVO> getSellerListWithCri(MemberCriteria cri);

	public int getSellerTotalCount(MemberCriteria cri);

	// 회원 상세 정보
	public MbrVO getMemberInfo(String m_id);

	// 판매자 배송지
	public ShippingVO getSellerAddress(String m_id);

	// 판매자 별 등록상품 페이징 리스트
	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void sellerAddressUpdate(MbrAddressVO mavo);

	// 판매자 삭제(탈퇴)======보류

	// 회원 페이징 리스트
	public List<MbrVO> getMemberListWithCri(MemberCriteria cri);

	public int getMemberTotalCount(MemberCriteria cri);

	public void memberInfoUpdate(MbrVO mbrvo);

	// 회원 삭제(탈퇴)======보류

}