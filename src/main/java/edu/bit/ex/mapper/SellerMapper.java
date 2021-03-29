package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface SellerMapper {
	// 판매자 상품 Q&A조회(seller), 판매자 상품 리뷰조회(seller), 관리자 유저 Q&A 조회(admin)
	@Select("select * from board")
	public List<BoardVO> getBoard();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 취소확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller)
	@Select("select * from order_detail")
	public List<OrderDetailVO> getOrder();

	// 판매자 마이페이지(seller), 판매자 주문확인(seller), 판매자 발송확인(seller), 판매자 환불확인(seller), 판매자 교환확인(seller), 판매자 매출조회(seller), 관리자 매출조회(admin), 관리자 매출 조회
	// 검색(admin)
	@Select("select * from prdct_order")
	public List<PrdctOrderVO> getPrdOrder();

	public ShippingVO getSellerAddress(String m_id); // admin seller

	public void sellerAddressUpdate(MbrAddressVO mavo); // admin seller

	public void sellerInfoUpdate(MbrAddressVO mavo); // admin seller

	public void deleteMbrAdress(MbrAddressVO mavo); // admin seller 미완

	public void deleteMbrInfo(MbrAddressVO mavo); // admin seller 미완

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id); // admin seller
}