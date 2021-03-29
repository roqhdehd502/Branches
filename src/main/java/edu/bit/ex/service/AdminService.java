package edu.bit.ex.service;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;

public interface AdminService {
	// 공지사항 작성 id 가져오기
	public MbrVO getNoticeMember(String mbr_id);

	// 공지사항 작성
	public void setNoticeWrite(BoardVO boardVO);

	// 공지사항 삭제
	public int noticeRemove(int board_id);

	// 공지사항 수정
	public void setNoticeModify(BoardVO boardVO);

	// 매거진 작성 id 가져오기
	public MbrVO getMagazineMember(String mbr_id);

	// 매거진 작성
	public void setMagazineWrite(BoardVO boardVO);

	// 매거진 수정
	public void setMagazineModify(BoardVO boardVO);

	// 관리자 회원정보 조회(admin)
	public int getTotal(SearchCriteria cri);
}