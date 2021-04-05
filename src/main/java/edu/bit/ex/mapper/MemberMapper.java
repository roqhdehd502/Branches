package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctOrderVO;

@Mapper
public interface MemberMapper {

	// 상품 Q&A 등록 페이지
	public MbrVO getPrdctQnaInfo(String mbr_id);

	// 상품 QnA 등록 작성
	public void prdctQnaWrite(BoardVO boardVO);

	// 상품 QnA 마이페이지 리스트
	public List<BoardVO> prdctqMyList(String member_id);

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