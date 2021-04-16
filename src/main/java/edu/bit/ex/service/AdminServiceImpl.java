package edu.bit.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.mapper.AdminMapper;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	@Autowired
	PasswordEncoder passEncoder;

	// 고객 Q&A 페이징 리스트
	/*
	 * @Override public List<BoardVO> getUserQnAListWithCri(UserQnACriteria cri) { // TODO Auto-generated method stub
	 * log.info("getUserQnAListWithCri"); return adminMapper.getUserQnAListWithCri(cri); }
	 * 
	 * @Override public int getUserQnATotalCount(UserQnACriteria cri) { // TODO Auto-generated method stub log.info("getUserQnATotal"); return
	 * adminMapper.getUserQnATotalCount(cri); }
	 */

	// 판매자 페이징 리스트
	@Override
	public List<MbrVO> getSellerListWithCri(MemberCriteria cri) {
		// TODO Auto-generated method stub
		log.info("getSellerListWithPaging");
		return adminMapper.getSellerListWithCri(cri);
	}

	@Override
	public int getSellerTotalCount(MemberCriteria cri) {
		// TODO Auto-generated method stub
		log.info("getSellerTotalCount");
		return adminMapper.getSellerTotalCount(cri);
	}

	// 회원 상세 정보
	@Override
	public MbrVO getMemberInfo(String m_id) {
		// TODO Auto-generated method stub
		log.info("getMemberInfo");
		return adminMapper.getMemberInfo(m_id);
	}

	// 판매자 배송지
	@Override
	public ShippingVO getSellerAddress(String m_id) {
		// TODO Auto-generated method stub
		log.info("getSellerAddress");
		return adminMapper.getSellerAddress(m_id);
	}

	// 판매자 별 상품 페이징 리스트
	@Override
	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id) {
		// TODO Auto-generated method stub
		log.info("getSellerPrdctListWithCri");
		return adminMapper.getSellerPrdctListWithCri(cri, m_id);
	}

	@Override
	public List<BoardVO> getPrdctImg(String m_id) {
		// TODO Auto-generated method stub
		log.info("getSellerPrdctListWithCri");
		return adminMapper.getPrdctImg(m_id);
	}

	@Override
	public int getSellerPrdctTotalCount(PrdctListCriteria cri, String m_id) {
		// TODO Auto-generated method stub
		log.info("getSellerPrdctTotalCount");
		return adminMapper.getSellerPrdctTotalCount(cri, m_id);
	}

	// 판매자 정보 수정
	@Override
	public void sellerInfoUpdate(MbrShippingVO mavo) {
		// TODO Auto-generated method stub
		log.info("sellerInfoUpdate");
		String pw = passEncoder.encode(mavo.getMbr_pw());
		mavo.setMbr_pw(pw);

		adminMapper.sellerInfoUpdate(mavo);
		adminMapper.sellerAddressUpdate(mavo);
	}

	// 판매자 삭제(탈퇴)=====보류
	@Override
	public void deleteSeller(MbrShippingVO mavo) {
		// TODO Auto-generated method stub
		log.info("deleteSeller");
		// adminMapper.deleteSeller(mavo);
	}

	// 회원 페이징 리스트
	@Override
	public List<MbrVO> getMemberListWithCri(MemberCriteria cri) {
		// TODO Auto-generated method stub
		log.info("getMemberListWithCri");
		return adminMapper.getMemberListWithCri(cri);
	}

	@Override
	public int getMemberTotalCount(MemberCriteria cri) {
		// TODO Auto-generated method stub
		log.info("getMemberTotalCount");
		return adminMapper.getMemberTotalCount(cri);
	}

	// 회원 정보 수정
	@Override
	public void memberInfoUpdate(MbrVO mbrvo) {
		// TODO Auto-generated method stub
		log.info("memberInfoUpdate");
		String pw = passEncoder.encode(mbrvo.getMbr_pw());
		mbrvo.setMbr_pw(pw);

		adminMapper.memberInfoUpdate(mbrvo);
	}

	// 회원 삭제(탈퇴)=======보류
	@Override
	public void deleteMbr(MbrVO mbrvo) {
		// TODO Auto-generated method stub
		log.info("deleteMbr");
		// adminMapper.deleteMbr(mbrvo);
	}

	@Override
	public void addSeller(MbrShippingVO mbrShippingVO) {
		// TODO Auto-generated method stub
		log.info("addSeller");

		String pw = passEncoder.encode(mbrShippingVO.getMbr_pw());
		mbrShippingVO.setMbr_pw(pw);

		adminMapper.addSellerInfo(mbrShippingVO);
		adminMapper.addSellerAddress(mbrShippingVO);
	}

	@Override
	public PrdctVO getPrdctInfo(String p_id) {
		// TODO Auto-generated method stub
		return adminMapper.getPrdctInfo(p_id);
	}

	@Override
	public BoardVO getPrdctContent(String p_id) {
		// TODO Auto-generated method stub
		return adminMapper.getPrdctContent(p_id);
	}

	@Override
	public void updatePrdctInfo(PrdctRegisterImageVO prvo) {
		// TODO Auto-generated method stub
		adminMapper.updatePrdctInfo(prvo);
		adminMapper.updatePrdctBoardInfo(prvo);
	}

	@Override
	public List<PrdctRegisterImageVO> getSellerPrdctList(String m_id) {
		// TODO Auto-generated method stub
		return adminMapper.getSellerPrdctList(m_id);
	}

}