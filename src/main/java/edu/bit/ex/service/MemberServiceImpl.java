package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.MemberMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;

	// 상품 Q&A 등록 페이지
	@Override
	public PrdctVO getProductQnARegister(String prdct_id) {
		log.info("getProductQnARegister");
		return memberMapper.getProductQnARegister(prdct_id);
	}

	// 판매자 마이페이지
	@Override
	public MbrVO getMemberInfo(String s_id) {

		return memberMapper.getMemberInfo(s_id);
	}

	// member info update
	@Override
	public void memberInfoUpdate(MbrVO mbrvo) { // admin seller member
		// TODO Auto-generated method stub
		log.info("memberInfoUpdate()......");
		memberMapper.memberInfoUpdate(mbrvo);
	}

	// 리뷰 등록 페이지
	@Override
	public MbrVO getCustomerInfo(String mbr_id) {
		log.info("getCustomerInfo()......");
		return memberMapper.getCustomerInfo(mbr_id);
	}

	// 리뷰 등록 작성
	@Override
	public void setReviewWrite(BoardVO boardVO) {
		log.info("setReviewWrite()......");
		memberMapper.rivewWrite(boardVO);

	}

	// 리뷰 마이페이지 리스트
	@Override
	public List<PrdctOrderVO> getReviewMyList(String member_id) {
		log.info("getReviewMyList()......");
		return memberMapper.reviewMyList(member_id);
	}

}