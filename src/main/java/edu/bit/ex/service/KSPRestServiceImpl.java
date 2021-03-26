package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.KSPRestMapper;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class KSPRestServiceImpl implements KSPRestService {
	private KSPRestMapper kspMapper;

	@Override
	public MbrVO getMemberInfo(String s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InquiryVO> getInquiry() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MbrVO> getMemberList(int auth) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctVO> getPrdctListWithCri(PrdctListCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(PrdctListCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CategoryVO getCategory(int c_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBrandTotalCount(PrdctListCriteria cri, String b_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void memberInfoUpdate(MbrVO mbrvo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ShippingVO getSellerAddress(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void sellerInfoUpdate(MbrAddressVO mavo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMbr(MbrAddressVO mavo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMemberTotalCount(int auth, MemberCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}