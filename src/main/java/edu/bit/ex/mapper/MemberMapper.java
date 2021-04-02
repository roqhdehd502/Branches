package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface MemberMapper {

	// 상품 Q&A 등록 페이지
	public PrdctVO getProductQnARegister(String prdct_id);

	// 판매자 마이페이지
	public MbrVO getMemberInfo(String s_id);

	// member info update
	public void memberInfoUpdate(MbrVO mbrvo); // admin customer

	// 리뷰 등록 페이지
	public MbrVO getCustomerInfo(String mbr_id);

	// 리뷰 등록 작성
	public void rivewWrite(BoardVO boardVO);

	// 리뷰 마이페이지 리스트
	public List<PrdctOrderVO> reviewMyList(String member_id);

}