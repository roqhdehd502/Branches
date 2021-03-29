package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.KSPMapper;
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
public class KSPServiceImpl implements KSPService {
	private KSPMapper kspMapper;

	@Override
	public MbrVO getMemberInfo(String s_id) { //
		// TODO Auto-generated method stub
		return kspMapper.getMemberInfo(s_id);
	}

	@Override
	public MbrVO getMemberInfoByName(String search) {
		// TODO Auto-generated method stub
		return kspMapper.getMemberInfoByName(search);
	}

	@Override
	public List<InquiryVO> getInquiry() {
		// TODO Auto-generated method stub
		return kspMapper.getInquiry();
	}

	/*
	 * @Override public List<PrdctVO> getPrdctList(String b_id) { // TODO Auto-generated method stub return kspMapper.getPrdctList(b_id); }
	 */

	/*
	 * @Override public List<PrdctVO> getSearchResult(String search) { // TODO Auto-generated method stub return kspMapper.getSearchResult(search); }
	 */

	/*
	 * @Override public List<MbrVO> getMemberList(int auth) { // TODO Auto-generated method stub return kspMapper.getMemberList(auth); }
	 */

	// =====================================================

	@Override
	public List<PrdctVO> getPrdctListWithCri(PrdctListCriteria cri) { // common
		// TODO Auto-generated method stub
		log.info("getListWithPaging()......");
		return kspMapper.getPrdctListWithPaging(cri);
	}

	@Override
	public int getTotalCount(PrdctListCriteria cri) {
		// TODO Auto-generated method stub
		log.info("getTotal()......");
		return kspMapper.getTotalCount(cri);
	}

	@Override
	public List<PrdctVO> getCategoryPrdctListWithCri(PrdctListCriteria cri, int c_id) { // common
		// TODO Auto-generated method stub
		return kspMapper.getCategoryPrdctList(cri, c_id);
	}

	@Override
	public int getCategoryTotalCount(PrdctListCriteria cri, int c_id) {
		// TODO Auto-generated method stub
		return kspMapper.getCategoryTotalCount(cri, c_id);
	}

	@Override
	public CategoryVO getCategory(int c_id) {
		// TODO Auto-generated method stub
		return kspMapper.getCategory(c_id);
	}

	@Override
	public List<PrdctVO> getBrandPrdctListWithCri(PrdctListCriteria cri, String b_id) { // common
		// TODO Auto-generated method stub
		return kspMapper.getBrandPrdctList(cri, b_id);
	}

	@Override
	public int getBrandTotalCount(PrdctListCriteria cri, String b_id) {
		// TODO Auto-generated method stub
		return kspMapper.getBrandTotalCount(cri, b_id);
	}

	@Override
	public void memberInfoUpdate(MbrVO mbrvo) { // admin seller member
		// TODO Auto-generated method stub
		log.info("memberInfoUpdate()......");
		kspMapper.memberInfoUpdate(mbrvo);
	}

	@Override
	public ShippingVO getSellerAddress(String m_id) { // admin seller
		// TODO Auto-generated method stub
		return kspMapper.getSellerAddress(m_id);
	}

	@Override
	public void sellerInfoUpdate(MbrAddressVO mavo) { // admin seller
		// TODO Auto-generated method stub
		log.info("sellerInfoUpdate()......");
		kspMapper.sellerInfoUpdate(mavo);
		kspMapper.sellerAddressUpdate(mavo);
	}

	@Override
	public void deleteMbr(MbrAddressVO mavo) { // admin member
		// TODO Auto-generated method stub
		log.info("delete member");
		kspMapper.deleteMbrAdress(mavo);
		kspMapper.deleteMbrInfo(mavo);
	}

	@Override
	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri) { // admin
		// TODO Auto-generated method stub
		return kspMapper.getMemberListWithPaging(auth, cri);
	}

	@Override
	public int getSellerTotalCount(int auth, MemberCriteria cri) { // admin
		// TODO Auto-generated method stub
		return kspMapper.getSellerTotalCount(auth, cri);
	}

	@Override
	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id) { // admin
		// TODO Auto-generated method stub
		return kspMapper.getSellerPrdctListWithCri(cri, m_id);
	}

	@Override
	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id) { // admin
		// TODO Auto-generated method stub
		String b_id = m_id;
		return kspMapper.getBrandTotalCount(cri, b_id);
	}

}