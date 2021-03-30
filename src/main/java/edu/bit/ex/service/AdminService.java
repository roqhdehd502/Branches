package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

public interface AdminService {

	// 유저 Q&A 페이징 리스트
	/*
	 * public List<BoardVO> getUserQnAListWithCri(UserQnACriteria cri);
	 * 
	 * public int getUserQnATotalCount(UserQnACriteria cri);
	 */

	public List<MbrVO> getSellerListWithCri(MemberCriteria cri);

	public int getSellerTotalCount(MemberCriteria cri);

	public MbrVO getMemberInfo(String m_id);

	public ShippingVO getSellerAddress(String m_id);

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void deleteSeller(MbrAddressVO mavo);

	public List<MbrVO> getMemberListWithCri(MemberCriteria cri);

	public int getMemberTotalCount(MemberCriteria cri);

	public void memberInfoUpdate(MbrVO mbrvo);

	public void deleteMbr(MbrVO mbrvo);

}