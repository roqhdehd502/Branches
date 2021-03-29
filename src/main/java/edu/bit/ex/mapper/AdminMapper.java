package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;

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
}