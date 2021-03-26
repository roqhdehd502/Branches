package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface KSPRestMapper {

	@Select("select * from mbr where mbr_id=#{m_id}")
	public MbrVO getMemberInfo(String s_id);

	@Select("select * from mbr where mbr_name=#{search}")
	public MbrVO getMemberInfoByName(String search);

	@Select("select * from Inquiry")
	public List<InquiryVO> getInquiry();

	@Select("select * from prdct where mbr_id=#{b_id}")
	public List<PrdctVO> getPrdctList(String b_id);

	@Select("select * from prdct where prdct_name=#{search}")
	public List<PrdctVO> getSearchResult(String search);

	@Select("select * from mbr where authority_number=#{auth}")
	public List<MbrVO> getMemberList(int auth);

	/* restcontroller */

	public List<PrdctVO> getPrdctListWithPaging(PrdctListCriteria cri);

	public int getTotalCount(PrdctListCriteria cri);

	public List<PrdctVO> getCategoryPrdctList(PrdctListCriteria cri, int c_id);

	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id);

	public CategoryVO getCategory(int c_id);

	public List<PrdctVO> getBrandPrdctList(PrdctListCriteria cri, String b_id);

	public int getBrandTotalCount(PrdctListCriteria cri, String b_id);

	public void memberInfoUpdate(MbrVO mbrvo);

	public ShippingVO getSellerAddress(String m_id);

	public void sellerAddressUpdate(MbrAddressVO mavo);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void deleteMbrAdress(MbrAddressVO mavo);

	public void deleteMbrInfo(MbrAddressVO mavo);

	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri);

	public int getSellerTotalCount(int auth, MemberCriteria cri);

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id);

	public int getSellerPrdctCount(PrdctListCriteria cri, String b_id);

}