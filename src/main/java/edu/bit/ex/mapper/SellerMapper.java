package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface SellerMapper {

	// 주문상세 정보 불러오기
	public List<OrderDetailVO> getOrderDetail();

	// 상품 정보 불러오기
	public List<PrdctRegisterImageVO> getProduct();

	// 상품 주문 정보 불러오기
	public List<PrdctOrderVO> getPrdOrder();

	// 게시판 정보 불러오기
	public List<BoardVO> getBoard(SearchCriteria cri);

	// 판매자 정보 불러오기
	public MbrVO getMemberInfo(String s_id);

	// 판매자 정보 수정
	public void sellerInfoUpdate(MbrShippingVO mavo);

	// 상품 수정

	public void prdctContentUpdate(PrdctRegisterImageVO prvo);

	// 상품 삭제
	public void prdctDelete(String prdct_id);

	// 상품 등록
	public void prdInsert(PrdctRegisterImageVO PrdctImageVO);

	public PrdctVO getOption(String getPrdct_id);

	/* public void setPrdctImage(String saveName); */

	// 판매자 주소 불러오기 (상품 등록시)
	public ShippingVO getAddress(String getMbr_id);

	// 카테고리 목록 불러오기
	public List<CategoryVO> getCategory();

	// 게시글 내용 불러오기(상품 수정시)
	public BoardVO getContent(String getPrdct_id);

	// 상품 등록글 불러오기 - 내림차순 (상품 조회시)
	public List<PrdctRegisterImageVO> getbNumDesc(SearchCriteria cri);

	// 상품q&a 게시글 총 수 불러오기
	public int getTotal(SearchCriteria cri);

	// 상품조회 게시글 총 수 불러오기
	public int getPrdTotal(SearchCriteria cri);

	public void updatePrdctInfo(PrdctRegisterImageVO prvo);

	public List<PrdctVO> prdctThumbnail();

	public PrdctVO getPrdctInfo(String prdct_id);

}