package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

public interface KSPRestService {

	// 판매자 마이페이지
	// 회원id로 정보조회
	public MbrVO getMemberInfo(String s_id);

	// 문의유형 받아오기
	public List<InquiryVO> getInquiry();

	// 회원목록조회
	public List<MbrVO> getMemberList(int auth);

	// 전체상품리스트
	public List<PrdctVO> getPrdctListWithCri(PrdctListCriteria cri);

	public int getTotalCount(PrdctListCriteria cri);

	// 카테고리별 상품리스트
	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id);

	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id);

	// 카테고리 이름 반환
	public CategoryVO getCategory(int c_id);

	// 브랜드(판매자)별 상품리스트 반환
	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id);

	public int getBrandTotalCount(PrdctListCriteria cri, String b_id);

	// 회원정보수정
	public void memberInfoUpdate(MbrVO mbrvo);

	// 판매자 배송지 반환
	public ShippingVO getSellerAddress(String m_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrAddressVO mavo);

	// 회원 탈퇴 처리 (미완)
	public void deleteMbr(MbrAddressVO mavo);

	// 회원 등급별 리스트
	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri); // 회원목록조회

	public int getMemberTotalCount(int auth, MemberCriteria cri);

}
