package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.CustomerMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class CustomerServiceImpl implements CustomerService {
	private CustomerMapper customerMapper;

	// 상품 Q&A 등록 페이지
	@Override
	public PrdctVO getProductQnARegister(String prdct_id) {
		log.info("getProductQnARegister");
		return customerMapper.getProductQnARegister(prdct_id);
	}

	// 판매자 마이페이지
	@Override
	public MbrVO getMemberInfo(String s_id) {

		return customerMapper.getMemberInfo(s_id);
	}

	// member info update
	@Override
	public void memberInfoUpdate(MbrVO mbrvo) { // admin seller member
		// TODO Auto-generated method stub
		log.info("memberInfoUpdate()......");
		customerMapper.memberInfoUpdate(mbrvo);
	}

	// 리뷰 등록 페이지
	@Override
	public MbrVO getCustomerInfo(String mbr_id) {
		log.info("getCustomerInfo()......");
		return customerMapper.getCustomerInfo(mbr_id);
	}

	// 리뷰 등록 작성
	@Override
	public void setReviewWrite(BoardVO boardVO) {
		customerMapper.rivewWrite(boardVO);

	}

}