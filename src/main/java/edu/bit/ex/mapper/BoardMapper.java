package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;

@Mapper
public interface BoardMapper {
	// 공지사항 게시판 리스트
	public List<BoardVO> getNoticeList();

	// 페이징을 적용한 게시글 불러오기
	public List<BoardVO> getNoticeListWithPaging(Criteria cri);

	// 페이징이 적용되는 게시글 수 단위
	public int getTotalCount(Criteria cri);

	// 공지사항 작성 id 가져오기
	public MbrVO getNoticeMember(String mbr_id);

	// 공지사항 작성
	public void setNoticeWrite(BoardVO boardVO);

	// 공지사항 게시글
	public BoardVO getNoticeContent(int board_id);

	// 공지사항 삭제
	public int noticeRemove(int board_id);

	// 공지사항 수정
	public void setNoticeModify(BoardVO boardVO);

	// 매거진 게시판 리스트
	public List<BoardVO> getMagazineList();

	// 매거진 게시글
	public BoardVO getMagazineContent(int board_id);

}