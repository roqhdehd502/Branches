package edu.bit.ex.service;

import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;

public interface CustomerService {

	// 상품 Q&A 등록 페이지
	public PrdctVO getProductQnARegister(String prdct_id);

	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	// member info update
	public void memberInfoUpdate(MbrVO mbrvo);

}