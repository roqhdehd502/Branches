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
	public MbrVO getMemberInfo(String s_id);

	public MbrVO getMemberInfoByName(String search);

	public List<InquiryVO> getInquiry(); // 문의유형 리스트 가져오기

	public List<PrdctVO> getPrdctListWithCri(PrdctListCriteria cri); // prdct_list

	public int getTotalCount(PrdctListCriteria cri); // prdct_list

	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id); // category_prdct_list

	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id); // category_prdct_list

	public CategoryVO getCategory(int c_id); // category_prdct_list

	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id); // brand_prdct_list

	public int getBrandTotalCount(PrdctListCriteria cri, String b_id); // brand_prdct_list

	public void memberInfoUpdate(MbrVO mbrvo); // member info update

	public ShippingVO getSellerAddress(String m_id); // seller info update

	public void sellerInfoUpdate(MbrAddressVO mavo); // seller info update

	public void deleteMbr(MbrAddressVO mavo); // admin

	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri); // 회원목록조회

	public int getSellerTotalCount(int auth, MemberCriteria cri); // admin

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id); // admin sellerlist

	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id); // admin

}
