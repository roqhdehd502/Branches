package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;

public interface KSPService {
	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	public MbrVO getMemberInfoByName(String search);

	public List<InquiryVO> getInquiry();

	public List<PrdctVO> getPrdctList(String b_id);

	public List<PrdctVO> getSearchResult(String search);
}
