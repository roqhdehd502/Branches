package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;

public interface KSPService {
	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id); // 회원id로 정보조회

	public MbrVO getMemberInfoByName(String search); // 회원이름으로 정보조회

	public List<InquiryVO> getInquiry(); // 문의유형 받아오기

	public List<PrdctVO> getPrdctList(String b_id); // 브랜드별 상품 받아오기

	public List<PrdctVO> getSearchResult(String search); // 검색어입력

	public List<MbrVO> getMemberList(int auth); // 회원목록조회
}
