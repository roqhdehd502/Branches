package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

@Mapper
public interface AdminMapper {
	// 공지사항 작성 id 가져오기
	public MbrVO getNoticeMember(String mbr_id);

	// 공지사항 작성
	public void setNoticeWrite(BoardVO boardVO);

	// 매거진 작성 id 가져오기
	public MbrVO getMagazineMember(String mbr_id);

	// 매거진 작성
	public void setMagazineWrite(BoardVO boardVO);

	// 매거진 수정
	public void setMagazineModify(BoardVO boardVO);

	// 관리자 회원정보 조회(admin)
	public int getTotal(SearchCriteria cri);

	// 회원브랜드 조회(member), 관리자 회원정보 조회(admin)
	public List<MbrVO> getMemberList(SearchCriteria cri);

	public void memberInfoUpdate(MbrVO mbrvo); // admin customer

	public ShippingVO getSellerAddress(String m_id); // admin seller

	public void sellerAddressUpdate(MbrAddressVO mavo); // admin seller

	public void sellerInfoUpdate(MbrAddressVO mavo); // admin seller

	public void deleteMbrAdress(MbrAddressVO mavo); // admin seller 미완

	public void deleteMbrInfo(MbrAddressVO mavo); // admin seller 미완

	public List<MbrVO> getMemberListWithPaging(int auth, MemberCriteria cri); // admin

	public List<PrdctVO> getSellerPrdctListWithCri(PrdctListCriteria cri, String m_id); // admin seller
}