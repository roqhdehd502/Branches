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

public interface KSPService {
	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id); // 회원id로 정보조회

	public MbrVO getMemberInfoByName(String search); // 회원이름으로 정보조회

	public List<InquiryVO> getInquiry(); // 문의유형 받아오기

	public List<PrdctVO> getPrdctList(String b_id); // 브랜드별 상품 받아오기

	public List<PrdctVO> getSearchResult(String search); // 검색어입력

	public List<MbrVO> getMemberList(int auth); // 회원목록조회

	public List<PrdctVO> getPrdctListWithCri(PrdctListCriteria cri);

	public int getTotalCount(PrdctListCriteria cri);

	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id);

	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id);

	public CategoryVO getCategory(int c_id);

	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id);

	public int getBrandTotalCount(PrdctListCriteria cri, String b_id);

	public void memberInfoUpdate(MbrVO mbrvo);

	public ShippingVO getSellerAddress(String m_id);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void deleteMbr(MbrAddressVO mavo);

	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri); // 회원목록조회

	public int getSellerTotalCount(int auth, MemberCriteria cri);

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public int getSellerotalCount(PrdctListCriteria cri, String m_id);

}
