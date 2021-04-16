package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardVO;
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

	// 판매자 리스트
	public List<MbrVO> getSellerListWithCri(MemberCriteria cri);

	public int getSellerTotalCount(MemberCriteria cri);

	// 특정 회원 아이디로 조회
	public MbrVO getMemberInfo(String m_id);

	// 판매자 주소 조회
	public ShippingVO getSellerAddress(String m_id);

	// 판매자 상품 조회
	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public List<BoardVO> getPrdctImg(String m_id);

	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrShippingVO mavo);

	// 판매자 삭제(탈퇴)
	public void deleteSeller(MbrShippingVO mavo);

	// 회원 리스트
	public List<MbrVO> getMemberListWithCri(MemberCriteria cri);

	public int getMemberTotalCount(MemberCriteria cri);

	// 회원 정보 수정
	public void memberInfoUpdate(MbrVO mbrvo);

	// 회원 삭제(탈퇴)
	public void deleteMbr(MbrVO mbrvo);

	// 판매자 등록
	public void addSeller(MbrShippingVO mbrShippingVO);

	public PrdctVO getPrdctInfo(String p_id);

	public BoardVO getPrdctContent(String p_id);

	public void updatePrdctInfo(PrdctRegisterImageVO prvo);

	public List<PrdctRegisterImageVO> getSellerPrdctList(String m_id);

}